## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := hw01e

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/huawei/hw01e/device_hw01e.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := hw01e
PRODUCT_NAME := cm_hw01e
PRODUCT_BRAND := huawei
PRODUCT_MODEL := hw01e
PRODUCT_MANUFACTURER := huawei
