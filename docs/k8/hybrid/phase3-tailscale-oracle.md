# Phase 3: Tailscale + Oracle Edge Worker

> Tutorial only. Replace placeholders and do not use real credentials in docs.

## 1) Subnet Router on On‑Prem (control plane node)

Enable IP forwarding:

```bash
cat <<'EOT' | sudo tee /etc/sysctl.d/99-tailscale.conf
net.ipv4.ip_forward=1
net.ipv6.conf.all.forwarding=1
EOT
sudo sysctl --system
```

Install Tailscale and advertise on‑prem subnet:

```bash
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up --authkey <SUBNET_ROUTER_KEY> \
  --advertise-routes=<ON_PREM_SUBNET_CIDR> \
  --advertise-tags=tag:<SUBNET_TAG>
```

In Tailscale Admin Console:
- Approve the advertised route (`<ON_PREM_SUBNET_CIDR>`)
- Ensure the tag is allowed in ACLs

## 2) Oracle Node

Install and accept routes:

```bash
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up --authkey <ORACLE_KEY> --accept-routes
```

Verify connectivity to the API:

```bash
ping -c 3 <CONTROL_PLANE_IP>
curl -k https://<CONTROL_PLANE_ENDPOINT>:6443/healthz
```

## 3) Install Kubernetes on Oracle

Follow Phase 1 install steps (containerd + kubeadm/kubelet/kubectl), then join as worker:

```bash
sudo kubeadm join <CONTROL_PLANE_ENDPOINT>:6443 --token <TOKEN> \
  --discovery-token-ca-cert-hash sha256:<HASH>
```

## Notes
- Subnet routing is sufficient; exit nodes are not required.
- If metrics collection is needed from Oracle, ensure routes allow access to its kubelet endpoint.
