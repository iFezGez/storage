#!/usr/bin/env bash
#
# 01_bootstrap_network.sh
# Create or update VLAN 30 on interface ix0, assign static IP and default gateway.
#
# Usage: sudo ./scripts/01_bootstrap_network.sh
#
set -euo pipefail

VLAN_ID=30
PARENT_IF="ix0"
VLAN_IF="${PARENT_IF}.${VLAN_ID}"
IP_CIDR="10.30.0.21/24"
GATEWAY="10.30.0.1"

echo "[+] Checking existing interfaces..."
if midclt call interface.query | jq -e '.[].name' | grep -q "$VLAN_IF"; then
    echo "[✓] $VLAN_IF already exists – skipping creation."
else
    echo "[+] Creating VLAN $VLAN_IF"
    midclt call interface.create "{"name":"$VLAN_IF","type":"VLAN","parent_interface":"$PARENT_IF","vlan_tag":$VLAN_ID}"
fi

echo "[+] Configuring IP address..."
midclt call interface.update "["$VLAN_IF", {"ipv4_dhcp":false,"ipv4_aliases":[{"address":"${IP_CIDR%/*}","netmask":${IP_CIDR#*/}}]}]"

echo "[+] Setting default gateway to $GATEWAY"
midclt call route.update "[{"gateway":"$GATEWAY"}]"

echo '[✓] Network bootstrap complete.'
