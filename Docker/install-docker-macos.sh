#!/bin/bash

echo "🍎 Installing Docker on macOS..."

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Docker Desktop using Homebrew
echo "Installing Docker Desktop for Mac..."
brew install --cask docker

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "⚠️ Docker installation failed. Please try manually installing Docker Desktop from https://www.docker.com/products/docker-desktop"
    exit 1
fi

# Start Docker Desktop
echo "Starting Docker Desktop..."
open -a Docker

# Wait for Docker to start
echo "Waiting for Docker to start (this may take a minute)..."
for i in {1..30}; do
    if docker info &>/dev/null; then
        echo "✅ Docker is running!"
        break
    fi
    echo "Waiting for Docker to start... ($i/30)"
    sleep 2
done

# Verify installations
echo "🔍 Verifying Docker installation..."
docker --version
docker compose version

# Run hello-world to verify installation
echo "🚀 Running hello-world container to verify installation..."
docker run hello-world

echo "🎉 Docker has been successfully installed on your Mac!"
echo "You can manage Docker from the Docker Desktop icon in your menu bar."
echo "For more information, visit: https://docs.docker.com/docker-for-mac/"
