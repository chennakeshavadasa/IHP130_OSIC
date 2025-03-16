# IHP130 PDK Installation Guide

## Overview
This guide provides step-by-step instructions to install the IHP130 PDK and the necessary open-source tools for IC design and simulation. The installation script automates the setup process, ensuring all dependencies are properly configured.

## Prerequisites
Before running the installation script, ensure that:
- You are using **Ubuntu 22.04 LTS** or a compatible Linux distribution.
- You have **sudo (administrator) privileges**.
- You have at least **80GB of free disk space** for installation and simulation files.

## Step-by-Step Installation

### 1. Download the Installation Script
Run the following command to download the script:
```bash
wget https://raw.githubusercontent.com/your-repo/install_ihp130_pdk.sh
```

### 2. Give Execution Permission
Before running the script, make it executable:
```bash
chmod +x install_ihp130_pdk.sh
```

### 3. Run the Script
Execute the script to install all required tools and the PDK:
```bash
./install_ihp130_pdk.sh
```
This process may take some time, so be patient.

### 4. Apply Environment Variables
After installation, restart your terminal or run:
```bash
source ~/.bashrc
```

## Installed Tools and Their Locations
| Tool      | Installation Directory |
|-----------|------------------------|
| IHP130 PDK | `~/IHP-Open-PDK` |
| XSCHEM    | `~/OSIC/xschem` |
| MAGIC     | `~/OSIC/magic` |
| NGSPICE   | `~/OSIC/ngspice-43` |
| Open PDKs | `~/OSIC/open_pdks` |
| LVS & KLayout | `~/OSIC` |

## Debugging and Troubleshooting
### 1. Checking Installation Logs
If any step fails, check the terminal output for errors. Use:
```bash
tail -n 50 /var/log/syslog
```
to see recent system logs.

### 2. Verifying Tool Installation
Run the following commands to check if tools are installed correctly:
```bash
xschem
magic
ngspice -v
klayout -v
```
If any command fails, re-run the script or manually install the missing tool.

### 3. Environment Variables Not Applied
If tools are not recognized, manually check and reapply environment variables:
```bash
echo $PDK_ROOT
source ~/.bashrc
```

## Uninstallation
To remove the installed tools and PDK, run:
```bash
rm -rf ~/IHP-Open-PDK ~/OSIC ~/.klayout
```

## Additional Resources
- [IHP-Open-PDK GitHub](https://github.com/IHP-GmbH/IHP-Open-PDK)
- [XSCHEM Documentation](https://xschem.sourceforge.io/stefan/index.html)
- [MAGIC Documentation](http://opencircuitdesign.com/magic/)
- [NGSPICE User Guide](http://ngspice.sourceforge.net/)

For further assistance, feel free to reach out to the community forums or issue trackers of respective tools.
