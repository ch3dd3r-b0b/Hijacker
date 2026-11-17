
# Hijacker — Magisk & Qualcomm qcacld Compatibility Fork

> **Community modernization of [Hijacker by chrisk44](https://github.com/chrisk44/Hijacker).**

This fork focuses on bringing the original Hijacker Android application to newer rooted devices using **Magisk, LineageOS, and Qualcomm qcacld wireless drivers**.

Hijacker is a graphical interface for wireless penetration testing tools, including Aircrack-ng, Airodump-ng, Aireplay-ng, MDK3, and Reaver.

The goal is to preserve the original application's functionality while improving compatibility with modern Android devices and wireless drivers.

## About This Fork

The original Hijacker application was primarily designed around older Android devices using Broadcom wireless chipsets with Nexmon or bcmon.

Modern Android devices using Qualcomm wireless chipsets require a different approach to monitor mode and packet injection.

This fork focuses on:

- Supporting Magisk-based root access.
- Integrating Qualcomm qcacld monitor-mode functionality.
- Supporting compatible custom kernels with monitor-mode and packet-injection patches.
- Updating bundled wireless auditing tools.
- Fixing compatibility issues with newer Android versions.
- Improving process execution and management.
- Preserving the original Hijacker interface and functionality.

**This project does not require Nexmon when using a compatible Qualcomm qcacld driver.**

## Changes and Improvements

### Qualcomm qcacld Support

Added support for using Qualcomm wireless interfaces with compatible patched kernels.

Custom monitor-mode scripts allow the application to work with supported qcacld-based devices without relying on Broadcom-specific Nexmon functionality.

Monitor mode and packet injection require kernel-level support and cannot be enabled through Magisk alone.

### Magisk Compatibility

Improved compatibility with modern Magisk-rooted Android environments.

The application uses root privileges to execute wireless auditing tools and manage supported wireless interfaces.

### Updated Aircrack-ng Binaries

Updated the bundled Aircrack-ng tools to version **1.7**, compiled for Android ARM.

Updated tools include:

- Airodump-ng
- Aireplay-ng
- Aircrack-ng

These updates help address compatibility problems with newer Android environments.

### Airodump-ng Improvements

Improved Airodump-ng execution and process management.

Changes include:

- Improved root command execution.
- More reliable process termination.
- Fixed processes remaining active after stopping scans.
- Improved application state handling.
- Fixed repeated watchdog warnings when stopping Airodump-ng.

### General Compatibility Improvements

Additional work focuses on improving compatibility with newer Android versions while maintaining the original application's functionality.

## Tested Environment

Development and testing have focused on a Qualcomm-based OnePlus device running:

| Component | Configuration |
| --- | --- |
| Operating System | LineageOS 23.2 |
| Android Version | Android 16 |
| Root | Magisk |
| Wireless Driver | Qualcomm qcacld |
| Kernel | Custom kernel with monitor-mode and injection support |
| Wireless Interface | Internal Wi-Fi |

### Compatibility Notes

This fork is not guaranteed to work on every Qualcomm-based Android device.

Compatibility depends on:

- Wireless chipset
- Kernel version
- Wireless driver implementation
- Monitor-mode support
- Packet-injection support
- Root configuration

A compatible patched kernel is required.

## Features

### Information Gathering

- Discover nearby wireless access points and connected stations.
- Identify hidden wireless networks.
- View signal strength and network activity.
- Identify device manufacturers using OUI information.
- Filter and sort discovered networks.
- Capture wireless packets to `.cap` files.
- Export collected network information.

### Wireless Security Auditing

- Wireless network scanning with Airodump-ng.
- WPA handshake capture.
- Wireless packet injection testing.
- Deauthentication testing.
- MDK3 wireless auditing functionality.
- WEP auditing tools.
- Reaver WPS testing on supported configurations.
- Offline password auditing with Aircrack-ng.

### Additional Features

- Background operation.
- Custom command execution.
- Automatic monitor-mode commands.
- Network and device filtering.
- Persistent device aliases.
- Copy MAC addresses and commands.
- Built-in wireless auditing tools.

## Requirements

- Rooted ARM-based Android device.
- Magisk root access.
- Compatible custom kernel.
- Wireless driver supporting monitor mode.
- Packet-injection support for applicable features.
- Appropriate monitor-mode enable and disable scripts.

**Root access alone does not provide monitor mode or packet injection.**

## Installation

### Build From Source

Clone this repository and open the project in Android Studio or build using Gradle.

```bash
./gradlew assembleDebug
```

The resulting APK is located at:

```text
app/build/outputs/apk/debug/app-debug.apk
```

Install using ADB:

```bash
adb install -r app/build/outputs/apk/debug/app-debug.apk
```

### Initial Configuration

1. Install the application.
2. Grant root access through Magisk.
3. Configure the correct wireless interface.
4. Configure the monitor-mode enable and disable commands.
5. Verify that monitor mode works with your device's kernel.
6. Start Airodump-ng to verify wireless scanning.

### Important: Qualcomm Devices

Do not install Nexmon firmware on Qualcomm devices.

Nexmon was designed for specific Broadcom wireless chipsets and is not required for this fork's Qualcomm implementation.

## Troubleshooting

### Root Access Problems

Verify that Magisk is installed and Hijacker has been granted root privileges.

### Monitor Mode Not Working

Confirm that your device's kernel includes the necessary wireless driver patches.

Stock Qualcomm kernels generally do not provide the monitor-mode and injection functionality required by this application.

### Wireless Tools Not Starting

Verify that the bundled executables are installed correctly and have executable permissions.

Also verify that the configured wireless interface exists.

### Airodump-ng Not Stopping

This fork includes improvements to Airodump-ng process termination and watchdog handling.

If problems occur, inspect the running processes and Android logs.

## Screenshots

Screenshots from the original Hijacker project:

![Airodump](https://github.com/chrisk44/Hijacker/raw/master/screenshots/airodump_view.png)

![MDK](https://github.com/chrisk44/Hijacker/raw/master/screenshots/mdk_view.png)

![Reaver](https://github.com/chrisk44/Hijacker/raw/master/screenshots/reaver_view.png)

[Additional Screenshots](https://github.com/chrisk44/Hijacker/tree/master/screenshots)

## Original Project and Credits

This project is based on the original **Hijacker** application developed by **chrisk44**.

Original repository:

https://github.com/chrisk44/Hijacker

All credit for the original application, interface, and underlying functionality belongs to the original developer and respective contributors.

This fork focuses on extending compatibility with newer Android devices and Qualcomm wireless drivers.

Additional projects used by Hijacker include:

- [Aircrack-ng](https://www.aircrack-ng.org/)
- [Nexmon](https://github.com/seemoo-lab/nexmon)
- MDK3
- Reaver

The original project's licensing and applicable third-party licenses remain in effect.

## Disclaimer

This application is intended for authorized wireless security testing, penetration testing, and educational research.

Only use it on networks and devices you own or have explicit permission to test.

Wireless attacks can disrupt network connectivity and may violate applicable laws when performed without authorization.

## Project Status

This is an ongoing modernization effort focused on making Hijacker usable with newer Android devices, Magisk root, and Qualcomm qcacld wireless drivers.

The primary objective is to maintain the original application's functionality while improving compatibility with modern Android environments.
