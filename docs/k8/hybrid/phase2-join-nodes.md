# Phase 2: Join Additional Nodes (Control Plane + Worker)

> Tutorial only. Replace placeholders with your values.

## 1) Upload Certs (run on first control plane)

```bash
sudo kubeadm init phase upload-certs --upload-certs
```

Save the `certificate key` that appears.

## 2) Generate Join Command (run on first control plane)

```bash
kubeadm token create --print-join-command
```

## 3) Join a New Control Plane Node

```bash
sudo kubeadm join <CONTROL_PLANE_ENDPOINT>:6443 --token <TOKEN> \
  --discovery-token-ca-cert-hash sha256:<HASH> \
  --control-plane --certificate-key <CERT_KEY>
```

## 4) Join a Worker Node

```bash
sudo kubeadm join <CONTROL_PLANE_ENDPOINT>:6443 --token <TOKEN> \
  --discovery-token-ca-cert-hash sha256:<HASH>
```

## 5) Verify

```bash
kubectl get nodes -o wide
```

## Notes
- If you accidentally joined as worker, you can `kubeadm reset -f` and re‑join with `--control-plane`.
- After you have worker nodes, consider re‑adding the control plane taint:

```bash
kubectl taint nodes <CONTROL_PLANE_NODE> node-role.kubernetes.io/control-plane:NoSchedule
```
