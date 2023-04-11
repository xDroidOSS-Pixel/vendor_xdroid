# xd. Bootanimation
ifeq ($(XDROID_BOOT),)
$(warning "xdroidUI: Using xd. Dark Bootanimation legacy")
    PRODUCT_COPY_FILES += vendor/xdroid/bootanimation/xd_boot_legacy.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
else
ifeq ($(XDROID_BOOT),480)
$(warning "xdroidUI: Using xd. Dark Bootanimation 480p")
    PRODUCT_COPY_FILES += vendor/xdroid/bootanimation/xd_boot_480.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
endif
ifeq ($(XDROID_BOOT),720)
$(warning "xdroidUI: Using xd. Dark Bootanimation 720p")
    PRODUCT_COPY_FILES += vendor/xdroid/bootanimation/xd_boot_720.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
endif
ifeq ($(XDROID_BOOT),1080)
$(warning "xdroidUI: Using xd. Dark Bootanimation 1080p")
    PRODUCT_COPY_FILES += vendor/xdroid/bootanimation/xd_boot_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
endif
ifeq ($(XDROID_BOOT),1440)
$(warning "xdroidUI: Using xd. Dark Bootanimation 1440p")
    PRODUCT_COPY_FILES += vendor/xdroid/bootanimation/xd_boot_1440.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
endif
endif