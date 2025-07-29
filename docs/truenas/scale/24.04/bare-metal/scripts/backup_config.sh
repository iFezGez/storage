#!/usr/bin/env bash
#
# backup_config.sh
# Save TrueNAS SCALE config tarball in exports/ with timestamp
#
set -euo pipefail
DEST_DIR="$(dirname "$0")/../exports"
mkdir -p "$DEST_DIR"
TS=$(date +%Y%m%d_%H%M)
FILE="$DEST_DIR/truenas-config_${TS}.tar"

echo "[+] Saving configuration to $FILE"
midclt call core.download /data/freenas-v1.db "config.tar" '{"gzip": true}' > "$FILE"
echo "[✓] Backup saved."
