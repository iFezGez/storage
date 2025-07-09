# Periodic Snapshot Tasks – core-pool

## Quick-view matrix

| Dataset                | Schedule      | Retention |
|------------------------|---------------|-----------|
| `core-pool/lab`        | Daily 00:00   | 2 weeks   |
| `core-pool/agency`     | Daily 00:00   | 2 weeks   |

Snapshots are read-only, space-efficient checkpoints—ideal for ransomware roll-back and replication.

![Snapshot task list](../assets/screenshot/snapshot-tasks-list.png)

---

## GUI configuration

1. **Data Protection ▸ Periodic Snapshot Tasks ▸ Add**  
2. **Dataset** → `core-pool/lab` • **Recursive** ✔  
3. **Schedule** → preset **Daily 00:00**  
4. **Lifetime** → **2 weeks**  
5. **Save** and **Enable**.  
6. Repeat for `core-pool/agency`.

> *Tip:* staggering start times (e.g., 00:05, 00:10) avoids disk-IO spikes on large pools.

---

## CLI helpers

```bash
# Take an ad-hoc snapshot
zfs snapshot core-pool/lab@manual-backup-$(date +%F)

# List the newest five snapshots
zfs list -t snapshot -o name,creation -s creation | tail -5

# Delete old snapshots
zfs destroy core-pool/lab@manual-backup-$(date +%F -d '-2 weeks')
```