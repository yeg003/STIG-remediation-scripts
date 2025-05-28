# 🛡️ Manual Fix – STIG ID: WN10-AU-000510

## 🖥️ Title:
The System Event Log Size Must Be Configured to 32768 KB or Greater

---

## 🖥️ Description:
This STIG ensures the **System event log** retains enough audit data by setting a **minimum log size of 32768 KB (32 MB)**. A log that is too small may quickly fill up and cause older events to be overwritten before administrators can review them.

> ❗ If the system is configured to send audit records directly to an audit server, this requirement is **Not Applicable (NA)** and must be documented with the ISSO.

---

## 🔍 Registry Check

- **Registry Path:**  
  `HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\System`

- **Value Name:** `MaxSize`  
- **Value Type:** `REG_DWORD`  
- **Value (Decimal):** `32768` or greater

---

## 🔧 Steps (Group Policy Editor):

1. Press `Windows + R`, type `gpedit.msc`, and press Enter.
2. Navigate to:  
   `Computer Configuration > Administrative Templates > Windows Components > Event Log Service > System`
3. Double-click **"Specify the maximum log file size (KB)"**
4. Set the setting to:
   - **Enabled**
   - **Maximum Log Size (KB):** `32768` or higher
5. Click **Apply**, then **OK**

---

## 🔧 Steps (Registry Editor):

1. Press `Windows + R`, type `regedit`, and press Enter.
2. Navigate to:  
   `HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\System`
3. If `MaxSize` does not exist:
   - Right-click in the right pane → **New** → **DWORD (32-bit) Value**
   - Name it: **MaxSize**
4. Double-click **MaxSize**:
   - Choose **Decimal**
   - Enter: `32768` (or greater)
5. Click **OK** and close Registry Editor.
6. Restart the system or run `gpupdate /force` in Command Prompt (as Administrator).

---

## 🧪 How to Verify

- Open **Registry Editor** and ensure:
  - `MaxSize` exists at `HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\System`
  - Value is set to **32768** or greater (decimal)

- Or use Group Policy:
  - Open `gpedit.msc`
  - Check that **"Specify the maximum log file size (KB)"** under the System log is **Enabled** with a value of **32768** or higher.

---
