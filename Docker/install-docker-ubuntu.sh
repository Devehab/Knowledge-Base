#!/bin/bash

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "⚠️ This script must be run as root. Use sudo!" 
    exit 1
fi

echo "🐧 Installing Docker on Ubuntu/Debian..."

# Install prerequisites
echo "📦 Installing prerequisites..."
apt-get update
apt-get install -y apt-transport-https ca-certificates curl software-properties-common gnupg lsb-release

# Add Docker's official GPG key
echo "🔑 Adding Docker GPG key..."
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Add Docker's official repository
echo "📋 Adding Docker repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker CE
echo "🐳 Installing Docker CE..."
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Enable and start Docker service
echo "🔌 Enabling and starting Docker service..."
systemctl enable docker
systemctl start docker

# Add current user to the Docker group
echo "👤 Adding current user to Docker group..."
usermod -aG docker $SUDO_USER

# Verify installations
echo "🔍 Verifying Docker installation..."
docker --version
docker compose version

# Run hello-world to verify installation
echo "🚀 Running hello-world container to verify installation..."
docker run hello-world

# Completion message
echo "🎉 Docker CE and Docker Compose plugin installed successfully!"
echo "Please log out and back in for the user group changes to take effect."
echo "For more information, visit: https://docs.docker.com/engine/install/ubuntu/"
