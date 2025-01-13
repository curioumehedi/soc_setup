#!/bin/bash

# Color codes for formatting
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# List of packages to check and hold
PACKAGES=("kibana" "filebeat" "elasticsearch" "suricata" "wazuh-manager" "wazuh-agent")

# Function to check if a package is installed
is_installed() {
    dpkg -l | grep -q "^ii\s\+$1\s"
}

# Loop through the packages
for PACKAGE in "${PACKAGES[@]}"; do
    if is_installed "$PACKAGE"; then
        echo -e "${GREEN}$PACKAGE is installed. Putting it on hold...${NC}"
        sudo apt-mark hold "$PACKAGE"
    fi
done
