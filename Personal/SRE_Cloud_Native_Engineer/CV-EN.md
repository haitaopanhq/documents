# Personal Information
- **Name**: Pan Haitao
- **Location**: Shanghai, China
- **Phone**: +86 19286470192
- **Email**: manbuzhe2008@gmail.com
- **LinkedIn**: [www.linkedin.com/in/haitaopan](www.linkedin.com/in/haitaopan)
- **Website**: http://www.svc.plus

# Core Competencies & Expertise (Tailored for Cloud-Native SRE)
- **Large-Scale Kubernetes Operations**: Deep expertise in designing, planning, and managing large-scale K8s environments (up to 200+ nodes and 1,600+ cores). Proven track record in orchestrating zero-downtime cross-version upgrades, capacity planning, and ensuring high SLA for large internet clients and financial institutions. Master of Linux OS internals and networking stacks.
- **Cloud-Native Ecosystem & Tooling Development**: Proficient in deploying and tuning core infrastructure open-source projects including Prometheus, Elasticsearch, Datadog, Vector, eBPF, and various CNI (e.g., NSX-T). Engineered advanced DevOps platforms and IaC toolchains (XCloudFlow, XConfig) using Rust and Python. Highly capable of developing SRE tools and automating containerized deployments.
- **High-Concurrency Troubleshooting & OnCall**: Extensive field experience providing Tier-3 OnCall support for mission-critical core networks, container PaaS clouds, and industrial control systems (China Telecom Finance, Everbright Bank). Highly skilled in Pcap deep packet analysis, system bottleneck pinpointing, and rapid incident response to secure operational continuity alongside R&D teams.
- **Large-Scale GPU Cluster & AI Infra (Bonus)**: Spearheaded the management of hybrid GPU infrastructure for internal AI workloads at Tesla (Shanghai). Successfully integrated localized K8s scheduling and public cloud AI services, ensuring high-availability computing for massive-scale model inference.
- **Open-Source Contribution & K8s Custom Development (Bonus)**: Author of multiple cloud-native observability and DevOps frameworks (XConfig, XScopeHub). Highly experienced in Rust Agent development and IaC declarative rollouts, showcasing strong capabilities in deep cloud-native customization, custom scheduling patterns, and eBPF deployment.

# Education
| Time Range        | Highest Degree | School           | Major             |
| ------------------| -------------- | ---------------- | ----------------- |
| 2006.9 ~ 2010.6   | Bachelor's     | Changchun University of Technology | Electrical Engineering and Automation |

# Work Experience
| **Duration**          | **Company**                               | **Job Title**                     |
|-----------------------|-------------------------------------------|-----------------------------------|
| 2024.11 ~ 2025.9     | Deepflow Technology Co., Ltd.             | Senior Technical Support Engineer |
| 2024.1 ~ 2024.5       | Tesla (Shanghai) Co., Ltd.               | Site Reliability Engineer          |
| 2022.3 ~ 2023.10      | Eccom Network System Co., Ltd.           | Senior Cloud Solution Architect    |
| 2021.12 ~ 2022.1      | Jiangshu BoCloud Technology Co., Ltd.    | Senior Solution Architect          |
| 2020.7 ~ 2021.11      | UCloud Technology Co., Ltd.               | Senior Solution Architect         |
| 2018.5 ~ 2020.6       | Alauda Cloud Technology Co., Ltd.        | Delivery Engineer                  |
| 2015.5 ~ 2018.4       | Tongxin Software Co., Ltd.               | Software Engineer                  |
| 2013.11 ~ 2015.4      | KnowSec Technology Co., Ltd.             | Operations Engineer                |
| 2013.5 ~ 2013.10      | Inspur Electronic Information Co., Ltd.  | System Software Engineer           |
| 2011.5 ~ 2013.4       | China Standard Software Co., Ltd.        | Software Engineer                  |

# Core Projects & Professional Experience (Ordered by JD Relevance)

