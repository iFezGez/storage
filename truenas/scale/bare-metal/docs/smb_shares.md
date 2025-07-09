# SMB / NFS Shares – core-pool

## Quick-view matrix

| Share name | Dataset path                     | Protocol | Access group | Purpose                  |
|------------|----------------------------------|----------|--------------|--------------------------|
| **root**   | `/mnt/core-pool`                 | SMB      | `root`       | Admin-level for all data |
| **lab**    | `/mnt/core-pool/lab`             | SMB      | `labuser`    | Lab services & repos     |
| **agency** | `/mnt/core-pool/agency`          | SMB      | `agencyuser` | Business documents       |
| **lab-backup** | `/mnt/core-pool/lab/backups` | NFS      | `*` (ro)     | Off-host backups         |

---

## Prerequisites

- SMB and NFS services installed (TrueNAS SCALE 24.04 enables both by default)
- Users created: **labuser**, **agencyuser**
- `labuser` and `agencyuser` passwords set
- ACLs on corresponding datasets adjusted (see *Permissions* guide)

---

## Step 1 – Enable and start SMB service

| Menu path | Action | Purpose |
|-----------|--------|---------|
| **System › Services › SMB** | Toggle **Start automatically** + click **Start** | Keeps SMB up on every boot |

![SMB service running](../assets/screenshot/smb-service-running.png)

---

## Step 2 – Create SMB shares (UI)

| Menu path | Field/value | Notes |
|-----------|-------------|-------|
| **Sharing › Windows (SMB) › Add** | Path =`/mnt/core-pool` · Name =`root` | Admin share |
| | Path =`/mnt/core-pool/lab` · Name =`lab` | Lab share |
| | Path =`/mnt/core-pool/agency` · Name =`agency` | Business share |

![SMB shares list](../assets/screenshot/smb-shares-list.png)

---

## Step 3 – Enable shares at ZFS level (CLI)

```bash
zfs set sharesmb=on core-pool/lab
zfs set sharesmb=on core-pool/agency
```

## Step 4 – Create NFS export for backups

```bash
zfs set sharenfs=on core-pool/lab/backups
```

## Validation

smbclient -L //truenas -U labuser

Windows › \\truenas\agency

showmount -e truenas
