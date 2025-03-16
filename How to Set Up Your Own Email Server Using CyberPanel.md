# 🚀 How to Set Up Your Own Email Server Using CyberPanel

Ever wanted complete control over your email? Setting up your own self-hosted email server can seem intimidating, but with CyberPanel, it's easier than you think! CyberPanel simplifies complex tasks, automatically handling DNS and security setups for you. Let’s dive in step-by-step!\



**Note:** This guide is based on a helpful tutorial video available [here](https://www.youtube.com/watch?v=NVPeC1KLQQqgEn3z). If the video is unavailable, the creator might have removed or updated it.

Let’s dive in!

---

## 📖 Table of Contents

- [Introduction](#introduction)
- [What You'll Need](#what-youll-need)
- [Setting Up Your Server](#setting-up-your-server)
  - [Creating a VPS Server](#creating-a-vps-server)
  - [DNS Configuration](#dns-configuration)
- [Installing CyberPanel](#installing-cyberpanel)
- [Configuring CyberPanel](#configuring-cyberpanel)
  - [Logging In](#logging-in)
  - [Adding Your Domain](#adding-your-domain)
  - [Setting Up DNS](#setting-up-dns)
  - [Obtaining SSL Certificates](#obtaining-ssl-certificates)
- [Creating Your Email Address](#creating-your-email-address)
  - [Accessing Webmail](#accessing-webmail)
- [Testing Your Email](#testing-your-email)
- [Setting Reverse DNS](#setting-reverse-dns)
- [Enhancing Security](#enhancing-security)
- [Conclusion](#conclusion)
- [Extra Tips 💡](#extra-tips-)

---

## Introduction

Setting up a self-hosted email server allows you to have complete privacy and control. While traditionally complex, CyberPanel simplifies this process, making it accessible even for beginners.

---

## What You'll Need

- ✅ A Linux server (VPS or local server)
- ✅ Ubuntu 20.04 or newer
- ✅ Registered domain name
- ✅ Access to domain DNS settings

---

## Setting Up Your Server

### Creating a VPS Server

You can use services like Linode, DigitalOcean, AWS, or Google Cloud. Here's how:

1. Choose Ubuntu 20.04.
2. Select **2GB RAM and 50GB storage**.
3. Set a root password and SSH keys.
4. Your server will be assigned a **public IP** automatically.

### DNS Configuration

1. Go to your domain provider (like Namecheap).
2. Update the Name Servers (e.g., `ns1.yourdomain.com`, `ns2.yourdomain.com`) to point to your server's IP.
3. Verify your DNS setup at [UltraTools](https://www.ultratools.com/).

---

## Installing CyberPanel

Connect to your server via SSH:

1. Update system packages:
   ```bash
   sudo apt update && sudo apt upgrade -y
   ```
2. Install CyberPanel:
   ```bash
   sh <(curl -s https://cyberpanel.net/install.sh)
   ```
3. During installation:
   - Select **CyberPanel with OpenLiteSpeed**.
   - Choose to install **Postfix** (email server).
   - Say **"No"** to external database servers.
   - Set a strong admin password.
   - Restart your server after installation.

---

## Configuring CyberPanel

### Logging In

- Open your browser and go to:
  ```
  https://your-server-ip:8090
  ```
- Ignore security warnings.
- Log in with your admin username and password.

### Adding Your Domain

1. Navigate to **Websites > Create Website**.
2. Enter your domain (e.g., `yourdomain.com`).
3. Enable **DKIM Support** (important for email security).
4. Click **Create Website**.

### Setting Up DNS

1. Navigate to **DNS > Create Name Server**.
2. Create `ns1` and `ns2` records using your server IP.
3. Update DNS settings at your domain provider accordingly.

### Obtaining SSL Certificates

- Go to **SSL > Mail Server SSL**.
- Select your domain and click **Issue SSL** for a free Let's Encrypt SSL.

---

## Creating Your Email Address

1. Go to **Email > Create Email**.
2. Enter your desired email (e.g., `admin@yourdomain.com`).
3. Create a strong password.
4. Click **Create Email**.

### Accessing Webmail

- Navigate to **Email > Access Webmail**.
- Log in using your new email credentials.

---

## Testing Your Email

1. Send an email from your new account to another provider (e.g., Gmail).
2. Ensure it doesn't go into the spam folder.
3. Reply back to test receiving capability.

Use [Mail Tester](https://www.mail-tester.com/) to verify email reliability:

- Send a test email to the provided address.
- Aim for a **10/10** score.

---

## Setting Reverse DNS

A Reverse DNS ensures emails are trusted:

1. Visit your VPS provider’s network settings.
2. Set Reverse DNS to your mail server domain (e.g., `mail.yourdomain.com`).
3. Verify settings at [MXToolBox](https://mxtoolbox.com/).

---

## Enhancing Security

- Enable **SPF Record**:
  ```
  v=spf1 ip4:YOUR_SERVER_IP -all
  ```
- Enable **DKIM and DMARC**:
  ```
  v=DMARC1; p=none; rua=mailto:dmarc@yourdomain.com
  ```
- Set up firewall rules:
  ```bash
  sudo ufw allow 25,587,993/tcp
  sudo ufw enable
  ```

---

## Conclusion

Congratulations! 🎉 You’ve successfully set up a secure, reliable, self-hosted email server with CyberPanel. Now you can enjoy full control over your email data and privacy.

---

## Extra Tips 💡

- Regularly update your server and CyberPanel for security.
- Monitor your email reputation to avoid spam flags.
- Use strong, unique passwords for all email accounts.

---

**Happy Hosting! 🚀📧**

