# Grub2 Clean Theme

This a clean theme for the grub2 bootloader designed for 1920x1080 resoulution. forked from [Surface-Boot-Themes](https://github.com/webbrandon/Surface-Boot-Themes/) by [@webbrandon](https://github.com/webbrandon) and inspired by [Grub2 Theme Vimix](https://github.com/Se7endAY/grub2-theme-vimix)

## Installation

1. clone or download this repository.
2. if you decide to keep the advanced options menu/ recovery menu then add the recovery title and icon for kernel repair.

  Open /etc/grub.d/10_linux and search for (towards bottom):
  ```sh
    echo "submenu '$(gettext_printf "Advanced options for %s" "${OS}" | grub_quote)'
  ```
  Insert the following immediatly after:
  ```
  --class recovery --class repair
  ```
  then edit "Advanced options for %s" to "Repair %s" or something to your liking)

3. Make the Secure Boot title and icon.

  Open `/etc/grub.d/30_uefi-firmware` and search for (towards the bottom) :
  ```sh
  menuentry '$LABEL'
  ```
  Insert the following immediatly after:  --class secure --class recovery
  (note: replace `LABEL=System Setup` with `LABEL=Secure Boot`)

4. cd into the /grub-clean-theme directory you cloned and run the install script
```sh
$ sudo ./install.sh
```

## References

1. [Grub2 theme tutorial](http://wiki.rosalab.ru/en/index.php/Grub2_theme_tutorial)
2. [Grub2 theme file format](https://www.gnu.org/software/grub/manual/html_node/Theme-file-format.html)
3. [Grub 2 Tweaks](https://ubuntuforums.org/showthread.php?t=1287602)

## Credits

The OS icons are from [Minimal BURG Theme][icons] by [P11-G545][icon-author].

The background is [Sweet Caffiene][wallpaper] by [Joe Fedewa][wallpaper-author].
I tweaked it a bit using photoshop and included the PSD file in the repo.

[icons]: http://www.deviantart.com/art/Minimal-BURG-theme-with-Win8-logo-526184352
[icon-author]: http://p11-g545.deviantart.com/

[wallpaper]: http://phandroid.com/2014/10/11/android-wallpaper-coffee/
[wallpaper-author]: http://phandroid.com/author/joe-fedewa/
