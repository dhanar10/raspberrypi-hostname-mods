#!/raspberrypi-hostname-mods/busybox sh

base="/raspberrypi-hostname-mods"

busybox="$base/busybox"

cp="$busybox cp"
ln="$busybox ln"
mount="$busybox mount"
mkdir="$busybox mkdir"
mknod="$busybox mknod"
mv="$busybox mv"
reboot="$busybox reboot"
rm="$busybox rm"
rmdir="$busybox rmdir"
sleep="$busybox sleep"
umount="$busybox umount"

echo "Mounting ..."

$mount -o remount,rw / /
$mkdir -p $base/dev 
$mkdir -p $base/root
$mount -t tmpfs tmpfs $base/dev
$mknod $base/dev/mmcblk0p2 b 179 2
$mount -o rw -t ext4 $base/dev/mmcblk0p2 $base/root

echo "Installing raspberrypi-hostname-mods.service ..."

$cp $base/raspberrypi-hostname-mods.service $base/root/etc/systemd/system
$ln -sf /etc/systemd/system/raspberrypi-hostname-mods.service $base/root/etc/systemd/system/multi-user.target.wants/raspberrypi-hostname-mods.service

echo "Replacing cmdline.txt ..."

$mv /cmdline.txt.resize /cmdline.txt

echo "Unmounting ..."

$umount $base/root 
$rm $base/dev/mmcblk0p2
$umount $base/dev
$rmdir $base/root
$rmdir $base/dev 
$mount -o remount,ro / /

echo "Rebooting in 5 seconds ..."

$sleep 5

$reboot -f
