# 🚀 **How to Redirect Multiple Subdomains with Caddy and a Wildcard Certificate**

Have you ever wondered how websites manage to redirect multiple subdomains (like `app.example.com` or `blog.example.com`) to different servers or services easily? 🤔 In this guide, you'll learn how to use **Caddy Server** and a single **Wildcard SSL certificate** to manage and redirect multiple subdomains effortlessly, even if you're new to web hosting!

---

## 📖 **Table of Contents**

- [Introduction: What is Caddy and a Wildcard SSL?](#introduction-what-is-caddy-and-a-wildcard-ssl)
- [Step 1: Setting Up Cloudflare DNS](#step-1-setting-up-cloudflare-dns)
- [Step 2: Create Your `Caddyfile`](#step-2-create-your-caddyfile)
- [Step 3: Obtain Cloudflare API Token](#step-3-obtain-cloudflare-api-token)
- [Step 4: Running Your Caddy Server](#step-4-running-your-caddy-server)
- [Step 5: Testing Your Setup](#step-5-testing-your-setup)
- [Tips & Fun Fact](#tips--fun-fact)
- [Conclusion](#conclusion)

---

## 🎯 **Introduction: What is Caddy and a Wildcard SSL?**

**Caddy** is a user-friendly web server designed to simplify web hosting. It automatically manages SSL certificates, meaning your site is secure by default.

A **Wildcard SSL certificate** (`*.example.com`) allows you to secure unlimited subdomains under your main domain with just one certificate. ✅

For example:
- `sub1.example.com`
- `sub2.example.com`
- `anything.example.com`

All these can use the same SSL certificate!

---

## 🌐 **Step 1: Setting Up Cloudflare DNS**

First, you'll need a **Wildcard DNS Record**. Here's how to set it up using Cloudflare:

1. Log in to your Cloudflare account.
2. Select your domain (`example.com`).
3. Go to the **DNS** tab.
4. Click **Add Record** and enter:
    - **Type**: `A` (for IPv4) or `CNAME` (for dynamic DNS).
    - **Name**: `*`
    - **Content**: Enter your server's IP or dynamic hostname.
    - **Proxy status**: Choose whether to proxy (orange cloud) for extra protection.
5. Click **Save**.

Now, all undefined subdomains will point to your server automatically!

---

## 📄 **Step 2: Create Your `Caddyfile`**

A `Caddyfile` is Caddy's configuration file. Let's create a simple example:

```plaintext
{
    auto_https off
}

*.example.com {
    tls {
        dns cloudflare YOUR_CLOUDFLARE_API_TOKEN
    }

    @sub1 host sub1.example.com
    reverse_proxy @sub1 http://192.168.1.10:3000

    @sub2 host sub2.example.com
    reverse_proxy @sub2 http://192.168.1.11:4000

    @sub3 host sub3.example.com
    reverse_proxy @sub3 http://192.168.1.12:5000

    handle_errors {
        respond "Domain not configured" 404
    }
}
```

### Explanation:
- **Wildcard (`*.example.com`)**: Handles all subdomains.
- **Matchers (`@sub1`)**: Define specific subdomains.
- **`reverse_proxy`**: Redirects requests to the correct IP and port.
- **Error Handling**: Shows a friendly message for undefined subdomains.

---

## 🔑 **Step 3: Obtain Cloudflare API Token**

Caddy needs access to Cloudflare to validate your domain for SSL.

- Go to **Cloudflare > My Profile > API Tokens**.
- Create a new token with **Edit Zone DNS** permissions.
- Save this token and replace `YOUR_CLOUDFLARE_API_TOKEN` in your `Caddyfile`.

---

## 🛠️ **Step 4: Running Your Caddy Server**

Now you're ready to launch your server! Run this command:

```bash
caddy run --config /path/to/Caddyfile
```

Caddy automatically:
- Issues your Wildcard SSL certificate via Let's Encrypt.
- Uses Cloudflare's DNS for verification.
- Handles requests to the defined subdomains.

---

## ✅ **Step 5: Testing Your Setup**

Visit `sub1.example.com` or any configured subdomain in your browser. You should see the service running behind it (e.g., your application or website).

If you access an undefined subdomain (`random.example.com`), you'll see your custom 404 message.

---

## 💡 **Tips & Fun Fact**

- **Tip**: Always secure your Cloudflare API Token! Limit permissions to only what's necessary.
- **Fun Fact**: Wildcard certificates save you time and simplify your infrastructure. One certificate can secure infinite subdomains! 🌟

---

## 🎉 **Conclusion**

Congratulations! 🎊 You've learned how to:
- Set up Wildcard DNS in Cloudflare.
- Configure Caddy for automatic SSL and subdomain redirection.
- Simplify your server management significantly!

Now you're ready to confidently manage multiple subdomains with ease!

Feel free to reach out if you have more questions! 🚀

