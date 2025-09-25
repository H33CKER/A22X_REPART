# 📦 A226B Repartition Script (Flashable ZIP)

> ⚠️ Warning: This script modifies **critical partitions** on your device. Proceed with caution.

This repository contains a flashable ZIP that **repartitions Samsung Galaxy A22 5G (model A226B, BR)** using `sgdisk`. It is intended for custom ROM setups that require adjusted partition layouts (e.g., for GSI, custom super partitions, or ARISE setups).

---

## 📁 Contents

- `META-INF/com/google/android/`  
  Standard update-script and shell binary to run the flashable ZIP.

- `script/repart.sh`  
  Repartition logic using `sgdisk`.

---

## 📜 What It Does

1. **Deletes** legacy partitions:
   - `super`

2. **Creates** new partitions:
   - `super` → `11200 MiB`
   - `userdata` → remaining space

---

## ⚙️ How to Use

1. Download the ZIP from Releases
2. Reboot your device into **custom recovery (TWRP)**.
3. Flash the ZIP like any ROM or mod.
4. Reboot.

---

## ⚠️ Caution

- This **erases and recreates partitions**. You will lose data on affected partitions. (will need to reflash super.img)
- Make a **full backup** before flashing.
- This is only tested on **Samsung Galaxy A226B** — using it on other devices will **likely brick** them.
- Ensure your recovery supports `/system/bin/sgdisk` (most recent TWRP builds do).

---

## 🛠 Built With

- Shell scripting (`sh`)
- GPT partitioning tool: `sgdisk`
- AOSP update-binary system

---

## 👨‍💻 Credits

- Developed by **smiley9000 & Neel0210** Tweaked by H3CKER 😄  
- Device testing & support: **Neel0210** 

---

## 📄 License

This project is shared for educational and development use. Flash at your own risk. You are responsible for your device.

