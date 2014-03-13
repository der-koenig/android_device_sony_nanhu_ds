$(call inherit-product, device/sony/nanhu_ds/full_nanhu_ds.mk)

# Inherit CM common GSM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit CM common Phone stuff.
$(call inherit-product, vendor/cm/config/common_mini_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=C1604_1270-7235 BUILD_FINGERPRINT=Sony/C1604_1270-7235/C1604:4.1.1/11.3.A.2.1/20130409.185106:user/release-keys PRIVATE_BUILD_DESC="C1604-user 4.1.1 JRO03L 20130409.185106 test-keys"

TARGET_SCREEN_HEIGHT := 480
TARGET_SCREEN_WIDTH := 320

PRODUCT_NAME := cm_nanhu_ds
PRODUCT_DEVICE := nanhu_ds
