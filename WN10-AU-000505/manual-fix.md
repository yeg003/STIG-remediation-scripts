# 🛡️ Manual Fix – STIG ID: WN10-AU-000505

## 📌 Title:
The Security Event Log Size Must Be Configured to 1024000 KB or Greater

---

## 🖥️ Description:
This STIG ensures the **Security log** is large enough (at least 1 GB) to retain critical audit events for review and compliance. Insufficient log sizes may lead to log overwrites or missing security data.

> ❗ If audit records are forwarded to a central logging solution, this finding is **Not Applicable (NA)** and must be documented by the ISSO.

---

## ✅ Manual Fix Using Registry Editor

1. Press Windows + R, type regedit, and press Enter.
2. Navigate to: `HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security`
3. If MaxSize doesn’t exist: Right-click in the right pane → New > DWORD (32-bit) Value
4. Double-click MaxSize: Choose Decimal → Enter value: 32768 (or greater)
5. Click OK and close Registry Editor.
6. Restart the system or run the following command in Command Prompt (as Administrator): gpupdate /force


