Gruvbox - Command Prompt Theme
==============================

This is a [Gruvbox][1] color scheme, adapted by Andrew Reid East from the [Solarized][2] color scheme for the Windows command prompt, contributed by Neil Pankey. Solarized inspired by this [post][3].

See the [Gruvbox repository][1] for screenshots and more details,
as well as [color schemes][4] for other applications.

Making Gruvbox work for cmd.exe, Bash on Ubuntu on Windows, and PowerShell,
and striking a balance with how other Gruvbox projects are implemented
presents some challenges. The following [table][5] shows how the colors are mapped.

To make sure that the terminal is likely to use the best matching, the
ColorTable is aligned with TERMCOL values. These values were pulled from PuTTY
and other Gruvbox terminal profiles. This allows the same ANSI escape
sequences to show the same in ANSI supported terminals. The PowerShell default
colors are also matched for the $Host.PrivateData and PSReadLine to make them
seemingly fit with the rest of the environments.

WARNING
-------

Below are very simplified installation instructions. ~~It **will not** update
existing shortcuts because they have their own color mapping.~~ With this
latest version of the project, it is possible to apply to existing shortcuts,
but it **will not** be easy to revert that change. It **will not** always play
nice with traditional unix tools or compatability shims because Windows uses a
fundamentally different color code mapping.

Installation
------------

### Update Registry for Console
While this was the original process, this only changes the registry default
and doesn't update the Command Prompt and PowerShell defaults when you launch
those shortcuts. It is still something you may wish to do, but the recommended
process is now to use the Update-Link utility.

Import the `.reg` file of choice, e.g. `regedit /s gruvbox-dark-medium.reg`.

Both files contain the same palettes, the only difference is the default
foreground and background colors. Therefore you can switch between themes on
the fly with `color 01` for dark and `color F6` for light.

### Update Command Prompt and PowerShell shortcut .lnks
Locate the link you wish to modify, such as Command Prompt. The easiest way to
do this on Windows 10 is to click `Start`, then type in the command you want to
change. When it appears in the list, right-click and select `Open file
location`. This will open an Explorer window and show you the shortcut. Hold
shift and right-click on the shortcut, then select `Copy as path`. Now open a
Command Prompt to the location of this project. In the Command Prompt window
use this command.

    Update-Link "<shortcut.lnk>" [hard|medium|soft] [dark|light]

The path to the shortcut.lnk is the same as you copied to your clipboard in the
previous step. To easily paste it in Windows 10, just right-click on the
window. If the path has spaces, you will want to wrap it in quotes, but if you
followed the recommended way to use `Copy as path`, it will be done for you. If
no theme is given, `Update-Link` will default to Gruvbox Dark.

### Update your PowerShell profile
Copy the `Set-Gruvbox*ColorDefaults.ps1` files to your profile directory,
likely `~\Documents\WindowsPowerShell\`. Then add the following line of code
to the end of your `Microsoft.PowerShell_profile.ps1` or `profile.ps1`:

    . (Join-Path -Path (Split-Path -Parent -Path $PROFILE) -ChildPath $(switch($HOST.UI.RawUI.BackgroundColor.ToString()){'White'{'Set-GruvboxLightColorDefaults.ps1'}'Black'{'Set-GruvboxDarkColorDefaults.ps1'}default{return}}))

Uninstall
---------

### Registry for Console
The file `windows-old-defaults.reg` is provided to restore the command prompt
colors back to their shipping defaults. The registry settings have been
checked for versions of Windows back to at least Windows 7 and the values are
the same.

To restore the defaults, import the `.reg` the same way as you applied it
previously, `regedit /s windows-old-defaults.reg`.

### Command Prompt and PowerShell shortcut .lnks
Unfortunately, this is not the easiest to revert right now. One way, which is
not recommended for casual users is to edit the `Properties` of an open window.
From there, you can edit the colors manually, using the table as a guide. If
there is enough interest and demand, a future update may make it possible to
apply other themes using the `Update-Link` utility, but for now it is not very
easy to revert.

### PowerShell profile
You will also want to revert any changes you made to your PowerShell profile.
Just open the profile you created or modified and remove the code.

TODO
----

* Fix Out-Colors.ps1
* Fix Set-GruvboxDarkColorDefaults.ps1
* Fix Set-GruvboxLightColorDefaults.ps1

Screenshots
------------

### Command Prompt Old Default
![Command Prompt Old Default][6]

### Command Prompt New Default
![Command Prompt New Default][7]

### Command Prompt Hard Dark Gruvbox
![Command Prompt Hard Dark Gruvbox][8]

### Command Prompt Medium Dark Gruvbox
![Command Prompt Medium Dark Gruvbox][9]

### Command Prompt Soft Dark Gruvbox
![Command Prompt Soft Dark Gruvbox][10]

### Command Prompt Hard Light Gruvbox
![Command Prompt Hard Light Gruvbox][11]

### Command Prompt Medium Light Gruvbox
![Command Prompt Medium Light Gruvbox][12]

### Command Prompt Soft Light Gruvbox
![Command Prompt Soft Light Gruvbox][13]

[1]: https://github.com/morhetz/gruvbox
[2]: https://github.com/neilpa/cmd-colors-solarized
[3]: https://github.com/altercation/solarized/issues/127
[4]: https://github.com/morhetz/gruvbox-contrib
[5]: https://raw.github.com/bambocher/cmd-colors-gruvbox/master/color.table
[6]: https://raw.github.com/bambocher/cmd-colors-gruvbox/master/windows-old-defaults.png
[7]: https://raw.github.com/bambocher/cmd-colors-gruvbox/master/windows-new-default.png
[8]: https://raw.github.com/bambocher/cmd-colors-gruvbox/master/gruvbox-dark-hard.png
[9]: https://raw.github.com/bambocher/cmd-colors-gruvbox/master/gruvbox-medium-hard.png
[10]: https://raw.github.com/bambocher/cmd-colors-gruvbox/master/gruvbox-soft-hard.png
[11]: https://raw.github.com/bambocher/cmd-colors-gruvbox/master/gruvbox-dark-light.png
[12]: https://raw.github.com/bambocher/cmd-colors-gruvbox/master/gruvbox-medium-light.png
[13]: https://raw.github.com/bambocher/cmd-colors-gruvbox/master/gruvbox-soft-light.png
