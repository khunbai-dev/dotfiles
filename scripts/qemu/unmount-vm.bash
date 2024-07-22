#!/usr/bin/bash

sudo umount /run/media/khunbai/qemu_images &&
sudo rm -rf /run/media/khunbai/qemu_images &&
sudo cryptsetup luksClose encrypted_vm_partition &&

sudo umount /run/media/khunbai/Linux_space &&
sudo rm -rf /run/media/khunbai/Linux_space &&
sudo cryptsetup luksClose encrypted_linux_space

echo "  Unmounting Done!"
