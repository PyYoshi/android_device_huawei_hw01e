$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/huawei/hw01e/hw01e-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/huawei/hw01e/overlay

$(call inherit-product, build/target/product/full.mk)

# Configs - ramdisk
PRODUCT_COPY_FILES += \
    device/huawei/hw01e/configs/init.bt.rc:root/init.bt.rc \
    device/huawei/hw01e/configs/init.huawei.rc:root/init.huawei.rc \
    device/huawei/hw01e/configs/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
    device/huawei/hw01e/configs/init.qcom.class_main.sh:root/init.qcom.class_main.sh \
    device/huawei/hw01e/configs/init.qcom.sh:root/init.qcom.sh \
    device/huawei/hw01e/configs/init.qcom.usb.rc:root/init.qcom.usb.rc \
    device/huawei/hw01e/configs/init.qcom.usb.sh:root/init.qcom.usb.sh \
    device/huawei/hw01e/configs/init.wifi.rc:root/init.wifi.rc \
    device/huawei/hw01e/configs/ueventd.huawei.rc:root/ueventd.huawei.rc

# fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=HW-01E BUILD_FINGERPRINT=Huawei/HW-01E/hwu9501L:4.0.4/HuaweiU9501L/C341B148:user/ota-rel-keys,release-keys PRIVATE_BUILD_DESC="U9501L-user"

# i18n and Timezone
PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_UTC_DATE=0 \
    ro.product.locale.language=ja \
    ro.product.locale.region=JP \
    persist.sys.timezone=Asia/Tokyo

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libril-qc-qmi-1.so \
    rild.libargs=-d/dev/smd0 \
    ril.subscription.types=NV,RUIM \
    ro.use_data_netmgrd=true

# system props for the cne module
PRODUCT_PROPERTY_OVERRIDES += \
    persist.cne.UseCne=vendor \
    persist.cne.UseSwim=false \
    persist.cne.bat.range.low.med=30 \
    persist.cne.bat.range.med.high=60 \
    persist.cne.loc.policy.op=/system/etc/OperatorPolicy.xml \
    persist.cne.loc.policy.user=/system/etc/UserPolicy.xml \
    persist.cne.bwbased.rat.sel=false \
    persist.cne.snsr.based.rat.mgt=false \
    persist.cne.bat.based.rat.mgt=false \
    persist.cne.rat.acq.time.out=30000 \
    persist.cne.rat.acq.retry.tout=0 \
    persist.cne.nsrm.mode=false

# Simulate sdcard on /data/media
PRODUCT_PROPERTY_OVERRIDES += \
    persist.fuse_sdcard=false

# Other
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072

PRODUCT_NAME := full_hw01e
PRODUCT_DEVICE := hw01e
PRODUCT_MODEL := HW-01E
PRODUCT_BRAND := Huawei
PRODUCT_MANUFACTURER := HUAWEI
