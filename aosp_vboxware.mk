#
# Android 4.0 / LineageOS ICS Product Definition
#

# Inherit from core/base products (most specific first)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit from device
$(call inherit-product, device/virt/vboxware/device.mk)

# PRODUCT_NAME and device info
PRODUCT_NAME := aosp_vboxware
PRODUCT_DEVICE := vboxware
PRODUCT_BRAND := vboxware
PRODUCT_MANUFACTURER := vboxware
PRODUCT_MODEL := vboxware

# Vendor properties
PRODUCT_VENDOR_PROPERTIES := \
    ro.soc.manufacturer=$(PRODUCT_MANUFACTURER) \
    ro.soc.model=$(PRODUCT_DEVICE)

# Build fingerprint workaround
# ICS does not have PRODUCT_BUILD_PROP_OVERRIDES, so set BUILD_FINGERPRINT directly
BUILD_FINGERPRINT := vboxware/vboxware/vboxware:4.0.4/ICS-eng/test-keys

# Optional: packages to include (replace enforce-product-packages-exist)
PRODUCT_PACKAGES := \
    android.hardware.health@2.0-impl-default.recovery \
    DeviceDiagnostics \
    product_manifest.xml
