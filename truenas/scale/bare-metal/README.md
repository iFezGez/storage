# Storage Lab Documentation

This folder hosts the step-by-step guides for deploying and operating the Vesta Lab storage stack.  
Each page follows the Vesta Lab documentation template (Quick-view topology, Prerequisites, Steps, Validation, Troubleshooting).

| Page                   | What you’ll find                                                        |
|------------------------|--------------------------------------------------------------------------|
| **installation.md**    | Bare-metal deployment of TrueNAS SCALE & CORE, initial networking, subscription keys |
| **networking.md**      | VLAN/bridge layout, bond creation, MTU tuning, validation pings          |
| **volumes.md**         | ZFS pool and dataset creation, filesystem layout, tunables               |
| **snapshots.md**       | Creating & restoring ZFS snapshots, snapshot schedules, retention policies |
| **cloud_sync.md**      | Configuring cloud-sync tasks & remote replication with S3/Swift          |
| **nfs_exports.md**     | NFS export definitions, permissions, export options & best practices     |
| **smb_shares.md**      | SMB share setup, ACLs, Windows integration, Kerberos/AD binding         |
| **backup.md**          | Proxmox Backup Server VM deployment, backup job creation & restores      |
| **nextcloud.md**       | Docker-Compose deployment of Nextcloud, volumes, HTTPS & external storage integration |
| **troubleshooting.md** | Common issues across all services, diagnostic commands & recovery steps  |

## Quick links

- Installation guide ➜ `installation.md`  
- Networking (VLAN & bridges) ➜ `networking.md`  
- ZFS volumes & datasets ➜ `volumes.md`  
- Snapshots & replication ➜ `snapshots.md`  
- Cloud sync tasks ➜ `cloud_sync.md`  
- NFS exports ➜ `nfs_exports.md`  
- SMB shares ➜ `smb_shares.md`  
- Backup Server (PBS) ➜ `backup.md`  
- Nextcloud deployment ➜ `nextcloud.md`  
- Troubleshooting ➜ `troubleshooting.md`  
