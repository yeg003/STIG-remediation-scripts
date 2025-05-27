# 🛠️ Manual Fix – STIG ID: WN10-AC-000020

## 📌 Title:
Password History Must Be Set to 24 Passwords Remembered

---

## 📖 Description:
This STIG requires that Windows systems be configured to **remember the last 24 passwords** for each user account. This prevents users from reusing recent passwords and reduces the risk of password-based attacks.

> ❗ This policy applies to both standalone and domain-joined systems.

---

## ✅ Manual Fix Using Local Group Policy

> ⚠️ For domain-joined systems, configure this via **Group Policy Management** on a domain controller.

### 🔧 Steps:

1. Press `Windows + R`, type `gpedit.msc`, and press Enter.
2. Navigate to:  Computer Configuration > Windows Settings > Security Settings > Account Policies > Password Policy
3. Double-click **"Enforce password history"**
4. Set the value to **24**
5. Click **Apply**, then **OK**

> 🔁 A reboot is not required, but the new policy applies to future password changes.

---

## 🧪 How to Verify

1. Open `gpedit.msc`
2. Navigate to:  
`Computer Configuration > Windows Settings > Security Settings > Account Policies > Password Policy`
3. Confirm **"Enforce password history"** is set to **24**

---
