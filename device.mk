#
# Copyright (C) 2025 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Configure base.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Configure core_64_bit_only.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

# Configure virtual_ab compression.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression_with_xor.mk)

# Configure emulated_storage.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Configure twrp common.mk
$(call inherit-product, vendor/twrp/config/common.mk)

# Shipping API level
BOARD_SHIPPING_API_LEVEL    := 35
PRODUCT_SHIPPING_API_LEVEL  := 35
PRODUCT_TARGET_VNDK_VERSION := 35

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Kernel
PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS   := false
PRODUCT_ENABLE_UFFD_GC                          := true

# OTA certs
PRODUCT_EXTRA_RECOVERY_KEYS += \
	$(DEVICE_PATH)/security/local_OTA \
	$(DEVICE_PATH)/security/special_OTA

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

# =========================
# KeyMint 依赖库（从 prebuilts/lib64 复制）
# =========================
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/lib64/libqtikeymint.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libqtikeymint.so \
    $(LOCAL_PATH)/prebuilts/lib64/android.hardware.keymaster@4.0.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.keymaster@4.0.so \
    $(LOCAL_PATH)/prebuilts/lib64/android.hardware.security.keymint-V3-ndk.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.security.keymint-V3-ndk.so \
    $(LOCAL_PATH)/prebuilts/lib64/android.hardware.security.rkp-V3-ndk.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.security.rkp-V3-ndk.so \
    $(LOCAL_PATH)/prebuilts/lib64/android.hardware.security.secureclock-V1-ndk.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.security.secureclock-V1-ndk.so \
    $(LOCAL_PATH)/prebuilts/lib64/android.hardware.security.sharedsecret-V1-ndk.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.security.sharedsecret-V1-ndk.so

# =========================
# TA files for KeyMint (从 prebuilts/firmware 复制)
# =========================
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/firmware/FD719D50-FFFB-11EB-9A03-0242AC130003.b00:$(TARGET_COPY_OUT_VENDOR)/firmware_mnt/image/FD719D50-FFFB-11EB-9A03-0242AC130003.b00 \
    $(LOCAL_PATH)/prebuilts/firmware/FD719D50-FFFB-11EB-9A03-0242AC130003.b01:$(TARGET_COPY_OUT_VENDOR)/firmware_mnt/image/FD719D50-FFFB-11EB-9A03-0242AC130003.b01 \
    $(LOCAL_PATH)/prebuilts/firmware/FD719D50-FFFB-11EB-9A03-0242AC130003.b02:$(TARGET_COPY_OUT_VENDOR)/firmware_mnt/image/FD719D50-FFFB-11EB-9A03-0242AC130003.b02 \
    $(LOCAL_PATH)/prebuilts/firmware/FD719D50-FFFB-11EB-9A03-0242AC130003.b03:$(TARGET_COPY_OUT_VENDOR)/firmware_mnt/image/FD719D50-FFFB-11EB-9A03-0242AC130003.b03 \
    $(LOCAL_PATH)/prebuilts/firmware/FD719D50-FFFB-11EB-9A03-0242AC130003.b04:$(TARGET_COPY_OUT_VENDOR)/firmware_mnt/image/FD719D50-FFFB-11EB-9A03-0242AC130003.b04 \
    $(LOCAL_PATH)/prebuilts/firmware/FD719D50-FFFB-11EB-9A03-0242AC130003.b05:$(TARGET_COPY_OUT_VENDOR)/firmware_mnt/image/FD719D50-FFFB-11EB-9A03-0242AC130003.b05 \
    $(LOCAL_PATH)/prebuilts/firmware/FD719D50-FFFB-11EB-9A03-0242AC130003.b06:$(TARGET_COPY_OUT_VENDOR)/firmware_mnt/image/FD719D50-FFFB-11EB-9A03-0242AC130003.b06 \
    $(LOCAL_PATH)/prebuilts/firmware/FD719D50-FFFB-11EB-9A03-0242AC130003.b07:$(TARGET_COPY_OUT_VENDOR)/firmware_mnt/image/FD719D50-FFFB-11EB-9A03-0242AC130003.b07 \
    $(LOCAL_PATH)/prebuilts/firmware/FD719D50-FFFB-11EB-9A03-0242AC130003.b08:$(TARGET_COPY_OUT_VENDOR)/firmware_mnt/image/FD719D50-FFFB-11EB-9A03-0242AC130003.b08

# TA for Secure Element / StrongBox (st_eseservice)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/firmware/st_eseservice.b00:$(TARGET_COPY_OUT_VENDOR)/firmware_mnt/image/st_eseservice.b00