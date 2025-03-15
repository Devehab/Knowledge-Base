# 🚨 How to Safely Remove Leaked API Keys from Git Repository History 🚨

Accidentally leaking API keys or sensitive data in your Git repository can expose your project to significant security risks. 🔐 Here's a friendly, easy-to-follow guide with clear examples to help you securely remove sensitive information from your Git repository.

## ⚠️ Step 1: Immediately Revoke the Exposed API Key

As soon as you notice the leak, revoke or regenerate the compromised API key through your service provider's dashboard. This step is crucial to protect your data from unauthorized use! 🛡️

---

## 🛠️ Removing Sensitive Information from Git History:

### 🚩 Option A: Replace Sensitive Data Using `git filter-repo`

This method removes sensitive data without deleting files from your history.

✅ **Install `git filter-repo`**:
- **Homebrew (macOS)** 🍺:
```bash
brew install git-filter-repo
```
- Or manually from [git-filter-repo repository](https://github.com/newren/git-filter-repo).

✅ **Replace Sensitive Data:**

1. 📂 Go to your repository folder:

```bash
cd /path/to/your/repository
```

2. 📝 Create a file (`sensitive_data.txt`) with content like:

```bash
# Text to replace
secret_api_key==>REMOVED
```

3. 🚀 Run the replace command:

```bash
git filter-repo --replace-text sensitive_data.txt
```

This replaces your API key with "REMOVED" across the entire commit history.

---

### 🗑️ Option B: Completely Delete Files from Git History

Use this method if you want to completely remove files and their contents from your repository history:

```bash
git filter-repo --path path/to/your/sensitive_file --invert-paths
```

✨ This completely erases the file from history, ensuring it cannot be retrieved or viewed.

---

### 📌 Option C: Delete Files (but Remain in Commit History)

Use this option if your file doesn't contain sensitive data, but you want it removed from the current branch only:

```bash
git rm -r filename1 filename2
git commit -m "Remove non-sensitive files"
git push origin main
```

⚠️ Note: The deleted files remain accessible in older commits.

---

## 🚧 Step 2: Force Push the Updated History to Remote Repository

After rewriting your history (Options A or B), update your remote repository:

```bash
git push origin --force --all
```

To update tags as well:

```bash
git push origin --force --tags
```

---

## 📢 Step 3: Notify Collaborators

Always inform your collaborators about history rewrites to avoid conflicts. Recommend they clone a fresh repository or update their local copies accordingly.

---

## 🛡️ Prevent Future Leaks:

- **📌 Update `.gitignore`:** Exclude sensitive files from tracking.
- **🌐 Use Environment Variables:** Keep sensitive info secure and separate from your source code.
- **🔍 Leak Detection Tools:** Utilize tools like [GitGuardian](https://www.gitguardian.com/) to detect and prevent leaks proactively.

---

🎥 **Need a Visual Guide?** Check out this helpful video tutorial:
[Removing Sensitive Data from Git History](https://www.youtube.com/watch?v=hoj1J65jUOI)

Happy and secure coding! 🚀✨

