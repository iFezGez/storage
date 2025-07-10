# Storage Repo

This repository contains reference implementations of storage platforms and file‐sharing services for Vesta Lab.  
Each service lives inside **`<service>/<version>/<deploy_type>/`** so multiple versions and deployment types can coexist.

| Service           | Version  | Deploy type   | Docs entry                                              |
|-------------------|----------|---------------|---------------------------------------------------------|
| **TrueNAS SCALE** | 23.10.1  | bare-metal    | [`truenas/scale/bare-metal/docs/`](truenas/scale/bare-metal/docs/) |
| **Nextcloud**     | 27       | Containerized | _placeholder_ |

## Structure
```
storage/
├── truenas/scale/bare-metal/
│   ├─ assets/
│   ├─ docs/
├── nextcloud/
├─ .gitgignore
├─ LICENSE
├─README.md
└─ mkdocs.yml
```

## Documentation

| Topic                         | Doc file                                           |
|-------------------------------|----------------------------------------------------|
| Installation                  | [installation.md](installation.md)                 |
| VLAN Networking               | [vlan_networking.md](vlan_networking.md)           |
| Pool Configuration            | [pool_config.md](pool_config.md)                   |
| Dataset Structure             | [datasets.md](datasets.md)                         |
| SMB / NFS Shares              | [smb_shares.md](smb_shares.md)                     |
| Windows File Access           | [windows_file_access.md](windows_file_access.md)   |
| NFS Export (PBS)              | [nfs_exports.md](nfs_exports.md)                   |
| Periodic Snapshots            | [snapshots.md](snapshots.md)                       |
| Snapshot Restoration          | [snapshot_restoration.md](snapshot_restoration.md) |
| Scheduled Backups             | [scheduled_backups.md](scheduled_backups.md)       |
| Cloud-Sync Tasks              | [cloud_sync.md](cloud_sync.md)                     |
| Permissions & ACL             | [permissions.md](permissions.md)                   |

## Live Documentation

The full storage lab is published online with MkDocs:  
- [https://ifezgez.github.io/storage/](https://ifezgez.github.io/storage/)

## Maintainer

**Ignacio Fernandez**  
CEO @ Vesta Security LATAM  
[https://vestasec.com](https://vestasec.com)

---

Built as a production-ready storage lab to demonstrate expertise in:  
- TrueNAS SCALE & CORE (ZFS, snapshots, replication)  
- Proxmox Backup Server (PBS)  
- Nextcloud (Containerized with Docker Compose)  
- NFS & SMB file sharing  
- Ceph & iSCSI (future modules)  

