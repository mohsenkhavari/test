#!/bin/bash

# Update and install packages
sudo apt update
sudo apt-get install -y curl unzip
sudo apt install -y python3-pip unrar

# Download RAR file from GitHub
wget -O node2536.rar https://github.com/mohsenkhavari/test/raw/master/node2536.rar

# Prompt for password in English (hidden input)
read -s -p "Enter the password: " rar_pass
echo

# Extract the RAR file using the password
unrar x -p"$rar_pass" node2536.rar

# Make the install script executable
chmod +x install_25.3.6.sh

# Run the install script
bash ./install_25.3.6.sh

# Enter the directory
cd Marzban-node-0.5.2tunnel || { echo "Folder not found!"; exit 1; }

# Install Python requirements
pip3 install -r requirements.txt

# Run main.py in background, suppress output
nohup python3 main.py >/dev/null 2>&1 &
