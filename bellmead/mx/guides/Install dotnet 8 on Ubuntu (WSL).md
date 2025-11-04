To install **.NET 8 on WSL (Ubuntu)**, follow these steps:

---

## ✅ Step-by-Step Guide

### 1. **Install Microsoft’s package signing key and repository**

Run the following commands:

```bash
# Download and install the Microsoft package signing key
wget https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb

# Register the Microsoft package repository
sudo dpkg -i packages-microsoft-prod.deb

# Clean up
rm packages-microsoft-prod.deb
```

---

### 2. **Update your package list**

```bash
sudo apt update
```

---

### 3. **Install required dependencies**

```bash
sudo apt install -y apt-transport-https
```

---

### 4. **Install the .NET 8 SDK (for building apps)**

```bash
sudo apt install -y dotnet-sdk-8.0
```

> If you only want the runtime (to run apps, not build them):

```bash
sudo apt install -y dotnet-runtime-8.0
```

---

### 5. **Verify the installation**

```bash
dotnet --version
```

You should see something like:

```
8.0.x
```

---

## 📦 Optional: Install ASP.NET Core Runtime

If you're running web applications:

```bash
sudo apt install -y aspnetcore-runtime-8.0
```

---

## ✅ Tip: Keep it up to date

You can run:

```bash
sudo apt update && sudo apt upgrade
```

to stay current with patches and minor version updates.

---

Let me know if you'd like a script version of this for automation or if you're using a specific version of Ubuntu inside WSL.