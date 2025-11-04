To configure **Postfix with TLS** for `mxtoolbox-report.net` using your provided certificate files, here’s a secure setup guide tailored to your files:

---

## 🔐 **Files You Mentioned**

|File Type|Description|Example filename|
|---|---|---|
|`.key`|Your private key|`mxtoolbox-report.net.key`|
|`.csr`|Certificate signing request (not needed by Postfix)|`mxtoolbox-report.net.csr`|
|`.crt`|Your public certificate|`mxtoolbox-report.net.crt`|
|`ca_bundle`|Intermediate certificates from CA|`mxtoolbox-report.net.ca-bundle`|

---

## 📁 **Step 1: Combine Cert and Chain**

Postfix expects the cert file to include the full chain.

Run this:

```bash
cat mxtoolbox-report.net.crt mxtoolbox-report.net.ca-bundle > /etc/ssl/certs/mxtoolbox-report.net.fullchain.crt
```

Also copy the key:

```bash
cp mxtoolbox-report.net.key /etc/ssl/private/mxtoolbox-report.net.key
chmod 600 /etc/ssl/private/mxtoolbox-report.net.key
```

---

## 🧾 **Step 2: Postfix TLS Configuration**

In your `/etc/postfix/main.cf`, add or update the following lines:

```ini
# Enable TLS for inbound SMTP (Postfix receiving mail)
smtpd_tls_cert_file = /etc/ssl/certs/mxtoolbox-report.net.fullchain.crt
smtpd_tls_key_file = /etc/ssl/private/mxtoolbox-report.net.key
smtpd_tls_security_level = may
smtpd_tls_auth_only = yes
smtpd_tls_received_header = yes
smtpd_tls_loglevel = 1
smtpd_tls_session_cache_database = btree:${data_directory}/smtpd_scache

# Enable TLS for outbound SMTP (Postfix sending mail)
smtp_tls_security_level = may
smtp_tls_loglevel = 1
smtp_tls_session_cache_database = btree:${data_directory}/smtp_scache

# Use system CA store for client verification (if needed)
smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt
```

---

## 🚀 **Step 3: Reload Postfix**

```bash
sudo postfix check
sudo systemctl reload postfix
```

Or:

```bash
sudo postfix reload
```

---

## ✅ **Verify TLS Is Working**

You can use `openssl` to test:

```bash
openssl s_client -connect mail.mxtoolbox-report.net:25 -starttls smtp
```

You should see your certificate chain and no verification errors.

---

## 🔒 Security Tips

- Always keep your `.key` file permissions locked down (`chmod 600`, owner `root:root` or `postfix:postfix`).
    
- Only include the `.crt` and CA bundle in the combined cert file; **do not include the private key** in that file.
    

---

Would you like a script to automate all of this, or help setting up DANE/STS/etc. on top?