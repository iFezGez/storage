# K8 Hybrid Lab (Tutorial)

This repository contains **placeholder‑safe** documentation for a hybrid Kubernetes lab.
It is intended for customer demos and internal enablement.

## Scope
- On‑prem control plane (3 nodes)
- Cloud edge worker for DMZ ingress
- `kubeadm` bootstrap
- `containerd` runtime
- CNI + Ingress
- Tailscale subnet routing
- Metrics for Lens

## Safety
- Do **not** include real IPs, credentials, or customer data.
- Replace placeholders (e.g. `<CONTROL_PLANE_IP>`) with your values at deployment time.

## Docs
- `docs/k8/hybrid/overview.md`
- `docs/k8/hybrid/phase1-bootstrap-node1.md`
- `docs/k8/hybrid/phase2-join-nodes.md`
- `docs/k8/hybrid/phase3-tailscale-oracle.md`
- `docs/k8/hybrid/phase4-observability.md`
