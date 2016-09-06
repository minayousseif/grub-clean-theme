#!/bin/bash
echo ""
echo "Installing Clean-Boot-Theme..."
echo ""
ThemesFolder="/usr/share/grub/themes"
CleanThemeFolder="/usr/share/grub/themes/clean-theme"
#create the theme folder if it doesn't exits
if [ ! -d "$ThemesFolder" ]; then
  echo "Creating Themes Folder."
  sudo mkdir -p "$ThemesFolder"
else
  echo "Themes Folder Exists."
fi
if [ -d "$ThemesFolder" ]; then
  if [ ! -d "$CleanThemeFolder" ]; then
    echo "Coping theme files..."
    sudo cp -r ./clean-theme "$ThemesFolder"
  else
    while true; do
      read -p "Theme files already exists! do you wany to override it [Y/N]?" confirm
      case $confirm in
        [Yy]* )
        echo "Coping theme files..."
        sudo cp -r ./clean-theme "$ThemesFolder"
        break;;
        [Nn]* ) break;;
        * ) echo "Please answer Y or N." ;;
      esac
    done
  fi
fi
echo "Turn Off MEMTEST86+"
sudo chmod -x /etc/grub.d/20_memtest86+

echo "Updating grub config file."
sudo sed s/'#GRUB_DISABLE_LINUX_RECOVERY="true"'/'GRUB_DISABLE_LINUX_RECOVERY="true"'/g -i /etc/default/grub
grep -q -F "GRUB_THEME=$CleanThemeFolder/theme.txt" /etc/default/grub || echo "GRUB_THEME=$CleanThemeFolder/theme.txt" >> /etc/default/grub
#sudo update-grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
echo ""
echo "Clean-Boot-Theme Installed"
echo ""
exit 0
