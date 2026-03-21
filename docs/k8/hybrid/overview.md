# K8 Hybrid Lab (Tutorial)

This guide documents a **hybrid Kubernetes lab** where control plane nodes live on‑prem and an edge worker in a public cloud exposes DMZ services.

**Important**
- This is a tutorial. Replace all placeholders with your own values.
- Do not use real IPs, credentials, or customer data in this documentation.

## Goals
- Bootstrap a Kubernetes cluster with `kubeadm`.
- Use `containerd` as the runtime.
- Deploy a CNI and an Ingress controller.
- Keep documentation reproducible and safe for customer demos.

## High‑Level Topology (Example)
- On‑prem nodes (control plane + workers)
- Cloud edge worker for public ingress
- Private connectivity between sites (VPN or Tailscale)

## Example Node Set (Placeholders)
- Control plane: `<CP1_IP>`, `<CP2_IP>`, `<CP3_IP>`
- Edge worker (cloud): `<EDGE_IP>`

## Example Placeholders
- Control plane IP: `<CONTROL_PLANE_IP>`
- Pod CIDR: `<POD_CIDR>`
- Service CIDR: `<SERVICE_CIDR>`
- Cluster name: `<CLUSTER_NAME>`
- Tailscale/VPN interface: `<TUNNEL_IFACE>`
