# Personal Information
- **Name**: Pan Haitao
- **Location**: Shanghai, China
- **Phone**: +86 19286470192
- **Email**: manbuzhe2008@gmail.com
- **LinkedIn**: [www.linkedin.com/in/haitaopan](www.linkedin.com/in/haitaopan)
- **Website**: http://www.svc.plus

# Core Competencies & Expertise (Tailored to Job Requirements)
- **AI Infrastructure & Heterogeneous Compute**: Proven hands-on experience at Tesla managing hybrid GPU infrastructures and deploying AI model serving frameworks (vLLM/SGLang/Ollama). Deeply involved in end-to-end setups spanning large-model integration, containerized resource scheduling, and RAG/AI Agent productionization.
- **Infrastructure Architecture & Hardware SLA**: 14 years of IT experience, specializing in massive-scale Kubernetes cluster architectures across hybrid/multi-cloud environments. Successfully led the design and migration of K8s clusters (200+ nodes, 1600+ cores), taking ownership of hardware-to-system high availability and SLA metrics.
- **Performance Tuning & Network Governance**: Intimate knowledge of Linux kernel internals and network protocols (NPM/APM, eBPF). At DeepFlow, resolved complex high-concurrency bottlenecks and packet loss issues for massive north-south traffic collectors.
- **Hardware Selection & Resource Management**: Adept at data center hardware capacity planning, server configuration selection, and storage layer optimization (e.g., DF Server distributed database tuning).
- **Software Engineering & Open Source**: Highly proficient in Python, Rust, and Shell scripting, with a solid grasp of Go and C/C++ paradigms. Creator and main contributor of open-source DevOps and observability platforms (AI Workspace), demonstrating excellent coding practices and architectural abstraction.
- **Advanced Tech Exploration**: Passionate about adopting cutting-edge technologies (RDMA, DPU network offloading, modern distributed storage) and establishing IaC (Terraform/Ansible)/GitOps ecosystems to maximize operational automation.

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

## 1. AI Infrastructure & GPU Cluster Operations 
**Project**: Tesla (Shanghai) Internal Service DevOps Evolution (2024.01-2024.04) | **Role**: Site Reliability Engineer (SRE)
- **AI Computing Scheduling**: Managed the hybrid GPU infrastructure for internal AI services, pooling local Kubernetes clusters with public cloud AI SaaS. Unified heterogeneous compute allocation and ensured stable deployment of underlying inference frameworks (vLLM/Ollama).
- **Hardware Cluster Reliability**: Monitored and analyzed operational metrics across edge control nodes, virtual machines, and container platforms, drastically reducing hardware-induced system downtimes and ensuring production SLA.
- **Automated Delivery**: Revamped core CI/CD pipelines via GitOps (ArgoCD) and GitHub Actions. Built automated Jenkins pipelines for firmware updates and edge node deployments.

## 2. Traffic Collection Systems & High-Concurrency Optimization
**Project**: North-South Traffic Collection System Maintenance - DeepFlow (2024.11-2025.07) | **Role**: Network Observability Engineer
- **High-Concurrency Tuning**: Tuned DeepFlow data collectors (Agents) powered by eBPF in massive-traffic core network environments. Handled Pcap flow analytics to diagnose and resolve extreme network congestion and packet loss bottlenecks.
- **Hardware Sizing & Storage Optimization**: Planned server hardware selection by forecasting traffic capacity metrics. Tuned the I/O and query performance of DF Server distributed databases to guarantee highly scalable foundational support.
- **Standardized Troubleshooting**: Established technical feedback loops, standardized troubleshooting SOPs, and authored comprehensive upgrade blueprints to ensure seamless cross-team collaboration.

## 3. Large-Scale AI Agent Platform Deployment 
**Project**: AI Agent Proof-of-Concept - COSCO Shipping (2025.07-2025.09) | **Role**: AI Operations Support Engineer
- **Environment Setup & Architecture**: Independently designed the containerized POC architecture, successfully integrating private LLM mounts and CI/CD pipelines to validate next-gen application infrastructure.
- **Cross-Team R&D Alignment**: Collaborated with development teams to test complex multi-role conversational workflows, task decomposition, and API tool invocation reliability, generating vital QA metrics for executive decision-making.

## 4. Large-Scale Infrastructure Architecture & Cloud Migration
**Project**: UCloud Hybrid Cloud Deployments (2020.07-2021.11) | **Role**: Senior Solution Architect
- **Infrastructure Blueprinting**: Evaluated complex network topologies to formulate overarching blueprints encompassing network segregation, distributed storage (Ceph-like), and Kubernetes foundations.
- **Cluster Governance**: Directed the lossless migration and compute reconstruction for major clients like Walnut Education (200+ nodes, 1600+ cores) and Baiwang Cloud.
- **Observability Metrics**: Deployed unified logging and alerting suites across thousands of delivery instances, exposing fine-grained operational metrics for hardware and application health.

## 5. Cloud-Native PaaS Platform Delivery
**Project**: Container Cloud PaaS - Everbright Bank (2019.06-2020.06) | **Role**: On-site Implementation Engineer
- **System Upgrades & Network Tuning**: Navigated zero-downtime upgrades for 8 production Kubernetes clusters. Tackled and solved severe underlying CNI integration issues (VMware NSX-T) to enhance platform high availability.
- **Closed-Loop Reliability**: Constructed Elasticsearch and Prometheus stacks to capture real-time business and infrastructure telemetry, leading emergency incident response and restoring critical services swiftly.

## 6. Linux Kernel OS Development & Hardware Porting
**Project**: Deepin Server OS / CS2C Linux Porting (2011.05-2018.04) | **Role**: Software Engineer
- **System Internals**: Deeply engaged in the R&D of the Deepin Server enterprise product and adapted the Linux kernel/drivers for the MIPS-based Loongson architecture, utilizing advanced low-level debugging tools.
- **Build Efficiency**: Automated RPM packaging flows via the Koji build system, boosting the CI compilation and validation throughput by over 40%.

# Personal Open-Source Contributions & R&D 
- **AI Workspace Lab** ([GitHub](https://github.com/ai-workspace-lab)): Founder and maintainer of an AI workspace designed for continuous task delivery. Developed XWorkmate, turning AI conversations into chained tool execution and verifiable delivery flows with multi-agent context inheritance.
- **AI Workspace Infra** ([GitHub](https://github.com/ai-workspace-infra)): Core contributor to cloud-native foundations for AI workspaces. Built a unified DevOps/GitOps toolkit integrating Gitea, Vault, Zitadel, and global observability for declarative multi-cloud infrastructure management.
- **AI Workspace Services** ([GitHub](https://github.com/ai-workspace-services)): Engineered the production service backbone, unifying the control panel, account/auth services, and global cross-network connectivity to power AI workloads and platform observability.

- **Navi** ([GitHub](https://github.com/svc-design/Navi)): An AI-assistant toolkit utilizing Large Language Models to boost R&D and DevOps productivity.
