#!/bin/bash

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "⚠️ This script must be run as root. Use sudo!" 
    exit 1
fi

echo "🐧 Installing Docker on RHEL/CentOS/Fedora..."

# Install prerequisites
echo "📦 Installing prerequisites..."
dnf -y install dnf-plugins-core
dnf -y install curl

# Add Docker's repository
echo "📋 Adding Docker repository..."
dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

# Install Docker CE
echo "🐳 Installing Docker CE..."
dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

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
echo "For more information, visit: https://docs.docker.com/engine/install/fedora/"
