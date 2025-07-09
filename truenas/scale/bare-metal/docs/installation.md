# Installation – TrueNAS SCALE 24.04 (bare-metal)

## Quick-view topology

| Component      | NIC / VLAN | Role          | Notes                 |
|----------------|------------|---------------|-----------------------|
| truenas-node01 | 10.30.0.11 | Storage head  | 128 GB system SSD + 4 TB USB HDD |

> Single-node lab build. Add more nodes later for ZFS replication.

---

## Prerequisites

- Latest **TrueNAS SCALE ISO** [✔ verified <https://www.truenas.com/download-truenas-scale/>]  
- USB stick ≥ 8 GB flashed with **Balena Etcher** or **Rufus**
- Physical host with one free disk (this guide uses **4 TB USB HDD** for data)
- IP/DNS reservation: `truenas-node01 10.30.0.11`
- VGA/ILO or KVM access for initial install

---

## Step 1 – Create the installer

1. Download the ISO.  
2. Flash to USB with your preferred tool.  
3. Verify the SHA-256 checksum matches the official site.

---

## Step 2 – Run the text-mode installer

1. Boot the server from the USB stick.  
2. Select **Install/Upgrade** → choose the **system SSD** (`sda`).  
3. Confirm the swap prompt (default size is fine).  
4. Set the **root password** when asked.


When the summary looks correct, press **OK** to start the installation.

---

## Step 3 – First boot & web login

1. Remove the USB stick and reboot.  
2. On the console you’ll see the assigned IP, e.g.:

   ```bash
   TrueNAS SCALE 24.04
   Web UI: http://10.30.0.11

![Login summary](../assets/screenshot/dashboard-first-login.png)


