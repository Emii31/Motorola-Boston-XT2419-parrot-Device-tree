#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from boston device
$(call inherit-product, device/motorola/boston/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_DEVICE := boston
PRODUCT_NAME := lineage_boston
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto g stylus 5G - 2024
PRODUCT_MANUFACTURER := motorola

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="boston_g-user 15 V1UBS35M-V1-ST24 e972af release-keys" \
    BuildFingerprint=motorola/boston_g/boston:15/V1UBS35M-V1-ST24/e972af:user/release-keys
