#
# Copyright (C) 2011 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit the proprietary counterpart
$(call inherit-product-if-exists, vendor/sony/nanhu/nanhu-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/sony/nanhu/overlay

# Inherit the tamsui-common definitions
$(call inherit-product, device/sony/tamsui-common/tamsui.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

PRODUCT_PACKAGES += \
    FM \
    init.qcom.fm.sh

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    device/sony/nanhu/config/plmn-conf.xml:system/etc/plmn-conf.xml

PRODUCT_AAPT_CONFIG := normal mdpi mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

# Configuration scripts
PRODUCT_COPY_FILES += \
    device/sony/nanhu/config/audio_policy.conf:system/etc/audio_policy.conf \
    device/sony/nanhu/config/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/sony/nanhu/config/init.device.rc:root/init.device.rc \
    device/sony/nanhu/config/init.recovery.device.rc:root/init.recovery.device.rc \
    device/sony/nanhu/../tamsui-common/prebuilt/logo_M.rle:root/logo.rle

# USB function switching
PRODUCT_COPY_FILES += \
    device/sony/nanhu/config/init.sony.usb.rc:root/init.sony.usb.rc

PRODUCT_COPY_FILES += \
    device/sony/nanhu/config/fstab.sony:root/fstab.sony

PRODUCT_COPY_FILES += \
    device/sony/nanhu/config/vold.fstab:system/etc/vold.fstab

PRODUCT_COPY_FILES += \
    device/sony/nanhu/config/init.bluetooth.sh:system/etc/init.bluetooth.sh

PRODUCT_PACKAGES += \
    hciattach

# Device specific part for two-stage boot
PRODUCT_COPY_FILES += \
    device/sony/nanhu/recovery/bootrec-device:recovery/bootrec-device \
    device/sony/nanhu/recovery/twrp.fstab:recovery/root/etc/twrp.fstab \
    device/sony/nanhu/recovery/rebootrecovery.sh:recovery/root/sbin/rebootrecovery.sh

PRODUCT_COPY_FILES += \
    device/sony/nanhu/prebuilt/tad:root/sbin/tad

# Offline charging
PRODUCT_COPY_FILES += \
    device/sony/nanhu/prebuilt/charger:root/charger \
    device/sony/nanhu/prebuilt/battery_fail.png:root/res/images/charger/battery_fail.png \
    device/sony/nanhu/prebuilt/charging_animation_01.png:root/res/images/charger/charging_animation_01.png \
    device/sony/nanhu/prebuilt/charging_animation_02.png:root/res/images/charger/charging_animation_02.png \
    device/sony/nanhu/prebuilt/charging_animation_03.png:root/res/images/charger/charging_animation_03.png \
    device/sony/nanhu/prebuilt/charging_animation_04.png:root/res/images/charger/charging_animation_04.png \
    device/sony/nanhu/prebuilt/charging_animation_05.png:root/res/images/charger/charging_animation_05.png \
    device/sony/nanhu/prebuilt/charging_animation_06.png:root/res/images/charger/charging_animation_06.png \
    device/sony/nanhu/prebuilt/charging_animation_07.png:root/res/images/charger/charging_animation_07.png

# Key layouts and touchscreen
PRODUCT_COPY_FILES += \
    device/sony/nanhu/config/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    device/sony/nanhu/config/7x27a_kp.kl:system/usr/keylayout/7x27a_kp.kl \
    device/sony/nanhu/config/7x27a_kp.kcm:system/usr/keychars/7x27a_kp.kcm \
    device/sony/nanhu/config/atmel_mxt_ts.kl:system/usr/keylayout/atmel_mxt_ts.kl \
    device/sony/nanhu/config/ft5x06_ts.kl:system/usr/keylayout/ft5x06_ts.kl \
    device/sony/nanhu/config/cy8ctma340_touch.kl:system/usr/keylayout/cy8ctma340_touch.kl

PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril.v3=skipnullaid,qcomdsds \
    ro.webview.gralloc_unbind=1 \
    ro.fm.analogpath.supported=true \
    ro.fm.mulinst.recording.support=false

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)
