# Cloud-Sync Tasks – off-site backups

## Quick-view matrix

| Task ID         | Source dataset          | Direction | Schedule  | Remote path              |
|-----------------|-------------------------|-----------|-----------|--------------------------|
| `lab-backup`    | `core-pool/lab`         | Push      | Daily 00:00 | `truenas/lab`            |
| `agency-backup` | `core-pool/agency`      | Push      | Daily 00:00 | `truenas/agency`         |

All jobs use a single Google Drive OAuth credential and the **Copy** transfer mode.

![Cloud-sync task list](../assets/screenshot/cloud-sync-tasks.png)

---

## Prerequisites

- Cloud credential already created (Google Drive, S3, Azure Blob, …)  
- Source datasets have daily snapshots (see *Scheduled Backups* guide)  
- Adequate upstream bandwidth at midnight

---

## Step-by-step (create a task)

1. **Data Protection ▸ Cloud Sync Tasks ▸ Add**  
2. Direction → **Push** • Transfer mode → **Copy**  
3. **Path** → `/mnt/core-pool/lab`  
4. Credential → *Google Drive*  
5. Remote path → `truenas/lab`  
6. Schedule → **Daily 00:00**  
7. Save & Enable.

Repeat for `/mnt/core-pool/agency`.

> *Tip:* prefer **Copy** over **Sync**; it never deletes cloud files if you remove them locally.

---

## Monitoring & maintenance

| Action                        | Frequency |
|-------------------------------|-----------|
| Check task status column      | Daily     |
| Review detailed logs          | Weekly    |
| Re-authorise OAuth token      | Yearly or when prompted |

Failed transfers raise an alert in the TrueNAS UI; enable email alerts for headless deployments.

---

## Next steps

- Configure [Periodic Snapshot Tasks](snapshots.md) first; cloud-sync will copy the underlying dataset blocks.  
- For on-prem replication, see [Scheduled Backups](scheduled_backups.md).

Official docs [verified <https://www.truenas.com/docs/scale/dataprotection/cloudsync/>]

