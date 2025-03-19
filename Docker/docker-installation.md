# 🐳 Docker Installation Guide

This guide provides professional commands to install Docker using our custom installation scripts for different operating systems.

## 🚀 Universal Installation Command

Download and run the appropriate script for your operating system:

```bash
# Choose the script that matches your operating system
curl -fsSL https://raw.githubusercontent.com/Devehab/tafsir-ai/main/install-docker-ubuntu.sh | sudo bash
```

## 🔍 Alternative Method (Without Direct Execution)

For users who prefer to review scripts before execution:

```bash
# Download the appropriate script for your OS
curl -fsSL https://raw.githubusercontent.com/Devehab/tafsir-ai/main/install-docker-ubuntu.sh -o install-docker.sh
chmod +x install-docker.sh
sudo ./install-docker.sh
```

## 💻 Operating System Specific Scripts

### macOS 🍎

```bash
# Download and execute the macOS script
curl -fsSL https://raw.githubusercontent.com/Devehab/tafsir-ai/main/install-docker-macos.sh -o install-docker.sh
chmod +x install-docker.sh
sudo ./install-docker.sh
```

Note: macOS requires sudo privileges to install Docker properly. You will be prompted for your password during installation.

### Ubuntu/Debian Linux 🐧

```bash
# Install curl if not already installed
sudo apt-get update
sudo apt-get install -y curl

# Download and execute the Ubuntu/Debian script
curl -fsSL https://raw.githubusercontent.com/Devehab/tafsir-ai/main/install-docker-ubuntu.sh -o install-docker.sh
chmod +x install-docker.sh
sudo ./install-docker.sh
```

### RHEL/CentOS/Fedora Linux 🐧

```bash
# Install curl if not already installed
sudo yum install -y curl

# Download and execute the RHEL/CentOS/Fedora script
curl -fsSL https://raw.githubusercontent.com/Devehab/tafsir-ai/main/install-docker-fedora.sh -o install-docker.sh
chmod +x install-docker.sh
sudo ./install-docker.sh
```

## 🔧 Understanding curl Flags

- `-f` (--fail): Makes curl return an error code when the request fails instead of returning an HTML error page
- `-s` (--silent): Silent mode, prevents showing progress and error messages
- `-S` (--show-error): Show errors when using silent mode
- `-L` (--location): Follow redirects

## ⚠️ Important Notes

1. **Permissions**: All scripts require root privileges (via sudo) to install Docker, so it's recommended to use `sudo` with the command

2. **Security**: Before executing any script from the internet, it's advisable to review it first:
   ```bash
   curl -fsSL https://raw.githubusercontent.com/Devehab/tafsir-ai/main/install-docker-ubuntu.sh -o install-docker.sh
   less install-docker.sh  # To review the script content
   chmod +x install-docker.sh
   sudo ./install-docker.sh
   ```

3. **macOS Users**: If you're using Apple Silicon (M1/M2), our script will automatically detect and install the appropriate version

4. **Post-Installation**: After installation, you may need to log out and log back in for group membership changes to take effect:
   ```bash
   # Verify you're in the docker group
   groups | grep docker
   ```

## ✅ Verification

All scripts automatically verify your installation by running:

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

## 📜 Local Script Files

If you want to use the local scripts directly from this repository:

```bash
# Make the script executable
chmod +x ./install-docker-[your-os].sh

# Run with sudo
sudo ./install-docker-[your-os].sh
```

Replace `[your-os]` with one of:
- `macos` - For MacOS systems
- `ubuntu` - For Ubuntu/Debian systems
- `fedora` - For RHEL/CentOS/Fedora systems
