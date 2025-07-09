# Permissions & ACL – core-pool datasets

## Quick-view matrix

| Dataset | Protocol | ACL type | Owner | Purpose |
|---------|----------|----------|-------|---------|
| `lab/` | SMB | **NFSv4** | `labuser` | Windows / macOS lab share |
| `agency/` | SMB | **NFSv4** | `agencyuser` | Business share |
| `lab/backups/pbs/` | NFS | **POSIX** | `root` | Backup target for Proxmox Backup Server |

---

## POSIX vs NFSv4 ACL – when to pick which

| Feature | POSIX ACL | NFSv4 ACL (Windows-style) |
|---------|-----------|---------------------------|
| Best for       | Linux / NFS        | Windows / SMB (also macOS) |
| GUI management | Limited            | Full in TrueNAS SCALE |
| Granularity    | Basic (u/g/o)      | Fine-grained (read / write / list, inheritance) |

> **Rule of thumb**  
> • **SMB share ➜ NFSv4 ACL**     
> • **Pure NFS export ➜ POSIX ACL**

---

## Configure `lab/` dataset (SMB + NFSv4)

Dataset path: `/mnt/core-pool/lab`

1. **Datasets ▸ lab ▸ Edit**  
   * ACL Type → **NFSv4**  
   * Apply recursively ✔  
2. **Set ownership**  
   * Owner **User = labuser**  
   * Owner **Group = labuser** (optional)  
3. **ACL entries**  
   * `labuser` – **Full control**  
   * `root`     – **Full control** (safety)  
   * Tighten or remove `everyone@` as required  

![ACL editor](../assets/screenshot/acl-editor-dataset.png)

4. **Test from Windows**  
   `\\truenas\lab` → prompt for *labuser* credentials → create / delete a file.

---

## Configure `lab/backups/pbs/` dataset (NFS + POSIX)

Dataset path: `/mnt/core-pool/lab/backups/pbs`

```bash
chown root:root /mnt/core-pool/lab/backups/pbs
chmod 770      /mnt/core-pool/lab/backups/pbs
```

## Validation

```bash
nfs4xdr −p /mnt/core-pool/lab
```

## Tips & gotchas

- Use GUI editor for NFSv4 ACLs – mixing chmod with NFSv4 trees can break inheritance.
- Restart the SMB service after large ACL changes for Windows clients to re-scan permissions.
- Snapshot tasks inherit ACLs automatically.