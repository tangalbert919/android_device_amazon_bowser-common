# Copyright (C) 2013 The CyanogenMod Project
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file includes all definitions that apply to ALL Amazon Kindle Fire devices, and
# are also specific to otter devices
#
# Everything in this directory will become public

COMMON_FOLDER := device/amazon/bowser-common

$(call inherit-product, $(COMMON_FOLDER)/common.mk)
$(call inherit-product-if-exists, hardware/ti/omap4/omap4.mk)

DEVICE_PACKAGE_OVERLAYS += $(COMMON_FOLDER)/overlay/aosp

PRODUCT_CHARACTERISTICS := tablet,nosdcard

PRODUCT_TAGS += dalvik.gc.type-precise

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := $(DEVICE_FOLDER)/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

# Hardware HALs
PRODUCT_PACKAGES += \
    lights.bowser \
    power.bowser \
    camera.omap4 \
    audio.primary.bowser \
    audio.hdmi.bowser \
    audio.a2dp.default

# Device settings
PRODUCT_PROPERTY_OVERRIDES += \
    persist.demo.hdmirotationlock=true \
    persist.lab126.touchnoisereject=1 \
    ro.nf.profile=2 \
    ro.nf.level=512 \
    omap.audio.power=PingPong \
    dolby.audio.sink.info=speaker \
    ro.camera.sound.forced=0 \
    ro.camera.video_size=1280x720

# BT
PRODUCT_PACKAGES += \
    uim-sysfs \
    libbt-vendor

# Sensors
PRODUCT_PACKAGES += \
    sensors.omap4 \
    libinvensense_hal \
    libmllite \
    libmplmpu

# Wifi
PRODUCT_PACKAGES += \
    dhcpcd.conf \
    libwpa_client \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    sdcard \
    e2fsck \
    mkfs.f2fs \
    fsck.f2fs \
    fibmap.f2fs

# Audio Support
PRODUCT_PACKAGES += \
    libaudioutils \
    Music \
    tinyplay \
    tinymix \
    tinycap \
    audio_policy.default \
    audio.usb.default \
    audio.r_submix.default

# DRM
PRODUCT_PACKAGES += \
    libwvm \

# Misc / Testing
PRODUCT_PACKAGES += \
    evtest \
    strace \
    libjni_pinyinime \
    sh

# Rootfs
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    $(COMMON_FOLDER)/default.prop:/root/default.prop \
    $(COMMON_FOLDER)/init.bowser-common.rc:/root/init.bowser-common.rc

# Codecs
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/prebuilt/etc/media_codecs.xml:/system/etc/media_codecs.xml \
    $(COMMON_FOLDER)/prebuilt/etc/media_profiles.xml:/system/etc/media_profiles.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    $(call add-to-product-copy-files-if-exists,packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml)

# Prebuilts
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/prebuilt/etc/audio_policy.conf:/system/vendor/etc/audio_policy.conf \
    $(COMMON_FOLDER)/prebuilt/etc/mixer_paths.xml:/system/vendor/etc/mixer_paths.xml \
    $(COMMON_FOLDER)/prebuilt/etc/smc_normal_world_android_cfg.ini:/system/vendor/etc/smc_normal_world_android_cfg.ini \
    $(COMMON_FOLDER)/prebuilt/etc/wifi/wpa_supplicant.conf:system/vendor/etc/wifi/wpa_supplicant.conf \
    $(COMMON_FOLDER)/prebuilt/usr/idc/AtmelTouch.idc:system/usr/idc/AtmelTouch.idc \
    $(COMMON_FOLDER)/prebuilt/usr/idc/cyttsp4-i2c.idc:system/usr/idc/cyttsp4-i2c.idc \
    $(COMMON_FOLDER)/prebuilt/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl\
    $(COMMON_FOLDER)/prebuilt/vendor/etc/audio_effects.conf:/system/vendor/etc/audio_effects.conf \
    $(COMMON_FOLDER)/prebuilt/etc/gps.conf:/system/etc/gps.conf

# Prebuilts /system/etc/bluetooth
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)
$(call inherit-product-if-exists, vendor/amazon/bowser-common/bowser-common-vendor.mk)
