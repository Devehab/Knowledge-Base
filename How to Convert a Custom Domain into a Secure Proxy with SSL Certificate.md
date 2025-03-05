
# **🔐 How to Convert a Custom Domain into a Secure Proxy with SSL Certificate**

## **🌟 Why Use a Cloudflare Tunnel?**

Using a **Cloudflare Tunnel** provides multiple benefits for securely exposing your services online without opening ports on your home server. Here's why you should consider using it instead of traditional port forwarding:

### **🔒 Security**
- **Prevents unauthorized access:** Opening ports (e.g., 80, 443) can expose your home server to potential cyber threats.
- **No need for direct IP exposure:** Your home IP remains hidden, reducing the risk of attacks.

### **🚀 Bypassing ISP Port Restrictions**
- Many **Internet Service Providers (ISPs)** block common ports (e.g., 80, 443, 25), making it difficult to self-host web services.
- A Cloudflare Tunnel works without requiring open inbound ports, bypassing ISP restrictions effectively.

### **🌍 Ensuring SaaS Availability**
- If you're running a **self-hosted SaaS platform**, Cloudflare ensures that your services are securely available from anywhere through an encrypted tunnel.
- You can map **custom subdomains** to different internal services while maintaining SSL encryption and DDoS protection.


## **🔎 Prerequisites**
Before proceeding, ensure you have the following:

1️⃣ **Cloudflare Account & Domain**
   - You need an account on **[Cloudflare Dashboard](https://dash.cloudflare.com)**.
   - Your **custom domain** must be added and managed in **Cloudflare DNS**.
   - To add a domain:
     1. Log into Cloudflare.
     2. Click **Add a Site** and enter your domain.
     3. Follow the steps to update your domain's nameservers to Cloudflare.

2️⃣ **Cloudflared LXC on Home Lab Server**
   - Install **Cloudflared** on an always-on **Home Lab Server** (e.g., running on Proxmox, Raspberry Pi, or any Linux system).
   - This ensures that the **tunnel remains active 24/7** without manual intervention.

---

This guide explains how to set up a secure proxy using **Cloudflared** on a **Proxmox VE LXC container** and route subdomains to internal services with SSL encryption.

### **🌐 Example Configuration:**
| Hostname | Service |
|----------|---------|
| app.example.com | http://192.168.0.100:80 |
| dashboard.example.com | http://192.168.0.113:9000 |
| automation.example.com | http://192.168.0.46:5678 |

---

## **📌 Step 1: Install Cloudflared LXC on Proxmox VE**

### **1️⃣ Download and Install Cloudflared LXC via Proxmox VE Helper-Scripts**
Run the following command in your Proxmox shell to create a dedicated LXC container for `Cloudflared`:

```bash
bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/ct/cloudflared.sh)"
```

📌 **This will create a `Cloudflared` LXC container with the required environment.**

---

## **⚙ Step 2: Advanced Installation & SSL User Setup**

📌 During installation, choose **Advanced Mode** and set up **SSL user credentials** as required.

---

## **📥 Step 3: Install Cloudflared in the LXC Container**

Once the container is created, log in and install `Cloudflared`:

```bash
sudo apt install cloudflared -y
```

📌 **This installs `Cloudflared` from system repositories.**

---

## **🔑 Step 4: Log in to Cloudflared**

Authenticate your Cloudflared installation by running:

```bash
cloudflared tunnel login
```

📌 **A login link will appear—open it in your browser and authenticate with your Cloudflare account.**  
📌 **Once authenticated, your account is linked to Cloudflared.**

---

## **🔄 Step 5: Create a New Tunnel**

Run the following command to create a new Cloudflared tunnel:

```bash
cloudflared tunnel create your-name-tunnel
```

📌 **This will generate a tunnel named `your-name-tunnel`.**  
📌 **A `credentials.json` file will be added inside `~/.cloudflared`.**

---

## **📍 Step 6: Retrieve the Full Path of the Credentials File**

To confirm the credentials file location, run:

```bash
realpath ~/.cloudflared/*.json
```

📌 **You will see an output like this:**
```
/root/.cloudflared/your-secure-tunnel-ID.json
```

---

## **📝 Step 7: Configure `config.yml`**

Navigate to the Cloudflared directory:

```bash
cd ~/.cloudflared
nano config.yml
```

📌 **Edit the file and add the following configuration:**

```yaml
tunnel: your-secure-tunnel-id
credentials-file: /root/.cloudflared/your-secure-tunnel-id.json

ingress:
  - hostname: app.example.com
    service: http://192.168.0.100:80
  - hostname: dashboard.example.com
    service: http://192.168.0.113:9000
  - hostname: automation.example.com
    service: http://192.168.0.46:5678
  - service: http_status:404
```

📌 **Replace `your-secure-tunnel-id` and credentials file path accordingly.**  
📌 **Ensure the subdomains, IP addresses, and ports are correct.**  
📌 The last line (`http_status:404`) ensures a **404 error is returned if no matching hostname is found.**

---

## **📂 Step 8: Verify Required Files Exist**

After saving, verify the required files exist inside `~/.cloudflared`:

```bash
cd ~/.cloudflared
ls -la
```

📌 **You will see an output like this:**
```
-r-------- 1 root root  175 Mar  2 22:19 my-secure-tunnel.json
-rw------- 1 root root  266 Mar  2 22:17 cert.pem
-rw-r--r-- 1 root root  448 Mar  3 00:07 config.yml
```

---

## **🚀 Step 9: Keep Cloudflared Running After Reboot**

To ensure the tunnel restarts automatically after reboot:

```bash
sudo cloudflared service install
sudo systemctl enable cloudflared
sudo systemctl start cloudflared
```

📌 **This ensures Cloudflared starts automatically with the system.**

---

## **🌍 Step 10: Add Subdomains as a Proxy in Cloudflare DNS**

For each subdomain, go to **Cloudflare Dashboard** → **DNS** and add a **CNAME** record:

| Subdomain | Type  | Target |
|-----------|-------|----------------------------------|
| app       | CNAME | your-secure-tunnel-id.cfargotunnel.com |
| dashboard | CNAME | your-secure-tunnel-id.cfargotunnel.com |
| automation| CNAME | your-secure-tunnel-id.cfargotunnel.com |

📌 **Replace `my-secure-tunnel-id` with your actual tunnel ID.**  
📌 **Ensure proxying is enabled (orange cloud icon).**

---

## **🎯 Final Step: Verify Everything is Working**

After setting up the DNS records, test if your domain is correctly routing traffic through the tunnel:

```bash
cloudflared tunnel list
```

📌 **Ensure your tunnel is listed as `healthy`.**

You can also test accessing your services using:
```bash
curl -I https://app.example.com
```
📌 If everything is set up correctly, you should receive an **HTTP 200 OK** response.

✅ **Cloudflared is now successfully set up, and your subdomains are securely routed! 🚀**  
📌 **If you encounter any issues, drop a message for troubleshooting assistance.**
