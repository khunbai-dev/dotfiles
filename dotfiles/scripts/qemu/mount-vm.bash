#!/usr/bin/bash

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Please run the script with sudo or as root."
    exit
fi

# == Read Passphrase with asterisk prompt =======================
unset PASSPHRASE
unset CHARCOUNT

echo -n "  Enter passphrase: "

stty -echo

CHARCOUNT=0
while IFS= read -p "$PROMPT" -r -s -n 1 CHAR
do
    # Enter - accept PASSPHRASE
    if [[ $CHAR == $'\0' ]] ; then
        break
    fi
    # Backspace
    if [[ $CHAR == $'\177' ]] ; then
        if [ $CHARCOUNT -gt 0 ] ; then
            CHARCOUNT=$((CHARCOUNT-1))
            PROMPT=$'\b \b'
            PASSPHRASE="${PASSPHRASE%?}"
        else
            PROMPT=''
        fi
    else
        CHARCOUNT=$((CHARCOUNT+1))
        PROMPT='*'
        PASSPHRASE+="$CHAR"
    fi
done

echo ""

stty echo
# ==============================================================

# decrypt luks partition, partion name please command `lsblk`
echo -n "$PASSPHRASE" | cryptsetup luksOpen /dev/sdb1 encrypted_vm_partition &&
echo -n "$PASSPHRASE" | cryptsetup luksOpen /dev/sdg4 encrypted_linux_space &&

unset PASSPHRASE

# Create directory if not exist
mkdir -p /run/media/khunbai/qemu_images &&
mkdir -p /run/media/khunbai/Linux_space &&

# Mount to a path and give permission to access
mount /dev/mapper/encrypted_vm_partition /run/media/khunbai/qemu_images &&
mount /dev/mapper/encrypted_linux_space /run/media/khunbai/Linux_space &&
chmod +x /run/media/khunbai

echo "  Mounting done!"
