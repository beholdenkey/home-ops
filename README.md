<!-- markdownlint-disable MD033 MD041 -->
<div align="center">

# 🚀 Home Operations 🚧

</div>

<div align="center">

[![Renovate](https://img.shields.io/github/actions/workflow/status/onedr0p/home-ops/renovate.yaml?branch=main&label=&logo=renovatebot&style=for-the-badge&color=blue)](https://github.com/beholdenkey/home-ops/actions/workflows/renovate.yaml)

</div>

<div align="center">

[Talos](https://www.talos.dev/) • [Kubernetes](https://kubernetes.io/) • [Flux](https://fluxcd.io/) • [Renovate](https://github.com/renovatebot/renovate) • [GitHub Actions](https://github.com/features/actions)

</div>

## 💡 Overview

This repository holds my home infrastructure and Kubernetes cluster configuration. I aim to keep everything reproducible and documented by following Infrastructure as Code (IaC) and GitOps practices.

## 🌱 Kubernetes

The cluster runs on [Talos](https://www.talos.dev/). Workloads and storage share the same compute nodes, with additional services deployed via Helm and Kustomize under GitOps control.

### Core Components

- **Networking:** Cilium, Envoy Gateway, Cloudflare Tunnel
- **Security:** cert-manager, external-secrets, 1Password Connect
- **Storage:** OpenEBS / Ceph CSI
- **Automation:** Flux, Renovate, GitHub Actions

## 🗃️ Directories

The repository is organized around GitOps-managed Kubernetes manifests.

```text
kubernetes
├── apps         # application workloads
├── components   # shared kustomize components
└── flux         # flux system configuration
```

## ⚙️ Infrastructure

- Hypervisor: Proxmox VE
- Networking: Ubiquiti UniFi

## 🖥️ Hardware

### Compute Node

| Component       | Specification                |
| --------------- | ---------------------------- |
| Motherboard     | Supermicro H11DSi (Rev 2.00) |
| CPU             | 2 × AMD EPYC 7571            |
| Cores / Threads | 64 Cores / 128 Threads       |
| Memory          | 512 GB DDR4 ECC              |
| Memory Layout   | 16 × 32 GB DIMMs @ 2133 MT/s |
| GPU             | EVGA NVIDIA RTX 3080         |
| BMC             | ASPEED AST2500 (IPMI)        |
| Networking      | Dual Intel X550 10GbE        |

### Network & Storage Appliances

| Device            | Details                                         |
| ----------------- | ----------------------------------------------- |
| UniFi UDM Pro Max | Gateway / Firewall                              |
| UniFi PSU PDU Pro | Power Distribution                              |
| UniFi USW 24 PoE  | Access Switching                                |
| UNAS Pro          | NAS                                             |
| NAS Storage       | 2 × 24 TB HDD (RAID 5)<br>2 × 4 TB SSD (RAID 5) |

### Kubernetes Cluster

| Name                  | vCPUs | RAM   | OS    | Purpose                              |
| --------------------- | ----- | ----- | ----- | ------------------------------------ |
| homeops-controller-01 | 6     | 24GiB | Talos | Kubernetes Control Plane             |
| homeops-controller-02 | 6     | 24GiB | Talos | Kubernetes Control Plane             |
| homeops-controller-03 | 6     | 24GiB | Talos | Kubernetes Control Plane             |
| homeops-worker-01     | 6     | 48GiB | Talos | Kubernetes Worker / GPU Enabled Node |

## 🤝 Thanks

Big shout out to the [cluster-template](https://github.com/onedr0p/cluster-template), and the [Home Operations](https://discord.gg/home-operations) Discord community. Be sure to check out [kubesearch.dev](https://kubesearch.dev/) for ideas on how to deploy applications or get ideas on what you may deploy.
