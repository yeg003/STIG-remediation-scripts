# 🛡️ Manual Fix – STIG ID: WN10-CC-000020

## 🖥️ Title:
IPv6 Source Routing Must Be Configured to Highest Protection

---

## 🖥️ Description:
Disabling IPv6 source routing protects against IP spoofing attacks by preventing malicious traffic from manipulating the routing path. This STIG enforces the highest protection setting by disabling source routing entirely.

---

## 🔍 Registry Check

- **Registry Path:**  
  `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters`

- **Value Name:** `DisableIpSourceRouting`  
- **Value Type:** `REG_DWORD`  
- **Value (Decimal):** `2` (Highest Protection)

---

## 🔧 Steps (Group Policy Editor):

> ⚠️ *This setting requires importing the MSS-Legacy ADMX templates into your Group Policy Editor.*

1. Press `Windows + R`, type `gpedit.msc`, and press Enter.
2. Navigate to:  
   `Computer Configuration > Administrative Templates > MSS (Legacy)`
3. Locate **"MSS: (DisableIPSourceRouting IPv6) IP source routing protection level (protects against packet spoofing)"**
4. Double-click the policy and set it to:
   - **Enabled**
   - Choose: **Highest protection, source routing is completely disabled**
5. Click **Apply**, then **OK**

---

## 🔧 Steps (Registry Editor):

1. Press `Windows + R`, type `regedit`, and press Enter.
2. Navigate to:  
   `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters`
3. If `DisableIpSourceRouting` does not exist:
   - Right-click in the right pane → **New** → **DWORD (32-bit) Value**
   - Name it: **DisableIpSourceRouting**
4. Double-click **DisableIpSourceRouting**:
   - Choose **Decimal**
   - Enter: `2`
5. Click **OK** and close Registry Editor.
6. Restart the system or run `gpupdate /force` to apply changes.

---

## 🧪 How to Verify

- Open **Registry Editor** and confirm:
  - `DisableIpSourceRouting` is set to **2** under the specified path
- OR check via PowerShell:
```powershell
Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" -Name DisableIpSourceRouting
