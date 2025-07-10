# Storage Repo

This repository contains reference implementations of storage platforms and file‐sharing services for Vesta Lab.  
Each service lives inside **`<service>/<version>/<deploy_type>/`** so multiple versions and deployment types can coexist.

| Service           | Version  | Deploy type   | Docs entry                                              |
|-------------------|----------|---------------|---------------------------------------------------------|
| **TrueNAS SCALE** | 23.10.1  | bare-metal    | [`truenas/scale/23.10.1/bare-metal/docs/`](truenas/scale/23.10.1/bare-metal/docs/) |
| **TrueNAS CORE**  | 13.0-U8  | bare-metal    | _placeholder_ |
| **Nextcloud**     | 27       | Containerized | _placeholder_ |

## Structure
```
virtualization/
├── truenas/scale/bare-metal/
│   ├─ assets/
│   ├─ docs/
├── nextcloud/
├─ mkdocs.yml
├─README
└─ LICENSE
```

---

## Live Documentation

The full storage lab is published online with MkDocs:  
- [https://ifezgez.github.io/storage/](https://ifezgez.github.io/storage/)

---

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

This repository is public and reusable as a technical reference for clients and collaborators.  
