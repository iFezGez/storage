# Phase 4: Metrics for Lens (metrics-server)

> Tutorial only. Replace placeholders if needed.

## 1) Install metrics-server

```bash
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```

## 2) If kubelet certificates do not include IP SANs (lab default)

```bash
kubectl -n kube-system patch deployment metrics-server --type='json' -p='[
  {"op":"add","path":"/spec/template/spec/containers/0/args/-","value":"--kubelet-insecure-tls"},
  {"op":"add","path":"/spec/template/spec/containers/0/args/-","value":"--kubelet-preferred-address-types=InternalIP,Hostname,ExternalIP"}
]'
```

## 3) Verify

```bash
kubectl top nodes
```

## Notes
- In hybrid setups, metrics for remote nodes may require routable node IPs.
- Prefer secure kubelet certs in production; `--kubelet-insecure-tls` is for labs only.
