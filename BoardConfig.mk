#
# Android 4.0 / LineageOS ICS BoardConfig.mk
#

USES_DEVICE_VIRT_VBOXWARE := true

# Boot manager
TARGET_BOOT_MANAGER := grub

# GRUB architecture
TARGET_GRUB_ARCH := x86_64-efi
TARGET_GRUB_2ND_ARCH := i386-pc

# Include common definitions
include $(LOCAL_DIR)/device/virt/virt-common/BoardConfigVirtCommon.mk

# CPU / Architecture
TARGET_CPU_ABI := x86_64
TARGET_ARCH := x86_64
TARGET_ARCH_VARIANT := sandybridge

# GRUB boot configs
TARGET_GRUB_BOOT_CONFIGS := $(DEVICE_PATH)/bootmgr/grub/grub-boot.cfg
TARGET_GRUB_INSTALL_CONFIGS := $(DEVICE_PATH)/bootmgr/grub/grub-install.cfg

# Kernel command line
BOARD_KERNEL_CMDLINE := 8250.nr_uarts=1 androidboot.console=ttyS0 androidboot.hardware=vboxware androidboot.partition_map="sdb,userdata"

BOARD_KERNEL_CMDLINE_RECOVERY := console=tty0

BOARD_KERNEL_IMAGE_NAME := bzImage

# Kernel source / prebuilt
ifeq ($(wildcard $(TARGET_KERNEL_SOURCE)/Makefile),)
    ifneq ($(wildcard $(TARGET_PREBUILT_KERNEL_DIR)/kernel),)
        BOARD_VENDOR_KERNEL_MODULES := $(wildcard $(TARGET_PREBUILT_KERNEL_DIR)/*.ko)
    endif
else
    TARGET_KERNEL_ARCH := x86
    TARGET_KERNEL_CONFIG := lineageos/vboxware.config
endif

# Graphics (Mesa)
BOARD_MESA3D_USES_MESON_BUILD := true
BOARD_MESA3D_GALLIUM_DRIVERS := svga

# Pre-install checks (replace soong_config_set with simple variables)
VIRT_PREINSTALL_CHECK_BOOT_DISK_NAME := sda
VIRT_PREINSTALL_CHECK_USERDATA_DISK_NAME := sdb
VIRT_PREINSTALL_CHECK_DRM_CARD_NAME := vmwgfx

# Properties
TARGET_VENDOR_PROP := $(DEVICE_PATH)/configs/properties/vendor.prop

# Recovery
TARGET_RECOVERY_FSTAB_GENRULE := gen_fstab_vboxware
TARGET_RECOVERY_PIXEL_FORMAT := BGRX_8888

# SELinux
BOARD_VENDOR_SEPOLICY_DIRS := $(DEVICE_PATH)/sepolicy/vendor
ifeq ($(AB_OTA_UPDATER),true)
    BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor/ab
else
    BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor/a
endif

# VINTF (ICS does not support VINTF, keep as comments for reference)
#ODM_MANIFEST_SKUS := display_drm display_fb
#ODM_MANIFEST_DISPLAY_DRM_FILES := $(DEVICE_PATH)/configs/vintf/manifest_sku_display_drm.xml
#ODM_MANIFEST_DISPLAY_FB_FILES := $(DEVICE_PATH)/configs/vintf/manifest_sku_display_fb.xml
