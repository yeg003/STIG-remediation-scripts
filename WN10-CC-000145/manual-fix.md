# 🛡️ Manual Fix – STIG ID: WN10-CC-000145

## 📌 Title:
Users Must Be Prompted for a Password on Resume from Sleep (On Battery)

---

## 🖥️ Description:
This STIG ensures that users are prompted for a password when a system resumes from sleep while running on battery power. Requiring reauthentication reduces the risk of unauthorized access when a device is left unattended.

---

## ✅ Manual Fix Using Local Group Policy

> ⚠️ For domain-joined systems, configure this using Group Policy Management on a domain controller.

### 🔧 Steps:

1. Press `Windows + R`, type `gpedit.msc`, and press Enter.
2. Navigate to: Computer Configuration > Administrative Templates > System > Power Management > Sleep Settings
3. Double-click **"Require a password when a computer wakes (on battery)"**
4. Set the policy to:
- **Enabled**
5. Click **Apply**, then **OK**
