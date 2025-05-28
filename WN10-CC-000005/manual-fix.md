# 🛡️ Manual Fix – STIG ID: WN10-CC-000005

## 🖥️ Title:
Camera Access from the Lock Screen Must Be Disabled

---

## 🖥️ Description:
This STIG requires disabling camera access on the lock screen to reduce the risk of unauthorized use of the camera without authentication. If the device does not have a camera, this setting is **Not Applicable (NA)** and must be documented.

---

## 🔍 Registry Check

- **Registry Path:**  
  `HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization`

- **Value Name:** `NoLockScreenCamera`  
- **Value Type:** `REG_DWORD`  
- **Value (Decimal):** `1`

---

## 🔧 Steps (Group Policy Editor):

1. Press `Windows + R`, type `gpedit.msc`, and press Enter.
2. Navigate to:  
   `Computer Configuration > Administrative Templates > Control Panel > Personalization`
3. Double-click **"Prevent enabling lock screen camera"**
4. Set the setting to:
   - **Enabled**
5. Click **Apply**, then **OK**

---

## 🔧 Steps (Registry Editor):

1. Press `Windows + R`, type `regedit`, and press Enter.
2. Navigate to:  
   `HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization`
3. If `NoLockScreenCamera` does not exist:
   - Right-click in the right pane → **New** → **DWORD (32-bit) Value**
   - Name it: **NoLockScreenCamera**
4. Double-click **NoLockScreenCamera**:
   - Choose **Decimal**
   - Enter: `1`
5. Click **OK** and close Registry Editor.
6. Restart the system or run `gpupdate /force` to apply changes.

---

## 🧪 How to Verify

- Open **Registry Editor** and confirm:
  - `NoLockScreenCamera` exists at the specified path.
  - Value is set to **1**

- OR open **Group Policy Editor** and confirm:
  - **Prevent enabling lock screen camera** is set to **Enabled**
