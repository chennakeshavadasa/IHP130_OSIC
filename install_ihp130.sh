
#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Update and install build tools
echo "Updating system and installing build tools..."
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y build-essential qtbase5-dev qttools5-dev clang cmake libtool autoconf
sudo apt-get install -y python3 python3-dev python3-pip python3-virtualenv python3-venv
sudo apt-get install -y ruby ruby-dev

# Install useful tools
echo "Installing additional tools..."
sudo apt-get install -y btop tree xterm graphviz git octave liboctave-dev

# Install dependencies
echo "Installing dependencies for PDK and simulation tools..."
sudo apt-get install -y python3-sphinx python3-sphinx-autoapi python3-pandas python3-tk python3-pytest
sudo apt-get install -y libqt5xmlpatterns5-dev qtmultimedia5-dev libqt5multimediawidgets5 libqt5svg5-dev libqt5opengl5
sudo apt-get install -y tcl8.6 tcl-dev tcl8.6-dev tk8.6 tk8.6-dev flex clang gawk xdot pkg-config bison curl help2man perl time
sudo apt-get install -y libxpm4 libxpm-dev libgtk-3-dev libffi-dev libjpeg-dev libfl-dev libfl2 libreadline-dev gettext
sudo apt-get install -y libboost-system-dev libboost-python-dev libboost-filesystem-dev zlib1g-dev libx11-6 libx11-dev
sudo apt-get install -y libxrender1 libxrender-dev libxcb1 libx11-xcb-dev libcairo2 libcairo2-dev libxaw7-dev
sudo apt-get install -y libgz libfl2 libfl-dev zlibc zlib1g zlib1g-dev libz-dev libgit2-dev libgoogle-perftools-dev
sudo apt-get install -y gengetopt groff pod2pdf libhpdf-dev libfftw3-dev libxml-libxml-perl libgd-perl
sudo apt-get install -y libsuitesparse-dev gfortran swig libspdlog-dev libeigen3-dev liblemon-dev

# Clone the IHP-Open-PDK repository
echo "Cloning the IHP-Open-PDK repository..."
PDK_DIR="$HOME/IHP-Open-PDK"
mkdir -p "$PDK_DIR"
cd "$HOME"
git clone --recursive https://github.com/IHP-GmbH/IHP-Open-PDK.git "$PDK_DIR"
cd "$PDK_DIR"
git checkout dev

# Configure environment variables
echo "Configuring environment variables..."
echo "export PDK_ROOT=\$HOME/IHP-Open-PDK" >> ~/.bashrc
echo "export PDK=ihp-sg13g2" >> ~/.bashrc
echo "export KLAYOUT_PATH=\"\$HOME/.klayout:\$PDK_ROOT/\$PDK/libs.tech/klayout\"" >> ~/.bashrc
echo "export KLAYOUT_HOME=\$HOME/.klayout" >> ~/.bashrc
source ~/.bashrc

echo "Installation and setup complete! Please restart your terminal or run 'source ~/.bashrc' to apply changes."
