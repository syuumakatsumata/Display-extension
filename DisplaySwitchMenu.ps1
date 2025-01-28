# DisplaySwitchMenu_NoLoop.ps1

# Windowsフォーム関連のアセンブリをロード
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# フォームを作成
$form = New-Object System.Windows.Forms.Form
$form.Text = "ディスプレイ表示モード選択"
$form.Size = New-Object System.Drawing.Size(300, 300)
$form.StartPosition = "CenterScreen"

# ラベルを作成
$label = New-Object System.Windows.Forms.Label
$label.Text = "表示モードを選択してください："
$label.AutoSize = $true
$label.Location = New-Object System.Drawing.Point(50, 20)
$form.Controls.Add($label)

# ------------------------------------------------------------
# 1. PC画面のみ
# ------------------------------------------------------------
$btnPCOnly = New-Object System.Windows.Forms.Button
$btnPCOnly.Text = "PC画面のみ"
$btnPCOnly.Size = New-Object System.Drawing.Size(180, 30)
$btnPCOnly.Location = New-Object System.Drawing.Point(60, 60)

$btnPCOnly.Add_Click({
    & "$env:SystemRoot\System32\DisplaySwitch.exe" /internal
    $form.Close()
})

$form.Controls.Add($btnPCOnly)

# ------------------------------------------------------------
# 2. 複製
# ------------------------------------------------------------
$btnClone = New-Object System.Windows.Forms.Button
$btnClone.Text = "複製"
$btnClone.Size = New-Object System.Drawing.Size(180, 30)
$btnClone.Location = New-Object System.Drawing.Point(60, 100)

$btnClone.Add_Click({
    & "$env:SystemRoot\System32\DisplaySwitch.exe" /clone
    $form.Close()
})

$form.Controls.Add($btnClone)

# ------------------------------------------------------------
# 3. 拡張
# ------------------------------------------------------------
$btnExtend = New-Object System.Windows.Forms.Button
$btnExtend.Text = "拡張"
$btnExtend.Size = New-Object System.Drawing.Size(180, 30)
$btnExtend.Location = New-Object System.Drawing.Point(60, 140)

$btnExtend.Add_Click({
    & "$env:SystemRoot\System32\DisplaySwitch.exe" /extend
    $form.Close()
})

$form.Controls.Add($btnExtend)

# ------------------------------------------------------------
# 4. セカンドスクリーンのみ
# ------------------------------------------------------------
$btnExternal = New-Object System.Windows.Forms.Button
$btnExternal.Text = "セカンドスクリーンのみ"
$btnExternal.Size = New-Object System.Drawing.Size(180, 30)
$btnExternal.Location = New-Object System.Drawing.Point(60, 180)

$btnExternal.Add_Click({
    & "$env:SystemRoot\System32\DisplaySwitch.exe" /external
    $form.Close()
})

$form.Controls.Add($btnExternal)

# ------------------------------------------------------------
# フォームの表示
# ------------------------------------------------------------
$form.Topmost = $true
$form.Add_Shown({$form.Activate()})
[void]$form.ShowDialog()