# common tasks that needs to be done before installing any packages.

# check time&date
# partioning (option for LUKS encryption)
# formatting
# vconsole keymap
# keymap
# locale


# a way to check whether it's EFI boot mode or BIOS mode.

mount /dev/sda2 /mnt
mount --mkdir /dev/sda1 /mnt/boot/efi
