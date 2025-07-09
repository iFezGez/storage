# NFS Export – lab-backup dataset

## Quick-view table

| Dataset                         | Export path                           | Allowed hosts | MapAll user/group |
|---------------------------------|---------------------------------------|---------------|-------------------|
| `core-pool/lab/backups/pbs`     | `/mnt/core-pool/lab/backups/pbs`      | `10.30.0.2`   | `root` / `root`   |

---

## Prerequisites

- TrueNAS SCALE 24.04 running  
- Dataset `core-pool/lab/backups/pbs` already created  
- Client `10.30.0.2` reachable over the storage VLAN  
- SMB service disabled on this path (to avoid sharing conflicts)

---

## Step 1 – Create the NFS share (GUI)

| Menu path | Action |
|-----------|--------|
| **Sharing ▸ Unix Shares (NFS) ▸ Add** | Path = `/mnt/core-pool/lab/backups/pbs` |
|  | Allowed hosts = `10.30.0.2` |
|  | MapAll **User = root**, **Group = root** |
|  | Save |

![NFS export](../assets/screenshot/nfs-share-lab-backup.png)

---

## Step 2 – Enable & start the NFS service

| Menu | Toggle | Purpose |
|------|--------|---------|
| **System ▸ Services ▸ NFS** | **Start automatically** + **Start** | Activates NFS daemon on boot |

---

## Step 3 – Validate from a Linux client

```bash
showmount -e 10.30.0.11
```

sudo mount -t nfs 10.30.0.11:/mnt/core-pool/lab/backups/pbs /mnt/truenas-backup
touch /mnt/truenas-backup/test.txt   # write-test
umount /mnt/truenas-backup
