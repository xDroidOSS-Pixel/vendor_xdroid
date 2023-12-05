# Inherit common stuff
$(call inherit-product, vendor/xdroid/config/common_mobile.mk)

PRODUCT_SIZE := full

ifneq ($(TARGET_EXCLUDES_AUDIOFX),true)
PRODUCT_PACKAGES += \
    AudioFX
endif

# Extra cmdline tools
PRODUCT_PACKAGES += \
    unrar \
    zstd