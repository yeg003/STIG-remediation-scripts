# 🛠️ Manual Fix – STIG ID: WN10-AC-000005

## 📌 Title:
Account Lockout Duration Must Be Set to 15 Minutes or Greater

---

## 📖 Description:
This STIG requires that the account lockout duration be set to **15 minutes or greater**, or to **0**, which requires an administrator to manually unlock the account. This setting helps prevent brute-force login attacks by enforcing a timeout after repeated failed login attempts.

---

## ✅ Manual Fix Using Local Group Policy

> ⚠️ For domain-joined systems, apply this setting using Group Policy Management on a domain controller.

### 🔧 Steps:

1. Press `Windows + R`, type `gpedit.msc`, and press Enter.
2. Navigate to: Computer Configuration > Windows Settings > Security Settings > Account Policies > Account Lockout Policy
3. Double-click **"Account lockout duration"**
4. Set the value to **15** or more minutes (or **0** to require admin unlock)
5. Click **Apply**, then **OK**

> 🔁 A reboot is not required. This policy applies immediately to future lockout scenarios.

---

## 🧪 How to Verify

1. Open `gpedit.msc`
2. Navigate to:  
`Account Lockout Policy`
3. Confirm **"Account lockout duration"** is set to **15** or more, or is exactly **0**

---