## 1. Large-Scale Container PaaS Upgrade & OnCall SLA Assurance
**Project**: Container Cloud PaaS - Everbright Bank (2019.06-2020.06) | **Role**: On-site Implementation Engineer
- **Large-Scale K8s Governance**: Led the seamless cross-version upgrades and ongoing high availability of 8 production Kubernetes clusters. Optimized compute resources and cluster topologies to satisfy financial-grade requirements.
- **Native Infrastructure & CNI Interconnectivity**: Implemented, debugged, and resolved complex container interconnectivity issues utilizing the VMware CNI NSX-T overlay network plugin. Architected real-time dashboarding and alerting matrices via Elasticsearch and Prometheus.
- **OnCall & Severe Incident Management**: Executed a full year of on-site tier-3 support and OnCall rotation. Expertly triaged severe microservice network routing failures and K8s container scheduling bottlenecks, coordinating closely with developers to dramatically minimize MTTR.
- **DevOps Tooling R&D**: Re-engineered Jenkins CI pipelines to accomplish zero-touch automation for containerized business application lifecycles.

## 2. Distributed Architecture Design & Large-Scale K8s Migration
**Project**: Internet Enterprise Cloud Integrations - UCloud (2020.07-2021.11) | **Role**: Senior Solution Architect
- **Architecture Deployment & Capacity Analysis**: Authored overarching hybrid-cloud blueprints—including K8s containerization networking and distributed storage components (Ceph-style)—for massive internet clients like Walnut Education and Baiwang Cloud.
- **Massive Cluster Provisioning**: Directed the lossless workload migration to self-hosted K8s clusters (comprising 200+ nodes and 1,600+ computing cores), thoroughly modeling container storage mounts and network forwarding layers.
- **Observability Ecosystem Implementation**: Systematized and deployed cloud-native monitoring and logging suites (Prometheus/EFK) consistently across thousand-core setups.

## 3. Hybrid GPU Cluster & AI Infrastructure Operations
**Project**: Internal DevOps & SRE Initiatives - Tesla (Shanghai) (2024.01-2024.04) | **Role**: Site Reliability Engineer (SRE)
- **Heterogeneous K8s & GPU Hardware Ops**: Acted as primary SRE managing the hybrid GPU compute infrastructure supporting mission-critical internal AI workloads. Bridged localized resource scheduling algorithms with cloud AI services to guarantee highly available inference.
- **Business Deployment & SLA Guarantee**: Institutionalized GitOps deployment practices (via ArgoCD and GitHub Actions) to fully automate business application and edge node updates.
- **Emergency Incident Response**: Piloted proactive alert mechanisms and automated health checks. Frequently stepped in during critical network disruptions and server outages to decisively halt impact and safeguard production continuity.

## 4. Deep-Dive Network Collector R&D & High-Concurrency Troubleshooting
**Project**: Cloud-Native Traffic Collection Maintenance - DeepFlow (2024.11-2025.07) | **Role**: Network Observability Engineer
- **eBPF-Driven Observability Tooling**: Dissected eBPF kernel concepts to radically tune the DeepFlow network observabiliy agents operating within brutally high-concurrency data centers.
- **Complex Container Interconnectivity Diagnostics**: Parsed extreme volumes of Pcap flow data. Precision-identified and cured packet drops and microservice latency bottlenecks stemming from kernel TCP/IP stack limitations or faulty routing geometries.

## 5. Cloud-Native Automation Tooling R&D (Open Source)
- **XConfig** ([GitHub](https://github.com/svc-design/XConfig)): Developed a blazing-fast, decentralized cluster configuration and deployment scheduling Agent written exclusively in Rust. Evidences advanced systems programming, robust secondary development abilities, and custom daemon architecture.
- **XCloudFlow** ([GitHub](https://github.com/svc-design/XCloudFlow)): Independently designed a cloud-agnostic IaC workflow engine targeting rapid, reproducible deployments across disparate cluster environments.
- **XScopeHub** ([GitHub](https://github.com/svc-design/XScopeHub)): An observability data integration platform unifying the extraction and visualization of metrics/logs from cloud-native giants like Vector and OpenTelemetry.
