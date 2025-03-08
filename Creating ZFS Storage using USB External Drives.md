
# Creating ZFS Storage using USB External Drives

---

## 🔹 **Why Use a Laptop/Home Lab?**

- **Cost-Effective:**  
  Home labs leverage existing hardware, making experimentation affordable without upfront investment.
  
- **Electricity Efficiency:**  
  Enterprise-grade hardware (e.g., dual Xeon CPUs, large RAM setups) consumes significantly more electricity (300W+ idle) compared to a laptop (~30W idle).

- **Learning & Experimentation:**  
  Demonstrate how easy it is to learn Proxmox and self-host services without expensive hardware.

---

## 🔸 **Setting Up ZFS Storage Using USB Drives**

### Hardware Used:
- Two external USB hard drives (**WD 2TB drives**).

### ⚠️ **Disclaimer:**  
> Not recommended for production or critical data, as external USB drives are less reliable.

---

## ✅ **Step-by-Step Setup:**

### 1. **Connect USB Drives:**
- Verify detection by Proxmox:
  - Node → **Disks**
  - Confirm two drives are visible (2TB each).

### 2. **Create ZFS Pool:**
- Go to Node → **ZFS → Create ZFS**.
- Name the ZFS pool (**"tank"** is common).
- Select **"Mirror"** for redundancy.
- **Compression:** Use recommended `lz4` (default compression).
- **Do NOT** select "Add storage" during creation (allows flexible dataset creation later).

### Why Not Add Storage Automatically?
- Proxmox default storage limits usage to VM disk images/containers only (no backups or ISO storage).

---

## ✅ **Creating ZFS Datasets (via Terminal):**
- Open Proxmox terminal or SSH into server.

Check existing ZFS pools:
```bash
zpool list
zfs list
```

**Create datasets:**  
```bash
zfs create tank/backups
zfs create tank/isos
zfs create tank/vm-drives
```

- Each dataset dynamically shares the total pool storage (2TB mirrored).

---

## ✅ **Integrating Datasets with Proxmox Storage:**

- **Go to Data Center → Storage → Add → Directory.**
  
| Storage Name | Directory Path    | Usage                              |
|--------------|-------------------|------------------------------------|
| isos         | `/tank/isos`      | ISO Images, Container Templates    |
| vm-drives    | `/tank/vm-drives` | Disk Images, Containers            |
| backups      | `/tank/backups`   | VZDump backups                     |

---

## ✅ **Testing Your ZFS Setup:**

### **ISO & Container Templates:**
- Download an ISO/container template (e.g., Ubuntu) directly into ZFS storage to verify functionality.

### **VM/Container Storage Migration:**
- Create a test container on local storage.
- Move container storage to your ZFS dataset (VM-drives):
  - Container → Resources → Move Storage
  - Select VM-drives, delete original after migration.

### **Backup & Restore Validation:**
- Create scheduled or manual backups to ZFS (tank/backups).
- Test restoration to verify data integrity.

---

## 🔸 **Performance & Recommendations:**

- **USB drives**:
  - Good for experimentation, not suitable for critical data due to lower reliability and slower speed.
- **Suggested Alternative:**
  - Use external storage bays or NAS with higher-quality drives (e.g., WD Red or Toshiba enterprise-grade drives).

---

## ✅ **Key Takeaways:**
- **Proxmox & ZFS are easy and affordable** to set up even on older hardware.
- **ZFS Mirror** protects data redundancy with two drives.
- Ideal solution for **learning, testing, and basic home usage**.
- For critical storage, upgrade to enterprise-grade or NAS storage solutions later as needed.

