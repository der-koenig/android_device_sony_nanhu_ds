#!/sbin/busybox sh
set +x
_PATH="$PATH"
export PATH=/sbin

busybox cd /
busybox date >>boot.txt
exec >>boot.txt 2>&1
busybox rm /init

# include device specific vars
source /sbin/bootrec-device

# create directories
busybox mkdir -m 755 -p /cache
busybox mkdir -m 755 -p /dev/block
busybox mkdir -m 755 -p /dev/input
busybox mkdir -m 555 -p /proc
busybox mkdir -m 755 -p /sys

# create device nodes
busybox mknod -m 600 /dev/block/mmcblk0 b 179 0
busybox mknod -m 600 ${BOOTREC_CACHE_NODE}
busybox mknod -m 600 ${BOOTREC_EVENT_NODE}
busybox mknod -m 666 /dev/null c 1 3

# mount filesystems
busybox mount -t proc proc /proc
busybox mount -t sysfs sysfs /sys
busybox mount -t ext4 ${BOOTREC_CACHE} /cache

# android ramdisk
load_image=/sbin/ramdisk.cpio

busybox grep -Eq "^64|128$" /proc/sys/kernel/boot_reason

if [[ $? != 0 ]]
then
	if [ ! -e /cache/recovery/boot ]
	then
	        # trigger ON GREEN NOTIFICATION BAR
	        busybox echo ${BOOTREC_LED_GREEN} > ${BOOTREC_CONTROL_LED}

	        # keycheck
	        busybox cat ${BOOTREC_EVENT} > /dev/keycheck&
	        busybox sleep 3

	        # trigger OFF NOTIFICATION BAR
	        busybox echo ${BOOTREC_LED_OFF} > ${BOOTREC_CONTROL_LED}
	fi

	# boot decision
	if [ -s /dev/keycheck -o -e /cache/recovery/boot ]
	then
		busybox echo 'RECOVERY BOOT' >>boot.txt
		busybox rm -fr /cache/recovery/boot
		# trigger orange notification bar
		busybox echo ${BOOTREC_LED_ORANGE} > ${BOOTREC_CONTROL_LED}
		# recovery ramdisk
		load_image=/sbin/ramdisk-recovery.cpio
	else
		busybox echo 'ANDROID BOOT' >>boot.txt
		# poweroff notification
		busybox echo ${BOOTREC_LED_OFF} > ${BOOTREC_CONTROL_LED}
	fi

	# kill the keycheck process
	busybox pkill -f "busybox cat ${BOOTREC_EVENT}"
fi

# unpack the ramdisk image
busybox cpio -i < ${load_image}

busybox umount /cache
busybox umount /proc
busybox umount /sys

busybox rm -fr /dev/*
busybox date >>boot.txt
export PATH="${_PATH}"
exec /init
