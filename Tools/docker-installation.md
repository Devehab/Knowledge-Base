# 🐳 Docker Installation Guide

This guide provides professional commands to install Docker using curl and the Devehab installation script.

## 🚀 Universal Installation Command

This command works on most Linux distributions and macOS:

```bash
curl -fsSL https://raw.githubusercontent.com/Devehab/Knowledge-Base/main/Tools/devehab-install-docker.sh | sudo bash
```

## 🔍 Alternative Method (Without Direct Execution)

For users who prefer to review scripts before execution or systems without sudo:

```bash
curl -fsSL https://raw.githubusercontent.com/Devehab/Knowledge-Base/main/Tools/devehab-install-docker.sh -o install-docker.sh
chmod +x install-docker.sh
./install-docker.sh
```

## 💻 Operating System Specific Commands

### macOS 🍎

```bash
# Download and execute the script on macOS
curl -fsSL https://raw.githubusercontent.com/Devehab/Knowledge-Base/main/Tools/devehab-install-docker.sh | bash

# If you encounter permission issues
curl -fsSL https://raw.githubusercontent.com/Devehab/Knowledge-Base/main/Tools/devehab-install-docker.sh -o install-docker.sh
chmod +x install-docker.sh
./install-docker.sh
```

Note: macOS may require user password when installing applications, so you might need to enter it during installation.

### Ubuntu/Debian Linux 🐧

```bash
# Install curl if not already installed
sudo apt-get update
sudo apt-get install -y curl

# Download and execute the script
curl -fsSL https://raw.githubusercontent.com/Devehab/Knowledge-Base/main/Tools/devehab-install-docker.sh | sudo bash
```

### RHEL/CentOS/Fedora Linux 🐧

```bash
# Install curl if not already installed
sudo yum install -y curl

# Download and execute the script
curl -fsSL https://raw.githubusercontent.com/Devehab/Knowledge-Base/main/Tools/devehab-install-docker.sh | sudo bash
```

## 🔧 Understanding curl Flags

- `-f` (--fail): Makes curl return an error code when the request fails instead of returning an HTML error page
- `-s` (--silent): Silent mode, prevents showing progress and error messages
- `-S` (--show-error): Show errors when using silent mode
- `-L` (--location): Follow redirects

## ⚠️ Important Notes

1. **Permissions**: The script requires root privileges (via sudo) to install Docker, so it's recommended to use `sudo` with the command

2. **Security**: Before executing any script from the internet, it's advisable to review it first:
   ```bash
   curl -fsSL https://raw.githubusercontent.com/Devehab/Knowledge-Base/main/Tools/devehab-install-docker.sh -o install-docker.sh
   less install-docker.sh  # To review the script content
   chmod +x install-docker.sh
   sudo ./install-docker.sh
   ```

3. **macOS Users**: If you're using Apple Silicon (M1/M2), ensure that the script is compatible with the arm64 architecture

4. **Post-Installation**: After installation, you may need to add your user to the docker group to run Docker without sudo:
   ```bash
   sudo usermod -aG docker $USER
   # Log out and back in or run:
   newgrp docker
   ```

## ✅ Verification

Verify your installation by running the following commands:

```bash
# Check Docker version
docker --version

# Check Docker Compose version
docker compose version

# Verify Docker is working correctly
docker run hello-world
```

## 🔄 Troubleshooting

If you encounter any issues:

1. Make sure the Docker daemon is running:
   ```bash
   sudo systemctl status docker
   ```

2. Restart the Docker service if needed:
   ```bash
   sudo systemctl restart docker
   ```

3. Check Docker logs:
   ```bash
   sudo journalctl -u docker
   ```

## 📚 Additional Resources

- [Official Docker Documentation](https://docs.docker.com/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)
- [Docker Hub](https://hub.docker.com/) - Find official Docker images
