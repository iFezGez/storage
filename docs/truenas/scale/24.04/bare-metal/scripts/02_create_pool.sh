#!/usr/bin/env bash
#
# 02_create_pool.sh
# Create ZFS pool "core-pool" with a single disk.
#
# Usage: sudo ./scripts/02_create_pool.sh /dev/disk/by-id/usb-Seagate_4TB_12345
#
set -euo pipefail

POOL_NAME="core-pool"
DISK="${1:-/dev/disk/by-id/usb-Seagate_4TB_12345}"

if midclt call pool.query "[["name","=","$POOL_NAME"]]" | jq -e '.[].id' >/dev/null 2>&1; then
    echo "[✓] Pool $POOL_NAME already exists – skipping."
    exit 0
fi

echo "[+] Creating pool $POOL_NAME on $DISK"
midclt call pool.create "{
  "name":"$POOL_NAME",
  "encryption": false,
  "topology": {
    "data": [{
      "type": "STRIPE",
      "children": [{"type":"DISK", "disk":"$DISK"}]
    }]
  }
}"

echo "[✓] Pool created."
