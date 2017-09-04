param(
    [Parameter(Mandatory=$true)]
    [ValidateScript({Test-Path $_})]
    [string]$Path,

    [Parameter()]
    [ValidateSet('Hard','Medium','Soft')]
    [string]$Contrast = 'Medium',

    [Parameter()]
    [ValidateSet('Light','Dark')]
    [string]$Palette = 'Dark'
)

$lnk = & ("$PSScriptRoot\Get-Link.ps1") $Path

# Set Light/Dark Palette and Contrast-Specific Colors
if ($Palette -eq "Dark") {
    if ($Contrast -eq "Hard") {
        $lnk.ConsoleColors[0] ="#1d2021"
    } elseif ($Contrast -eq "Soft") {
        $lnk.ConsoleColors[0] ="#32302f"
    } else {
        $lnk.ConsoleColors[0] ="#282828"
    }
    $lnk.ConsoleColors[1] ="#458588"
    $lnk.ConsoleColors[2] ="#98971a"
    $lnk.ConsoleColors[3] ="#689d6a"
    $lnk.ConsoleColors[4] ="#cc241d"
    $lnk.ConsoleColors[5] ="#b16286"
    $lnk.ConsoleColors[6] ="#d79921"
    $lnk.ConsoleColors[7] ="#a89984"
    $lnk.ConsoleColors[8] ="#928374"
    $lnk.ConsoleColors[9] ="#83a598"
    $lnk.ConsoleColors[10]="#b8bb26"
    $lnk.ConsoleColors[11]="#8ec07c"
    $lnk.ConsoleColors[12]="#fb4934"
    $lnk.ConsoleColors[13]="#d3869b"
    $lnk.ConsoleColors[14]="#fabd2f"
    $lnk.ConsoleColors[15]="#ebdbb2"
    $lnk.PopUpBackgroundColor=0xf
    $lnk.PopUpTextColor=0x0
    $lnk.ScreenBackgroundColor=0x0
    $lnk.ScreenTextColor=0xf
} else {
    if ($Contrast -eq "Hard") {
        $lnk.ConsoleColors[0] ="#f9f5d7"
    } elseif ($Contrast -eq "Soft") {
        $lnk.ConsoleColors[0] ="#f2e5bc"
    } else {
        $lnk.ConsoleColors[0] ="#fbf1c7"
    }
    $lnk.ConsoleColors[1] ="#458588"
    $lnk.ConsoleColors[2] ="#98971a"
    $lnk.ConsoleColors[3] ="#689d6a"
    $lnk.ConsoleColors[4] ="#cc241d"
    $lnk.ConsoleColors[5] ="#b16286"
    $lnk.ConsoleColors[6] ="#d79921"
    $lnk.ConsoleColors[7] ="#7c6f64"
    $lnk.ConsoleColors[8] ="#928374"
    $lnk.ConsoleColors[9] ="#076678"
    $lnk.ConsoleColors[10]="#79740e"
    $lnk.ConsoleColors[11]="#427b58"
    $lnk.ConsoleColors[12]="#9d0006"
    $lnk.ConsoleColors[13]="#8f3f71"
    $lnk.ConsoleColors[14]="#b57614"
    $lnk.ConsoleColors[15]="#3c3836"
    $lnk.PopUpBackgroundColor=0xf
    $lnk.PopUpTextColor=0x0
    $lnk.ScreenBackgroundColor=0x0
    $lnk.ScreenTextColor=0xf
}

$lnk.Save()

Write-Host "Updated $Path to $Contrast $Palette Gruvbox"