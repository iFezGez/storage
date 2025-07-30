#!/usr/bin/env bash
#
# 04_shares_smb_nfs.sh
# Create SMB and NFS shares from exports/shares_definition.json
#
set -euo pipefail

DEF_FILE="$(dirname "$0")/../exports/shares_definition.json"

if [[ ! -f "$DEF_FILE" ]]; then
  echo "Definition file $DEF_FILE not found."; exit 1
fi

jq -c '.smb[]?' "$DEF_FILE" | while read -r row; do
  NAME=$(echo "$row" | jq -r '.name')
  PATH=$(echo "$row" | jq -r '.path')
  if midclt call sharing.smb.query "[["path","=","$PATH"]]" | jq -e '.[].id' >/dev/null 2>&1; then
    echo "[✓] SMB share $NAME exists."
  else
    echo "[+] Creating SMB share $NAME → $PATH"
    midclt call sharing.smb.create "{"name":"$NAME","path":"$PATH","enabled":true}"
  fi
done

jq -c '.nfs[]?' "$DEF_FILE" | while read -r row; do
  PATH=$(echo "$row" | jq -r '.path')
  if midclt call sharing.nfs.query "[["paths","contains","$PATH"]]" | jq -e '.[].id' >/dev/null 2>&1; then
    echo "[✓] NFS export $PATH exists."
  else
    echo "[+] Creating NFS export $PATH"
    midclt call sharing.nfs.create "{"paths":["$PATH"],"enabled":true}"
  fi
done

echo "[✓] Shares processed."
