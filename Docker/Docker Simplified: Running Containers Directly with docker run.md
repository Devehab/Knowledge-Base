# 🚀 Docker Simplified: Running Containers Directly with `docker run`

Docker makes it easy to package and run your applications inside isolated environments called containers. While `docker-compose.yml` files help manage multiple containers and complex setups, sometimes you might just want a simple way to run a single Docker container directly. In this article, we'll walk through the process step-by-step, even if you've never used Docker before!

---

## 📚 Table of Contents

- [Introduction: Docker Basics](#introduction-docker-basics)
- [Understanding Docker Compose vs. Docker Run](#understanding-docker-compose-vs-docker-run)
- [Running Your Docker Container Directly](#running-your-docker-container-directly)
  - [Step 1: Creating a Docker Network (Optional)](#step-1-creating-a-docker-network-optional)
  - [Step 2: Running the Container with `docker run`](#step-2-running-the-container-with-docker-run)
- [Explaining the Docker Command](#explaining-the-docker-command)
- [Tips & Fun Facts](#tips--fun-facts)
- [Conclusion](#conclusion)

---

## Introduction: Docker Basics

Docker is a powerful tool that lets you run applications inside containers. Containers are isolated units that contain everything your application needs to run, including code, libraries, and settings. Think of containers like portable mini-computers that you can easily move and run anywhere! 🌍

---

## Understanding Docker Compose vs. Docker Run

When you start using Docker, you'll come across two common ways to run containers:

- **Docker Compose (`docker-compose.yml`)**: Used for running and managing multiple containers, networks, and configurations easily.
- **Docker Run (`docker run`)**: Ideal for quickly running individual containers directly with a simple command.

Today, we'll focus on how to use `docker run` to simplify your workflow.

---

## Running Your Docker Container Directly

Suppose you have the following settings from a `docker-compose.yml` file:

- **Image**: `devehab/subtube:latest`
- **Container Name**: `subtube`
- **Restart Policy**: `unless-stopped`
- **Ports**: Map port `5000` locally to port `5000` in the container
- **Environment Variables**:
  - `FLASK_ENV=production`
  - `FLASK_APP=app.py`
- **Network**: Custom network `app-network`

Here's how you can translate this setup into a simple `docker run` command:

### Step 1: Creating a Docker Network (Optional)

If you need a specific Docker network (like `app-network`), create it first:

```bash
docker network create app-network
```

💡 *Note:* Skip this step if you're okay using Docker's default network (`bridge`).

### Step 2: Running the Container with `docker run`

Run your container with the following command:

```bash
docker run --name subtube \
  --restart unless-stopped \
  -p 5000:5000 \
  -e FLASK_ENV=production \
  -e FLASK_APP=app.py \
  --network app-network \
  devehab/subtube:latest
```

✅ Your container should now be up and running!

---

## Explaining the Docker Command

Let's break down each part of the `docker run` command:

- `--name subtube`: Sets the name of your container as `subtube`.
- `--restart unless-stopped`: Ensures the container restarts automatically unless manually stopped.
- `-p 5000:5000`: Connects your local machine's port `5000` to the container's port `5000`.
- `-e FLASK_ENV=production`: Sets the environment variable `FLASK_ENV` to `production`.
- `-e FLASK_APP=app.py`: Sets the environment variable `FLASK_APP` to `app.py`.
- `--network app-network`: Connects the container to your custom Docker network.
- `devehab/subtube:latest`: Specifies the Docker image to use.

---

## Tips & Fun Facts

- 💡 **Tip**: If you don't need a specific network, omit the `--network app-network` part. Docker will automatically use the default network.
- 🚀 **Fun Fact**: Tools like [Composerize](https://composerize.com/) can help convert Docker commands into `docker-compose.yml` files and vice versa, making transitions between formats easier!

---

## Conclusion

By following these simple steps, you've learned how to run Docker containers directly with `docker run`. This approach is perfect for quick tests, simple setups, or environments where Docker Compose isn't supported.

Now you're ready to confidently manage your Docker containers! 🎉

