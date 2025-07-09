# VLAN Networking – TrueNAS SCALE

## Quick-view matrix

| VLAN | CIDR          | Tagged interface | Role / Notes                |
|------|--------------|------------------|-----------------------------|
| 30   | 10.30.0.0/24 | `vlan30`         | Storage traffic + Web UI    |
| 40   | 10.40.0.0/24 | *(future)*       | Backup / replication        |

---

## Prerequisites

- TrueNAS SCALE 24.04 freshly installed (no IP configured yet)
- at least **one trunk port** on the switch carrying VLAN 30 (and 40 later)
- Interface names in this guide:  
  - `enxe04c365168` → physical NIC (UP)  
  - `enp0s25`       → unused spare (DOWN)

---

## Step 1 – Create the VLAN interface (UI)

| Menu path | Action | Purpose |
|-----------|--------|---------|
| **Network ▸ Interfaces ▸ Add** | Select **Parent = enxe04c365168**<br>Type = **VLAN**<br>ID = **30**<br>Name = **vlan30** | Creates tagged interface |
| **vlan30 ▸ Edit** | Set **IP Address = 10.30.0.11/24** | Mgmt & storage subnet |

![Interfaces list with vlan30](../assets/screenshot/network-interfaces-vlan30.png)

---

## Step 2 – Validation

```bash
ping -c3 10.30.0.1
ip -c addr show vlan30
```
