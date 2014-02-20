# inherit from the proprietary version
-include vendor/huawei/hw01e/BoardConfigVendor.mk

# Build Env
#TARGET_TOOLS_PREFIX := prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.7/bin/arm-linux-androideabi-
TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-4.4.3
TARGET_KERNEL_CUSTOM_TOOLCHAIN_SUFFIX := arm-eabi-

# Include Path
TARGET_SPECIFIC_HEADER_PATH := device/huawei/hw01e/include

# allow device
TARGET_OTA_ASSERT_DEVICE := hw01e,U9501L,hwu9501L

# Vendor
BOARD_VENDOR := huawei

# SoC
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_CPU_VARIANT := krait
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := msm8960
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOOTLOADER_BOARD_NAME := hw01e

# Flags
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true
TARGET_QCOM_DISPLAY_VARIANT := legacy
TARGET_QCOM_MEDIA_VARIANT := legacy
#TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
#TARGET_QCOM_AUDIO_VARIANT := caf
#TARGET_QCOM_DISPLAY_VARIANT := caf
#TARGET_QCOM_MEDIA_VARIANT := caf

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=huawei user_debug=31 kgsl.mmutype=gpummu
BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_PAGESIZE := 2048
# ramdiskaddr = base + ramdisk_offset
# 0x81600000 = 0x80200000 + x
# x = 0x1400000
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x1400000
TARGET_KERNEL_SOURCE := kernel/huawei/hw01e
TARGET_KERNEL_CONFIG := hw01e_defconfig

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_RECOVERY_FSTAB := device/huawei/hw01e/ramdisk/fstab.huawei
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# TWRP
#DEVICE_RESOLUTION := 720x1280
#RECOVERY_SDCARD_ON_DATA := true
#BOARD_HAS_NO_REAL_SDCARD := true
#TW_INTERNAL_STORAGE_PATH := "/data/media"
#TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
#TW_EXTERNAL_STORAGE_PATH := "/external_sd"
#TW_EXTERNAL_STORAGE_MOUNT_POINT := "usb-otg"
#TW_NO_USB_STORAGE := true

# RC
#TARGET_PROVIDES_INIT_RC := true
#TARGET_PROVIDES_RECOVERY_INIT_RC := true
#TARGET_RECOVERY_INITRC := device/huawei/hw01e/configs/init.rc

# Audio
#BOARD_USES_ALSA_AUDIO := true
#TARGET_USES_QCOM_COMPRESSED_AUDIO := true

# Bluetooth
#BOARD_HAVE_BLUETOOTH := true

# Camera
#USE_CAMERA_STUB := true
#TARGET_PROVIDES_CAMERA_HAL := false

# Graphics
USE_OPENGL_RENDERER := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
BOARD_EGL_CFG := device/huawei/hw01e/configs/egl.cfg

# Lights
#TARGET_PROVIDES_LIBLIGHT := true

# Power
#TARGET_PROVIDES_POWERHAL := true

# GPS
#BOARD_HAVE_NEW_QC_GPS := true

# RIL
#BOARD_PROVIDES_LIBRIL := true

# USB
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# fix this up by examining /proc/mtd on a running device
# boot: /dev/block/platform/msm_sdcc.1/by-name/boot -> /dev/block/mmcblk0p11
# recovery: /dev/block/platform/msm_sdcc.1/by-name/recovery -> /dev/block/mmcblk0p19
# system: /dev/block/platform/msm_sdcc.1/by-name/system -> /dev/block/mmcblk0p14
# userdata: /dev/block/platform/msm_sdcc.1/by-name/userdata -> /dev/block/mmcblk0p26
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 805306368
BOARD_USERDATAIMAGE_PARTITION_SIZE := 6236912640
BOARD_FLASH_BLOCK_SIZE := 131072

# Webkit
#ENABLE_WEBGL := true
#TARGET_FORCE_CPU_UPLOAD := true
