# tasks that needs to be done, before chrooting to the newly installed system


pacman -Sy
pacman -S archlinux-keyring

# if in virtualbox no need for firmware packages
pacstrap -K /mnt base linux linux-firmware linux-network-firmware

genfstab -U /mnt > /etc/fstab

arch-chroot /mnt

# other packages
pacman -S vim tmux networkmanager nm-connection-applet # vpn extensions

# WM choises: i3 or dwm
