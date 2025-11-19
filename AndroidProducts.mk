#
# Android 4.0 / LineageOS ICS Product Definitions
#

# Include the product makefiles
PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/aosp_vboxware.mk \
    $(LOCAL_DIR)/lineage_vboxware.mk

# Lunch menu definitions
# ICS uses the LUNCH_MENU_CHOICES variable
LUNCH_MENU_CHOICES := \
    aosp_vboxware-eng \
    aosp_vboxware-userdebug \
    aosp_vboxware-user \
    lineage_vboxware-eng \
    lineage_vboxware-userdebug \
    lineage_vboxware-user
