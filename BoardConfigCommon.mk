#
# Copyright (C) 2013 The CyanogenMod Project
# Copyright (C) 2017-2018 The LineageOS Project
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

COMMON_FOLDER := device/amazon/bowser-common

# inherit from omap4
include hardware/ti/omap4/BoardConfigCommon.mk

# Sensors
BOARD_USES_GENERIC_INVENSENSE := false

# Audio
BOARD_USES_GENERIC_AUDIO := false

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(COMMON_FOLDER)/bluetooth

# Camera
TI_OMAP4_CAMERAHAL_VARIANT := true
TI_CAMERAHAL_USES_LEGACY_DOMX_DCC := true
TI_CAMERAHAL_MAX_CAMERAS_SUPPORTED := 1
#TI_CAMERAHAL_DEBUG_ENABLED := true
#TI_CAMERAHAL_VERBOSE_DEBUG_ENABLED := true
#TI_CAMERAHAL_DEBUG_FUNCTION_NAMES := true
USE_CAMERA_STUB := false

# inherit from the proprietary version
-include vendor/amazon/bowser-common/BoardConfigVendor.mk

# Kernel
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_IMAGE_NAME := zImage
BOARD_CANT_BUILD_RECOVERY_FROM_BOOT_PATCH := true
TARGET_KERNEL_CONFIG := android_omap4_defconfig
TARGET_KERNEL_SELINUX_CONFIG := selinux_defconfig
TARGET_BOOTLOADER_BOARD_NAME := bowser
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Connectivity - Wi-Fi
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE                := bcmdhd
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/vendor/firmware/fw_bcmdhd.bin"
PRODUCT_WIRELESS_TOOLS           := true

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_CACHEIMAGE_PARTITION_SIZE := 681574400
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 929038336
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13777223680
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := f2fs
TARGET_USERIMAGES_USE_EXT4 := true
ifeq ($(HOST_OS),linux)
TARGET_USERIMAGES_USE_F2FS := true
endif

# vold
BOARD_VOLD_MAX_PARTITIONS := 32
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

# Dolby enhancements
OMAP_ENHANCEMENT_DOLBY_DDPDEC51_MULTICHANNEL := true
ifdef OMAP_ENHANCEMENT_DOLBY_DDPDEC51_MULTICHANNEL
    BOARD_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT_DOLBY_DDPDEC51_MULTICHANNEL
endif

# Graphics
BOARD_CREATE_AMAZON_HDCP_KEYS_SYMLINK := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true

# Misc.
BOARD_NEEDS_CUTILS_LOGS := true
BOARD_HARDWARE_CLASS += $(OMAP4_NEXT_FOLDER)/cmhw
BOARD_SEPOLICY_DIRS += \
    $(OMAP4_NEXT_FOLDER)/sepolicy

# Recovery
TARGET_RECOVERY_PRE_COMMAND := "echo 0 > /sys/block/mmcblk0boot0/force_ro; echo -n 7 | dd of=/dev/block/mmcblk0boot0 bs=1 count=1 seek=4104 ; sync; \#"
TARGET_RECOVERY_PIXEL_FORMAT := "BRGA_8888"
BOARD_CANT_BUILD_RECOVERY_FROM_BOOT_PATCH := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_UMS_LUNFILE := "/sys/devices/virtual/android_usb?android0/f_mass_storage/lun/file"

# TWRP Config
TW_INTERNAL_STORAGE_PATH := "/data/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_INCLUDE_FB2PNG := true
BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_SDCARD_ON_DATA := true
TW_MAX_BRIGHTNESS := 254
TW_CUSTOM_BATTERY_PATH := /sys/class/power_supply/bq27541

# ICS ril version
LEGACY_RIL := true

# hack the ota
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := $(COMMON_FOLDER)/releasetools/bowser_ota_from_target_files.py
TARGET_RELEASETOOL_MAKE_RECOVERY_PATCH_SCRIPT := $(COMMON_FOLDER)/releasetools/bowser_make_recovery_patch

TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
