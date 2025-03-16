# IHP130 PDK Installation Guide
Note: This is still undergoing and has bugs so you might have to debug at many stages of the installation.

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

## Installation Breakdown
The installation script performs the following steps:

### **1. System Update and Build Tools Installation**
The first step updates the system and installs essential build tools:
```bash
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y build-essential qtbase5-dev qttools5-dev clang cmake libtool autoconf
sudo apt-get install -y python3 python3-dev python3-pip python3-virtualenv python3-venv
sudo apt-get install -y ruby ruby-dev
```

### **2. Installing Additional Utilities**
This step installs useful utilities for working with IC design:
```bash
sudo apt-get install -y btop tree xterm graphviz git octave liboctave-dev
```

### **3. Installing Dependencies for PDK and Simulation Tools**
This step installs necessary dependencies for building and running the tools:
```bash
sudo apt-get install -y python3-sphinx python3-sphinx-autoapi python3-pandas python3-tk python3-pytest
sudo apt-get install -y libqt5xmlpatterns5-dev qtmultimedia5-dev libqt5multimediawidgets5 libqt5svg5-dev libqt5opengl5
sudo apt-get install -y tcl8.6 tcl-dev tcl8.6-dev tk8.6 tk8.6-dev flex clang gawk xdot pkg-config bison curl help2man perl time
sudo apt-get install -y libxpm4 libxpm-dev libgtk-3-dev libffi-dev libjpeg-dev libfl-dev libfl2 libreadline-dev gettext
sudo apt-get install -y libboost-system-dev libboost-python-dev libboost-filesystem-dev zlib1g-dev libx11-6 libx11-dev
sudo apt-get install -y libxrender1 libxrender-dev libxcb1 libx11-xcb-dev libcairo2 libcairo2-dev libxaw7-dev
sudo apt-get install -y libgz libfl2 libfl-dev zlibc zlib1g zlib1g-dev libz-dev libgit2-dev libgoogle-perftools-dev
sudo apt-get install -y gengetopt groff pod2pdf libhpdf-dev libfftw3-dev libxml-libxml-perl libgd-perl
sudo apt-get install -y libsuitesparse-dev gfortran swig libspdlog-dev libeigen3-dev liblemon-dev
```

### **4. Cloning the IHP-Open-PDK Repository**
This step clones the IHP130 PDK repository:
```bash
PDK_DIR="$HOME/IHP-Open-PDK"
mkdir -p "$PDK_DIR"
cd "$HOME"
git clone --recursive https://github.com/IHP-GmbH/IHP-Open-PDK.git "$PDK_DIR"
cd "$PDK_DIR"
git checkout dev
```

### **5. Installing Open-Source EDA Tools**
This section installs key IC design tools:
#### **XSCHEM**
```bash
cd "$HOME/OSIC"
git clone https://github.com/StefanSchippers/xschem.git xschem
cd xschem
./configure
make
sudo make install
```

#### **MAGIC**
```bash
cd "$HOME/OSIC"
git clone git://opencircuitdesign.com/magic
cd magic
./configure
make
sudo make install
```

#### **NGSPICE**
```bash
cd "$HOME/OSIC"
sudo apt-get update
wget https://sourceforge.net/projects/ngspice/files/ng-spice-rework/43/ngspice-43.tar.gz/download -O ngspice-43.tar.gz
tar -xvzf ngspice-43.tar.gz
cd ngspice-43
./configure
make
sudo make install
```

#### **Open PDKs**
```bash
cd "$HOME/OSIC"
git clone git://opencircuitdesign.com/open_pdks
cd open_pdks
./configure --enable-sky130-pdk
sudo make
sudo make install
```

### **6. Configuring Environment Variables**
After installation, environment variables need to be set up:
```bash
echo "export PDK_ROOT=$HOME/IHP-Open-PDK" >> ~/.bashrc
echo "export PDK=ihp-sg13g2" >> ~/.bashrc
echo "export KLAYOUT_PATH=\"$HOME/.klayout:$PDK_ROOT/$PDK/libs.tech/klayout\"" >> ~/.bashrc
echo "export KLAYOUT_HOME=$HOME/.klayout" >> ~/.bashrc
source ~/.bashrc
```

## Debugging and Troubleshooting
If any step fails, refer to the logs and try running the missing commands manually.

To check if the tools are installed correctly, use:
```bash
xschem
magic
ngspice -v
klayout -v
```
If any tool fails to start, try re-installing the specific tool or checking for missing dependencies.

## Additional Resources
- [IHP-Open-PDK GitHub](https://github.com/IHP-GmbH/IHP-Open-PDK)
- [XSCHEM Documentation](https://xschem.sourceforge.io/stefan/index.html)
- [MAGIC Documentation](http://opencircuitdesign.com/magic/)
- [NGSPICE User Guide](http://ngspice.sourceforge.net/)


