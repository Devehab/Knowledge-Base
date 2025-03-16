# 🚀 Deploy Your Apps Easily with DocPloy: An Open-Source Alternative to Vercel

If you're tired of unpredictable cloud costs and prefer full control over your projects, you're not alone. Many developers face surprises from services like Vercel or AWS, where billing isn't clear upfront. Thankfully, there's a great solution: **DocPloy**, a free, self-hosted alternative that simplifies app deployment while giving you complete control.

**Note:** This guide is based on a helpful tutorial video available [here](https://www.youtube.com/watch?v=QAQyRyUXfMs). If the video is unavailable, the creator might have removed or updated it.

## 📚 Table of Contents

- [What is DocPloy?](#what-is-docploy)
- [Prerequisites](#prerequisites)
- [Understanding the Technologies: Docker & Traefik](#understanding-the-technologies-docker--traefik)
- [Installing DocPloy Step-by-Step](#installing-docploy-step-by-step)
- [Getting Started: Creating and Deploying a Project](#getting-started-creating-and-deploying-a-project)
- [Configuring Domains and SSL](#configuring-domains-and-ssl)
- [Adding Databases and Managing Backups](#adding-databases-and-managing-backups)
- [Auto-Deployment with GitHub](#auto-deployment-with-github)
- [Conclusion](#conclusion)
- [💡 Tips & Fun Facts](#-tips--fun-facts)

## What is DocPloy?

**DocPloy** is an open-source alternative to platforms like Vercel, Netlify, and Heroku. It simplifies deploying and managing applications and databases using Docker and Traefik, all through an intuitive user interface. It’s perfect for developers who want full control, cost predictability, and ease of use.

## Prerequisites

Before we start, make sure you have:

- A Virtual Private Server (VPS) or local machine for hosting.
- Basic familiarity with using the command line.
- Git installed (if using GitHub for deployment).

## Understanding the Technologies: Docker & Traefik

### Docker 🐳
Docker helps package applications into containers—think of containers like tiny virtual machines running minimal OS versions (e.g., Ubuntu). This means your app can run consistently on any machine, eliminating the common "it works on my machine" issue.

### Traefik 🚦
Traefik acts as a traffic controller, routing internet requests efficiently to your applications. It manages ports, domains, load balancing, and SSL certificates automatically.

## Installing DocPloy Step-by-Step

1. Go to the DocPloy GitHub page and copy the installation command provided.
2. Open your terminal, paste the command, and press Enter.
3. After a few minutes, a URL will appear in the terminal. Open this URL in your browser.
4. Register your account, and you'll see the main DocPloy dashboard.

🎉 You're now ready to deploy applications!

## Getting Started: Creating and Deploying a Project

Follow these simple steps:

1. Click **Create Project**, enter your project name and description, and hit **Create**.
2. Within your project, click **Create Service → Application**, give it a name, and create it.
3. Click your new service to configure deployment:
   - Select **GitHub** for private repositories (requires GitHub setup).
   - Select **Docker** to deploy using Dockerfiles.
   - Select **Git** for public repositories.
4. For public repositories:
   - Enter your repository URL and branch.
   - Select **Nixpacks** as the build option for ease.
   - Click **Deploy**. 🎯

To access your application, first add a domain or expose a port under the **Domains** tab.

## Configuring Domains and SSL

1. Navigate to **Settings → Domains**.
2. Enter your domain name and email.
3. Select **Let’s Encrypt** from the certificate dropdown.
4. Update your domain’s DNS A-record to point to your server's IP.

✅ Your site is now securely accessible with SSL.

## Adding Databases and Managing Backups

DocPloy supports PostgreSQL, MySQL, MariaDB, and Redis databases:

1. Click **Create Service → Database**, select your DB type, and fill in the details.
2. Set up automated backups by adding an S3 bucket in **Settings → S3 destinations**.

Your database is now ready and securely backed up!

## Auto-Deployment with GitHub

Enable automatic deployments:

- Go to your project's main page and toggle **Auto Deploy**. Your app will now update automatically whenever you push changes to GitHub.

## Conclusion

With DocPloy, you enjoy the flexibility and control of self-hosting, combined with the convenience of managed platforms. It's perfect for developers looking for cost-effective, customizable hosting solutions.

## 💡 Tips & Fun Facts

- **Tip:** Regularly check the DocPloy GitHub page; the community actively adds new features!
- **Fun Fact:** DocPloy combines the simplicity of platforms like Vercel with powerful, customizable Docker and Traefik setups.

---

Feel free to explore other open-source alternatives like **CapRover**, **Kifi**, and **Render** to find the perfect match for your needs. Happy deploying! 🚀

