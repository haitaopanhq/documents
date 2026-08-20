# UAT Serverless 可观测性接入规划

更新时间：2026-08-20
目标范围：`env="uat"`、`workload="serverless"`
目标平台：`observability.svc.plus`

## 1. 目标与约束

将 Supabase、Cloudflare、Cloud Run 的指标、日志和可选 Trace 汇聚到 VictoriaMetrics、VictoriaLogs、Grafana，同时保证：

- UAT 大盘只展示同时具有 `env="uat"` 与 `workload="serverless"` 的数据。
- VPS、生产和缺少任一标签的数据默认不展示。
- 每个来源使用独立凭据和独立入口，不复用 Grafana 管理员凭据。
- Secret 只通过 Vault / Secret Manager 注入，不写入 Git、镜像、URL 或日志。

## 2. 当前状态

已完成：

- Grafana Serverless 大盘已锁定为 UAT，指标与日志查询统一限制为双标签。
- Cloud Run CPU/内存面板已移除 VPS `node_*` 回退查询。
- Vector 已为 UAT 黑盒探针增加 `workload=serverless`。
- 缺少环境标签的外部日志不再默认归类为 UAT。

现有入口：

| 信号 | 入口 |
|---|---|
| Prometheus Remote Write | `https://observability.svc.plus/ingest/metrics/api/v1/write` |
| VictoriaLogs JSON Lines | `https://observability.svc.plus/ingest/logs/insert/jsonline` |
| OTLP Traces | `https://observability.svc.plus/ingest/otlp/v1/traces` |

外部 Supabase/Cloudflare 日志不应直接复用通用 JSON Lines 入口：Supabase 使用批量 JSON 数组，Cloudflare Logpush 需要独立认证和来源标签。

## 3. 凭据与阻塞项

Vault `kv/uat/serverless/` 当前有 `cloudflare`、`gcp`、`supabase` 三个 secret。本规划只记录字段名，不记录任何 secret 值。

| 来源 | 现有信息 | 状态 |
|---|---|---|
| Cloudflare | Account ID、API Token | Token 验证失败，暂不能创建 GraphQL exporter 或 Logpush job |
| GCP | Project、Region、Service Account Email、Workload Identity Provider | 项目可读取，但尚无 Pub/Sub 消费凭据/推送接收链路 |
| Supabase | Project Ref、数据库连接字段 | 缺少 Metrics API 专用 `sb_secret_...`；Log Drain 套餐/权限未确认 |

历史 secret 版本仍保留：Cloudflare v1–v3、GCP v1–v9、Supabase v1–v6，均未标记为 destroyed。确认不需要回滚后再清理。

Cloud Run 服务配置中还发现敏感连接串和应用密钥以明文环境变量存在。接入监控前应迁移到 Secret Manager，并轮换已暴露值。

## 4. 目标拓扑与标签

```text
Supabase Metrics API ── Prometheus/VictoriaMetrics scrape ──┐
Supabase Log Drain ── JSON-array adapter ─────────────────────┤
Cloudflare GraphQL/exporter ── Remote Write ──────────────────┤──> observability.svc.plus
Cloudflare Logpush ── authenticated HTTP adapter ────────────┤    VM + VL + Grafana
Cloud Run Cloud Monitoring ── metrics exporter/OTel ──────────┤
Cloud Run Cloud Logging ── Pub/Sub ── Vector ─────────────────┘
```

统一标签契约：

```text
env="uat"
workload="serverless"
source="supabase|cloudflare|cloudrun"
```

补充标签：

```text
supabase: project, service
cloudflare: account, zone, dataset, worker
cloudrun: project, region, service_name, revision_name
```

## 5. 分阶段实施

### 阶段 0：安全前置

1. 撤销并重新签发本次会话中暴露的 Vault Token。
2. 轮换 Cloud Run 明文环境变量中的数据库连接串、内部 token、认证密钥和管理员凭据。
3. 将 Cloud Run secret 迁移到 Secret Manager，服务只保留 secret 引用。
4. 为 Supabase、Cloudflare、GCP exporter 创建最小权限凭据。
5. 为三类来源配置独立 ingestion token，禁止把 token 放在普通查询参数中。

### 阶段 1：入口隔离与认证

新增来源专用入口：

```text
/ingest/supabase/logs
/ingest/cloudflare/logpush
/ingest/cloudrun/logs
```

入口需要校验来源 Header、限制请求体/速率、补齐标签；缺少 `env=uat` 或 `workload=serverless` 时拒绝或进入隔离流。

### 阶段 2：Supabase

指标使用：

```text
https://<project-ref>.supabase.co/customer/v1/privileged/metrics
```

建议 60 秒抓取，并附加 `env=uat`、`workload=serverless`、`source=supabase`、`project=iqkxspmhcfqmhkbjdoms`。需要新增独立的 Supabase Metrics API 凭据，不复用数据库密码。

日志在 Supabase Project Settings → Log Drains 创建 Custom HTTP drain：

```text
https://observability.svc.plus/ingest/supabase/logs
```

入口先把批量 JSON 数组展开成独立事件，再写入 VictoriaLogs。

### 阶段 3：Cloudflare

UAT zone/account 创建 HTTP Logpush job，目标：

```text
https://observability.svc.plus/ingest/cloudflare/logpush
```

只选择 UAT 数据集和必要字段，启用压缩、采样和 Header token。指标使用 Cloudflare GraphQL Analytics API 或受控 exporter 写入 Remote Write。Token 验证通过后再创建 job。

### 阶段 4：Cloud Run

当前 UAT 服务：`uat-accounts`、`uat-content-service`、`uat-billing-service`。

日志创建 Pub/Sub topic（例如 `cloudrun-uat-logs`）和 Cloud Logging sink：

```text
resource.type="cloud_run_revision"
resource.labels.service_name =~ "^uat-(accounts|content-service|billing-service)$"
```

由 Vector 的 GCP Pub/Sub source 消费，补充 `env=uat`、`workload=serverless`、服务标签。指标优先使用 Cloud Run Prometheus/OTel sidecar，备选为 Cloud Monitoring API exporter；写入 Remote Write 前必须进行 UAT 服务白名单过滤。

## 6. 验收标准

- Grafana 相关面板查询都包含 `env="uat",workload="serverless"`。
- `node_*`、VPS `up`、生产 zone/service 查询结果为零。
- 三个来源各至少有一条带完整标签的指标和日志样本。
- Cloud Run 日志只包含三个 `uat-*` 服务。
- 所有入口 token 可单独轮换，且不会出现在 Grafana URL、Git 或日志正文中。
- Vector、VictoriaMetrics、VictoriaLogs、Grafana 重启后配置仍可恢复。

## 7. 本次核对结果

- 已生成本规划文档。
- Cloudflare 现有 API Token 无效，未创建 Cloudflare job。
- GCP 项目和三个 UAT Cloud Run 服务存在，但未创建 Pub/Sub、Log sink 或 exporter，避免在没有消费者和最小权限凭据时产生数据堆积或越权。
- Supabase 尚未接入 Metrics API，原因是缺少专用 Metrics API secret；未使用数据库密码替代。
