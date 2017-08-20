exit

# Just a template

lsblk
mkfs.btrfs -m single -L arch /dev/vda
mount -o compress=lzo /dev/vda /mnt


cd /mnt
btrfs su cr @
#btrfs su cr @boot
btrfs su cr @home
btrfs su cr @log
btrfs su cr @pkg
btrfs su cr @srv
btrfs su cr @tmp


cd /
umount /mnt
mount -o compress=lzo,subvol=@ /dev/vda /mnt
cd /mnt
mkdir -p {boot,home,srv,var/{log,cache/pacman/pkg,tmp}}
#mount -o compress=lzo,subvol=@boot /dev/vda boot
mount /dev/efi boot
mount -o compress=lzo,subvol=@home /dev/vda home
mount -o compress=lzo,subvol=@log /dev/vda var/log
mount -o compress=lzo,subvol=@pkg /dev/vda var/cache/pacman/pkg
mount -o compress=lzo,subvol=@srv /dev/vda srv
mount -o compress=lzo,subvol=@tmp /dev/vda var/tmp


pacstrap -i /mnt base ethtools openssh wifi-menu dialog iw


genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
ln -s /usr/share/zoneinfo/Asia/Hong_Kong /etc/localtime # Replace Region/City with your value
hwclock --systohc
vim /etc/locale.gen # Uncomment en_US.UTF-8 UTF-8 line
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "your-hostname" > /etc/hostname # Replace your-hostname with your value
vim /etc/hosts # Configure 127.0.0.1 and ::1 lines accordingly
# use latest killer driver
# ethtool -i interface_name
# cd /lib/firmware/ath10k/QCA6174/hw3.0
# cp 4.4.1/firmware-6.bin_WLAN.RM.4.4.1-00026-QCARMSWP-1 firmware-6.bin
sh install_arch.sh
