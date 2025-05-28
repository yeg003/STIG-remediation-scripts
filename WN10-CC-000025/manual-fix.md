# 🛡️ Manual Fix – STIG ID: WN10-CC-000025

## 🖥️ Title:
The System Must Be Configured to Prevent IP Source Routing

---

## 🖥️ Description:
Disabling IP source routing protects the system from spoofing attacks that manipulate packet routing paths. This STIG ensures that IP source routing is completely disabled using the highest protection level.

---

## 🔍 Registry Check

- **Registry Path:**  
  `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters`

- **Value Name:** `DisableIPSourceRouting`  
- **Value Type:** `REG_DWORD`  
- **Value (Decimal):** `2` (Highest Protection)

---

## 🔧 Steps (Group Policy Editor):

> ⚠️ *Requires MSS-Legacy ADMX templates*

1. Press `Windows + R`, type `gpedit.msc`, and press Enter.
2. Navigate to:  
   `Computer Configuration > Administrative Templates > MSS (Legacy)`
3. Find:  
   **"MSS: (DisableIPSourceRouting) IP source routing protection level (protects against packet spoofing)"**
4. Double-click the policy and set it to:
   - **Enabled**
   - Choose: **Highest protection, source routing is completely disabled**
5. Click **Apply**, then **OK**

---

## 🔧 Steps (Registry Editor):

1. Press `Windows + R`, type `regedit`, and press Enter.
2. Navigate to:  
   `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters`
3. If `DisableIPSourceRouting` does not exist:
   - Right-click in the right pane → **New** → **DWORD (32-bit) Value**
   - Name it: **DisableIPSourceRouting**
4. Double-click **DisableIPSourceRouting**:
   - Select **Decimal**
   - Enter value: `2`
5. Click **OK** and close Registry Editor.
6. Restart the system or run `gpupdate /force` to apply.

---

## 🧪 How to Verify

- Open **Registry Editor** and confirm:
  - `DisableIPSourceRouting = 2` under the specified path
- OR run this in PowerShell:
```powershell
Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name DisableIPSourceRouting
