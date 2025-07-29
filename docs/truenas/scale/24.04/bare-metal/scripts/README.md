# Scripts – TrueNAS SCALE 24.04 (bare‑metal)

| Script | Descripción | Seguro repetir |
|--------|-------------|----------------|
| 01_bootstrap_network.sh | Crea VLAN 30 (`ix0.30`) con IP 10.30.0.21/24 y gateway 10.30.0.1 | ✔ |
| 02_create_pool.sh      | Crea `core-pool` con disco dado (`/dev/disk/by-id/...`) | ✔ |
| 03_datasets.sh         | Genera jerarquía de datasets leyendo *exports/datasets_definition.json* | ✔ |
| 04_shares_smb_nfs.sh   | Registra shares SMB/NFS según *exports/shares_definition.json* | ✔ |
| backup_config.sh       | Guarda backup de configuración en *exports/*.tar* | ✔ |

Todos los scripts son **idempotentes**: si el recurso existe, se omite.
