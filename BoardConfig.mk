# inherit from the proprietary version
-include vendor/sony/nanhu/BoardConfigVendor.mk

#inherit from the common tamsui definitions
-include device/sony/tamsui-common/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH += device/sony/nanhu/include

TARGET_KERNEL_SOURCE := kernel/sony/nanhu
TARGET_KERNEL_CONFIG := cm_nanhu_defconfig
BOARD_KERNEL_CMDLINE := device/sony/nanhu/config/cmdline.txt

# Partition information
BOARD_VOLD_MAX_PARTITIONS := 17

# Recovery
TARGET_RECOVERY_FSTAB := device/sony/nanhu/config/fstab.sony
RECOVERY_FSTAB_VERSION := 2
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x01400000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 681574400
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2147483648
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/msm_hsusb/gadget/lun%d/file"
BOARD_UMS_LUNFILE := "/sys/devices/platform/msm_hsusb/gadget/lun%d/file"
BOARD_USE_CUSTOM_RECOVERY_FONT := \"font_7x16.h\"

BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_USERIMAGES_USE_EXT4 := true

BOARD_CUSTOM_BOOTIMG_MK := device/sony/nanhu/custombootimg.mk

BOARD_HAVE_QCOM_FM := true
COMMON_GLOBAL_CFLAGS += -DQCOM_FM_ENABLED -DWITH_QCOM_FM

# Wifi
BOARD_HAS_ATH_WLAN := true
BOARD_WLAN_DEVICE := ath6kl
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_ath6kl
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_ath6kl
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/ath6kl_sdio.ko"
WIFI_DRIVER_MODULE_NAME := wlan
WIFI_DRIVER_LOADER_DELAY := 1000000

BOARD_SDCARD_INTERNAL_DEVICE := /dev/block/mmcblk0p17

# Custom vibrator
BOARD_HAS_VIBRATOR_IMPLEMENTATION := ../../device/sony/nanhu/vibrator/vibrator.c

# RIL
BOARD_USES_LEGACY_RIL := true
BOARD_RIL_CLASS := ../../../device/sony/nanhu/ril/

TARGET_OTA_ASSERT_DEVICE := C1504,C1505,C1604,C1605,nanhu,nanhu_ds

#Low Ram Device
-PRODUCT_PROPERTY_OVERRIDES += ro.config.low_ram=true

KERNEL_BT_MODULES:
	make -C kernel/backports ARCH=arm CROSS_COMPILE="arm-eabi-" KLIB=../../$(KERNEL_OUT) KLIB_BUILD=../../$(KERNEL_OUT) defconfig-nanhu-bt
	make -C kernel/backports ARCH=arm CROSS_COMPILE="arm-eabi-" KLIB=../../$(KERNEL_OUT) KLIB_BUILD=../../$(KERNEL_OUT)
	mv kernel/backports/compat/compat.ko $(KERNEL_MODULES_OUT)
	mv kernel/backports/net/bluetooth/bluetooth.ko $(KERNEL_MODULES_OUT)
	mv kernel/backports/net/bluetooth/rfcomm/rfcomm.ko $(KERNEL_MODULES_OUT)
	mv kernel/backports/net/bluetooth/bnep/bnep.ko $(KERNEL_MODULES_OUT)
	mv kernel/backports/net/bluetooth/hidp/hidp.ko $(KERNEL_MODULES_OUT)
	mv kernel/backports/drivers/bluetooth/bluetooth-power.ko $(KERNEL_MODULES_OUT)
	mv kernel/backports/drivers/bluetooth/hci_uart.ko $(KERNEL_MODULES_OUT)

TARGET_KERNEL_MODULES := KERNEL_BT_MODULES
BOARD_HAVE_BLUETOOTH_BCM := 
#BOARD_HAVE_BLUETOOTH_QCOM := true
TARGET_NO_HW_VSYNC := 

DEVICE_RESOLUTION := 320x480
TW_INTERNAL_STORAGE_PATH := "/sdcard"
TW_INTERNAL_STORAGE_MOUNT_POINT := "sdcard"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_NO_REBOOT_BOOTLOADER := true
TW_DEFAULT_EXTERNAL_STORAGE := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TW_HAS_NO_RECOVERY_PARTITION := true
TW_INCLUDE_JB_CRYPTO := true
TW_CRYPTO_FS_TYPE := "ext4"
TW_CRYPTO_REAL_BLKDEV := "/dev/block/mmcblk0p16"
TW_CRYPTO_MNT_POINT := "/data"
TW_CRYPTO_FS_OPTIONS := "noatime,nosuid,nodev,noauto_da_alloc,errors=panic"
TW_CRYPTO_FS_FLAGS := "0x00000406"
TW_CRYPTO_KEY_LOC := "footer"
TW_EXCLUDE_SUPERSU := true
TW_NO_SCREEN_TIMEOUT := true
TW_NO_SCREEN_BLANK := true
TW_NO_EXFAT := true
TW_NO_EXFAT_FUSE := true
TW_BRIGHTNESS_PATH := /sys/class/leds/lm3533-light-backlight/brightness
