# inherit from the proprietary version
-include vendor/sony/nanhu_ds/BoardConfigVendor.mk

#inherit from the common tamsui definitions
-include device/sony/tamsui-common/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH += device/sony/nanhu_ds/include

TARGET_KERNEL_SOURCE := kernel/sony/nanhu_ds
TARGET_KERNEL_CONFIG := cm_nanhu_defconfig
BOARD_KERNEL_CMDLINE := device/sony/nanhu_ds/config/cmdline.txt

# Partition information
BOARD_VOLD_MAX_PARTITIONS := 17

# Recovery
TARGET_RECOVERY_FSTAB := device/sony/nanhu_ds/config/fstab.sony
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

BOARD_CUSTOM_BOOTIMG_MK := device/sony/nanhu_ds/custombootimg.mk

# Wifi
#BOARD_HAVE_QCOM_FM := true
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
BOARD_HAS_VIBRATOR_IMPLEMENTATION := ../../device/sony/nanhu_ds/vibrator/vibrator.c

TARGET_OTA_ASSERT_DEVICE := C1504,C1505,C1604,C1605,nanhu,nanhu_ds

#Low Ram Device
-PRODUCT_PROPERTY_OVERRIDES += ro.config.low_ram=true
