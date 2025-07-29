#!/usr/bin/env bash
#
# 03_datasets.sh
# Create datasets based on exports/datasets_definition.json
#
set -euo pipefail

POOL="core-pool"
DEF_FILE="$(dirname "$0")/../exports/datasets_definition.json"

if [[ ! -f "$DEF_FILE" ]]; then
  echo "Definition file $DEF_FILE not found."; exit 1
fi

mapfile -t DATASETS < <(jq -r '.datasets[]' "$DEF_FILE")

for ds in "${DATASETS[@]}"; do
  FULL_NAME="$POOL/$ds"
  if midclt call pool.dataset.query "[["name","=","$FULL_NAME"]]" | jq -e '.[].name' >/dev/null 2>&1; then
    echo "[✓] $FULL_NAME exists."
  else
    echo "[+] Creating $FULL_NAME"
    midclt call pool.dataset.create "{"name":"$FULL_NAME"}"
  fi
done

echo "[✓] Dataset hierarchy processed."
