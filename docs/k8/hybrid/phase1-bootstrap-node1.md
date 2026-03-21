# Phase 1: Bootstrap First Control Plane Node

> Tutorial only. Replace placeholders (e.g. `<CONTROL_PLANE_IP>`) with your values.

## 1) Prepare the Host

```bash
sudo modprobe overlay
sudo modprobe br_netfilter

cat <<'EOT' | sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOT

cat <<'EOT' | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOT

sudo sysctl --system
```

Check swap is off:

```bash
swapon --show
```

## 2) Install and Configure `containerd`

```bash
sudo apt-get update -y
sudo apt-get install -y ca-certificates curl gnupg lsb-release apt-transport-https
sudo apt-get install -y containerd

sudo mkdir -p /etc/containerd
sudo containerd config default | sudo tee /etc/containerd/config.toml >/dev/null
sudo sed -i 's/SystemdCgroup = false/SystemdCgroup = true/' /etc/containerd/config.toml

sudo systemctl restart containerd
sudo systemctl enable containerd
```

## 3) Install Kubernetes Packages (stable v1.35)

```bash
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.35/deb/Release.key | \
  sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] \
https://pkgs.k8s.io/core:/stable:/v1.35/deb/ /' | \
  sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update -y
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
```

## 4) Initialize Control Plane

Example (replace placeholders):

```bash
sudo kubeadm init \
  --apiserver-advertise-address <CONTROL_PLANE_IP> \
  --control-plane-endpoint <CONTROL_PLANE_ENDPOINT> \
  --pod-network-cidr <POD_CIDR> \
  --service-cidr <SERVICE_CIDR>
```

Set kubeconfig for the admin user:

```bash
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

## 5) Install Calico CNI (Operator)

Replace `<CALICO_VERSION>` with a stable release tag (example: `v3.31.4`).

```bash
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/<CALICO_VERSION>/manifests/tigera-operator.yaml
curl -fsSL https://raw.githubusercontent.com/projectcalico/calico/<CALICO_VERSION>/manifests/custom-resources.yaml -o /tmp/custom-resources.yaml

# Ensure the CIDR matches your <POD_CIDR>
grep -n \"cidr\" /tmp/custom-resources.yaml

kubectl apply -f /tmp/custom-resources.yaml
```

Wait for calico components to be ready:

```bash
kubectl get pods -n calico-system
kubectl get nodes
```

## 6) Install Ingress NGINX (Bare Metal)

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/<INGRESS_VERSION>/deploy/static/provider/baremetal/deploy.yaml
kubectl rollout status deployment/ingress-nginx-controller -n ingress-nginx --timeout=180s
kubectl get svc -n ingress-nginx
```

If this is a **single-node** cluster, allow workloads on the control plane:

```bash
kubectl taint nodes <CONTROL_PLANE_NODE_NAME> node-role.kubernetes.io/control-plane:NoSchedule-
```

## Notes
- If your host reports a **pending kernel upgrade**, consider rebooting before `kubeadm init`.
