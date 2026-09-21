<div align="center">

<img src="logo.png" alt="ROM Flasher Pro Logo" width="110" height="110" style="border-radius: 50%;" />

# ROM Flasher Pro
### Enterprise-Grade Android Firmware Flashing Suite for Windows

[![Release](https://img.shields.io/github/v/release/xboyrex/ROM-Flasher-Pro?style=for-the-badge&color=0A84FF&label=Release)](https://github.com/xboyrex/ROM-Flasher-Pro/releases/latest)
[![Platform](https://img.shields.io/badge/Platform-Windows%2010%20%7C%2011%20x64-30D158?style=for-the-badge&logo=windows&logoColor=white)](https://github.com/xboyrex/ROM-Flasher-Pro/releases)
[![Build Status](https://img.shields.io/badge/Build-Production%20Passing-brightgreen?style=for-the-badge)](https://github.com/xboyrex/ROM-Flasher-Pro/releases)
[![Architecture](https://img.shields.io/badge/Architecture-x86__64%20Native-blueviolet?style=for-the-badge)](#-architecture--mechanics)
[![License](https://img.shields.io/badge/License-Proprietary%20Freeware-FF453A?style=for-the-badge)](https://github.com/xboyrex/ROM-Flasher-Pro)

A standalone GUI utility engineered to streamline low-level partition deployment across modern Android architectures. Built on asynchronous hardware execution pipelines to eliminate manual command-line execution errors, transmission packet loss, and critical device brick scenarios.

[⚡ Download Latest Binary (.exe)](https://github.com/xboyrex/ROM-Flasher-Pro/releases/latest) • [📘 Workflows](#-deployment-workflows) • [🛡️ Safety Specifications](#-fail-safe-mechanisms)

</div>

---

## 🖥️ Graphical Interface

| Studio Dashboard | Partition Staging Array |
| :---: | :---: |
| ![Dashboard](Screenshot%20(129).png) | ![Fastboot Config](Screenshot%20(130).png) |

| Stock HyperOS Engine | Hardware Console Stream |
| :---: | :---: |
| ![HyperOS Deploy](Screenshot%20(131).png) | ![Terminal Logs](Screenshot%20(132).png) |

| Firmware Verification | Kernel Injection Protocol |
| :---: | :---: |
| ![Staging](Screenshot%20(133).png) | ![Kernel Pipeline](Screenshot%20(134).png) |

---

## ⚡ Technical Capabilities

* **Dynamic Virtual A/B Partition Engine:** Direct low-level writing across logical and physical slots (`boot`, `init_boot`, `vendor_boot`, `dtbo`, `recovery`) with dynamic parameter sanitization[span_0](start_span)[span_0](end_span).
* **HyperOS & MIUI Direct Deployment:** Native extraction and contextual execution of official Fastboot packages (`flash_all.bat` / `flash_all_except_storage.bat`), bypassing command-line prompt overhead while keeping unlock states intact.
* **Hardware Interlock Guardian:** Real-time process termination lock on window closure (`WM_DELETE_WINDOW`) to prevent thread aborts during active partition writes[span_1](start_span)[span_1](end_span).
* **Context-Aware Dynamic Watcher:** High-frequency non-blocking background polling tracking seamless transitions between **Fastboot**, **ADB Shell**, **Recovery**, and **Sideload** modes[span_2](start_span)[span_2](end_span).
* **Sub-Minute Payload Extractor:** Bundled native Go routines enabling rapid unpacking of `payload.bin` directly from OTA images[span_3](start_span)[span_3](end_span).
* **Partition Sanitation Suite:** Hardware-level wipe execution targeting `frp`, `metadata`, and storage partitions (`fastboot -w`)[span_4](start_span)[span_4](end_span).

---

## 📊 Compatibility Matrix

| Architecture / OS Target | Direct Partition Flash | Recovery Sideload | Factory Firmware Flash |
| :--- | :---: | :---: | :---: |
| **Virtual A/B Devices (Android 13 - 15)** | Supported | Supported | Supported |
| **Legacy A/B Devices** | Supported | Supported | Supported |
| **HyperOS / MIUI Fastboot Firmware** | Supported | Supported | Supported |
| **AOSP / Custom Distributions** | Supported | Supported | N/A |

---

## 🚀 Deployment Workflows

<details open>
<summary><b>1. AOSP Clean Flash (Modern Dynamic Partitioning)</b></summary>
<br>

1. Power off device and hold `Volume Down + Power` to engage **Fastboot Mode**.
2. Navigate to **AOSP Clean Flash** inside the workstation.
3. Stage extracted core partition files (`boot.img`, `init_boot.img`, `vendor_boot.img`, `dtbo.img`, `recovery.img`).
4. Click **Flash Partition Set** and allow checksum validation.
5. In Sidebar Quick Controls, click **Reboot Recovery**.
6. Inside Recovery interface, navigate to `Apply Update` ➔ `Apply from ADB`.
7. Stage your system archive (`.zip`) and click **Stream ADB Sideload**.
</details>

<details>
<summary><b>2. Official HyperOS / MIUI Stock Restoration</b></summary>
<br>

1. Download the official Xiaomi Fastboot archive (`.tgz`) and extract completely.
2. Under the **HyperOS / Stock** tab, mount the extracted folder directory.
3. Select script target:
   * `Clean All`: Full firmware flash preserving bootloader unlock privileges.
   * `Save Userdata`: Overwrites core system partitions while preserving user data.
4. Click **Execute Stock Fastboot Flash** to begin automated deployment.
</details>

<details>
<summary><b>3. Custom Kernel & Recovery Injection</b></summary>
<br>

1. Boot device into Fastboot or Recovery mode.
2. Select target AnyKernel3 archive (`.zip`) or raw partition image (`.img`).
3. Click **Flash Kernel Target** for automated slot routing and deployment.
</details>

---

## 🛠️ System Prerequisites

* **Operating System:** Microsoft Windows 10 / 11 (64-bit Architecture).
* **Hardware Interfacing:** Universal Android USB Drivers or OEM Fastboot Drivers.
* **Device Permissions:** Unlocked Bootloader with USB Debugging enabled in Developer Settings.
* **Installation:** Completely standalone portable deployment (`ROM_Flasher_Pro.exe`). No external Python environment or Android SDK platform tools installation required.

---

## ⚠️ Fail-Safe & Security Notice

* This suite executes direct partition-level input/output operations via low-level hardware communication pipes[span_5](start_span)[span_5](end_span).
* **Do NOT use on devices requiring temporary bootstrap execution (`fastboot boot recovery.img`)** unless partition flashing is verified safe on the specific device tree[span_6](start_span)[span_6](end_span).
* Ensure sustained USB connection throughout deployment. Premature cable removal during low-level write routines risks memory block corruption[span_7](start_span)[span_7](end_span).

---

<div align="center">

Distributed and Maintained by **[xboyrex](https://github.com/xboyrex)**

</div>
