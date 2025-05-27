# 🛡️ Manual Fix – STIG ID: WN10-CC-000185

## 📌 Title:
The Default Autorun Behavior Must Be Configured to Prevent Autorun Commands

---

## 🖥️ Description:
This STIG requires Windows systems to **prevent autorun commands** from executing. Allowing autorun can introduce malicious code through external media like USB drives and CD-ROMs.

---

## ✅ Manual Fix Using Registry Editor

### Steps:

1. Press `Windows + R`, type `regedit.msc`, and press Enter.
2. Navigate to: `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer`
3. Ensure the value `NoAutorun` exists and is set to `1`
4. If it does not exist, create DWORD(32-bit) Value and name it NoAutorun
5. Modify the Value date to 1
