# Scheduled Backup Tasks in TrueNAS SCALE

This document describes how to automate backups in TrueNAS SCALE using scheduled tasks. These include local snapshot creation, remote cloud sync (e.g., Google Drive), and dataset replication (if applicable).

---

## 1. Automatic Snapshot Tasks

Snapshots are lightweight backups of datasets that can be scheduled periodically.

### Steps to Configure:
1. Go to **Data Protection** → **Periodic Snapshot Tasks**.
2. Click **Add**.
3. Select the dataset to snapshot (e.g., `core-pool/lab`, `core-pool/agency`).
4. Configure:
   - **Recursive**: `Yes` (to include all child datasets).
   - **Lifetime**: e.g., `2 weeks` or `1 month`.
   - **Schedule**: Define a cron-style schedule or use presets (e.g., daily at 02:00).
5. Click **Save** and **Enable** the task.

### Example:
| Setting         | Value                  |
|----------------|------------------------|
| Dataset         | core-pool/lab          |
| Recursive       | Yes                    |
| Lifetime        | 1 month                |
| Schedule        | Daily at 02:00 AM      |

Snapshots can later be used for manual rollback or replication.

---

## 2. Cloud Sync Tasks (Backups to Cloud)

A Cloud Sync Task uploads or downloads data between a dataset and a cloud storage provider.

### Existing Setup:
- A Cloud Sync task is already configured to upload snapshots to Google Drive.
- Runs daily at 3:00 AM.

### Steps to Configure:
1. Go to **Data Protection** → **Cloud Sync Tasks**.
2. Click **Add**.
3. Configure:
   - **Direction**: `Push`.
   - **Transfer Mode**: `Sync` or `Copy` (we recommend `Copy` for backups).
   - **Path**: Select dataset path (e.g., `/mnt/core-pool/lab/backups`).
   - **Credential**: Google Drive OAuth (already configured).
   - **Remote Path**: e.g., `truenas/lab-backups`.
   - **Schedule**: Daily at your preferred time.

### Recommended Schedule:
| Task                 | Schedule           | Destination        |
|----------------------|--------------------|---------------------|
| Lab backups to GDrive| Daily at 03:00 AM  | Google Drive        |
| Agency backups       | Weekly on Sunday   | Google Drive (or other) |

---

## 3. Local Replication Tasks (Optional)

If you have a second disk or another dataset for internal backup, TrueNAS allows local replication.

### Steps:
1. Go to **Data Protection** → **Replication Tasks**.
2. Click **Add**.
3. Select:
   - **Source Dataset**: e.g., `core-pool/lab`.
   - **Destination Dataset**: e.g., `core-pool/lab/backups`.
   - Enable **Recursive**, **Snapshot Replication**, and configure schedule.

---

## Maintenance Recommendations

- Review Cloud Sync logs weekly to ensure successful uploads.
- Ensure snapshots are retained long enough for rollback if needed.
- Consider exporting critical snapshots manually before system upgrades.

---

## Related Files

- See `snapshots.md` for snapshot management and rollback.
- See `cloud_sync.md` for cloud provider setup.
