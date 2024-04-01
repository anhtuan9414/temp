#!/bin/bash

wget https://us.download.nvidia.com/tesla/470.161.03/NVIDIA-Linux-x86_64-470.161.03.run
# Path to the downloaded NVIDIA driver package
NVIDIA_DRIVER_FILE="NVIDIA-Linux-x86_64-470.161.03.run"

# Install dependencies (example for Ubuntu/Debian)
apt-get update -y
apt-get install gcc make linux-headers-$(uname -r) -y

# Run NVIDIA driver installer
sudo sh "$NVIDIA_DRIVER_FILE" --silent

# Verify installation
nvidia-smi
