# 🛠️ Manual Fix – STIG ID: WN10-AU-000500

## 📌 Title:
Set Application Log Maximum Size to 32 MB or Greater

---

## 📖 Description:
This STIG requires that the **Application event log** file size be configured to **32768 KB (32 MB)** or greater to ensure sufficient audit records are retained.

> ❗ If the system sends audit records directly to an audit server, this STIG is **Not Applicable (NA)**. This exception must be documented by the ISSO.

---

## 🔍 Registry Check

- **Registry Path:**  
  `HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application`

- **Value Name:** `MaxSize`  
- **Type:** `REG_DWORD`  
- **Value (Decimal):** `32768` or greater

---

## 🛠️ Fix Using Group Policy

1. Press `Windows + R`, type `gpedit.msc`, and press Enter.
2. Navigate to:  Computer Configuration > Administrative Templates > Windows Components > Event Log Service > Application
3. Double-click **"Specify the maximum log file size (KB)"**
4. Set it to:
- **Enabled**
- **Maximum Log Size (KB):** `32768` or higher
5. Click **Apply** and **OK**
6. Run the following in Command Prompt (as Administrator): gpupdate /force 

## 🛠️ Fix Using Registry Editor

> ⚠️ **Always back up your registry before making changes.**

1. Press `Windows + R`, type `regedit`, and press Enter.
2. Navigate to:  
   `HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application`
3. If `MaxSize` doesn’t exist:
   - Right-click in the right pane → **New > DWORD (32-bit) Value**
   - Name it `MaxSize`
4. Double-click `MaxSize`:
   - Choose **Decimal**
   - Enter value: `32768` (or greater)
5. Click **OK** and close Registry Editor.
6. Restart the system or run the following command in Command Prompt (as Administrator): gpupdate /force

## ✅ How to Verify

- Open **Event Viewer** (`eventvwr.msc`)
- Right-click **Application log** → **Properties**
- Confirm **Maximum log size** is set to at least **32768 KB**
