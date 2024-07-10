#!/bin/bash

# ==============================================================================
# This script is used to mount a USB drive, read an encrypted file from it,
# decrypt the file, and read its content into a variable.
#
# To encrypt file using openssl:
# echo "${content_to_encrypt}" > ${input_file}
# openssl enc -aes-256-cbc -pbkdf2 -in ${input_file} -out ${output_file} -k ${password}
# rm ${input_file}
# ==============================================================================

UUID="AAC40487C4045849"                 # UUID of the USB drive
LABEL="/dev/sde1"                       # Label of the USB drive
MOUNT_POINT="/home/khunbai/mnt/usb"
FILENAME="mangotree.enc"
OPENSSL_PASSPHRASE="1234"

# ====================================================================== <= BEG: Custom functions
# Function to find and mount the device
mount_device() {
    local device=$1
    # Check if the device is already mounted
    if mount | grep "on $1 type" > /dev/null; then
        echo "Device is already mounted."
        return 0
    fi

    # Attempt to mount the device
    mount "$device" "$2"
    if [ $? -eq 0 ]; then
        return 0
    else
        echo "Failed to mount $device"
        return 1
    fi
}

# Function to unmount the device
unmount_device() {
    if umount "$1"; then
        return 0
    else
        # If unmount fails, force unmount
        umount -l "$1"
        return $?
    fi
}
# ====================================================================== <= END: Custom functions

# Create USB mount point if it doesn't exist
[ ! -d "$MOUNT_POINT" ] && mkdir -p "$MOUNT_POINT"

# unmount USB
unmount_device "$LABEL"
echo "(0)"

# ====================================================================== <= BEG: Unmount all qemu disks
unmount_device /run/media/khunbai/qemu_images &&
rm -rf /run/media/khunbai/qemu_images &&
cryptsetup luksClose encrypted_vm_partition

unmount_device /run/media/khunbai/Linux_space &&
rm -rf /run/media/khunbai/Linux_space &&
cryptsetup luksClose encrypted_linux_space

unmount_device /run/media/khunbai/public_space &&
rm -rf /run/media/khunbai/public_space

echo "  Unmounting qemu disks done!"

sleep 2
# ====================================================================== <= END: Unmount all qemu disks

# ====================================================================== <= BEG: Mount USB
# Attemps mounting the device by UUID
DEVICE=$(blkid -o list | grep "$UUID" | awk '{print $1}')
mount_device "$DEVICE" "$MOUNT_POINT"
echo "(1)"

# If UUID mount failed, try to mount the device by label
if [ $? -ne 0 ]; then
    DEVICE=$(blkid -L "$LABEL")
    mount_device "$DEVICE" "$MOUNT_POINT"
    echo "(2)"
fi
# ====================================================================== <= END: Mount USB

# Check if the mount was successful
if [ $? -eq 0 ]; then
    # Check for the encrypted file and read its content into a variable
    FILE_PATH="$MOUNT_POINT/$FILENAME"
    if [ -f "$FILE_PATH" ]; then
        # Decrypt the file and read the content into the variable
        QEMU_PASSPHASE=$(openssl enc -aes-256-cbc -d -pbkdf2 -in "$FILE_PATH" -k "$OPENSSL_PASSPHRASE" | tr -d '\n')
        # echo "QEMU_PASSPHASE is $QEMU_PASSPHASE"

        # Use the decrypted passphrase with cryptsetup
        echo -n "$QEMU_PASSPHASE" | cryptsetup luksOpen /dev/disk/by-id/nvme-HS-SSD-FUTURE_1024G_30107473512 encrypted_vm_partition
        echo -n "$QEMU_PASSPHASE" | cryptsetup luksOpen /dev/disk/by-uuid/d5f8b31e-02dd-4dc4-9337-c6606478321a encrypted_linux_space

        # Create directory if not exist
        mkdir -p /run/media/khunbai/qemu_images
        mkdir -p /run/media/khunbai/Linux_space
        mkdir -p /run/media/khunbai/public_space

        # Mount public volume (non encrypt volume)
        mount /dev/disk/by-uuid/34f7992c-2d74-4178-ae6e-4fc2b48f74c7 /run/media/khunbai/public_space

        # Mount encrypt volume required for vm and give permission to access
        mount /dev/mapper/encrypted_vm_partition /run/media/khunbai/qemu_images &&
        mount /dev/mapper/encrypted_linux_space /run/media/khunbai/Linux_space &&
        chmod +x /run/media/khunbai
        
        sleep 2

        echo "  Mounting done!"
    else
        echo "File $FILENAME not found."
    fi
    
    # Wait for a moment to ensure all operations are complete
    sleep 2
    
    # Attempt to unmount the USB
    unmount_device "$MOUNT_POINT"
    rm -rf "$MOUNT_POINT"
else
    echo "Device with UUID $UUID or label $LABEL mounting failed."
fi