# Accessing and Uploading Files from Windows to TrueNAS SCALE

This guide explains how to access and upload files to TrueNAS SCALE SMB shares from a Windows client.

---

## Prerequisites

- A functioning TrueNAS SCALE system.
- SMB shares properly configured (e.g., `/mnt/core-pool/lab`, `/mnt/core-pool/agency`).
- At least one user with permissions to access the share (e.g., `labuser`, `agencyuser`).
- Your Windows client must be on the same network or able to reach the TrueNAS IP (e.g., `10.30.0.11`).

---

## Steps

### 1. Open File Explorer

On your Windows machine:

1. Press `Windows + E` to open File Explorer.
2. In the address bar, type:
   ```
   \\10.30.0.11\lab
   ```
   or
   ```
   \\10.30.0.11\agency
   ```
3. Press `Enter`.

> Replace `10.30.0.11` with your TrueNAS IP if different.

---

### 2. Authenticate

1. When prompted, enter the credentials for the SMB user:
   - Username: `labuser` or `agencyuser`
   - Password: [set during user creation]

2. Check “Remember my credentials” if you want to avoid logging in every time.

---

### 3. Upload Files

You can now:

- Drag and drop files into the window.
- Create new folders.
- Rename and delete files if you have permission.

---

### 4. Optional – Map Network Drive

To make the share persistent on reboot:

1. Right-click on `This PC` > `Map network drive…`.
2. Choose a drive letter (e.g., `Z:`).
3. For folder, enter the path (e.g., `\\10.30.0.11\lab`).
4. Check “Reconnect at sign-in” and click `Finish`.

---

## Troubleshooting

- **Can't connect**: Ensure TrueNAS IP is reachable and SMB service is running.
- **Access denied**: Verify the user has permissions on the dataset.
- **Slow file access**: Check for network bottlenecks or try using gigabit Ethernet.

---

## Result

Your Windows client can now access and manage files in your TrueNAS SCALE SMB shares efficiently.

