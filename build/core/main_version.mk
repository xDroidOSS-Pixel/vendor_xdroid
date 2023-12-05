# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# xdroidOSS System Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.xdroid.build.date=$(BUILD_DATE) \
    ro.xdroid.fingerprint=$(ROM_FINGERPRINT) \
    ro.xdroid.version=$(XDROID_VERSION) \
    ro.xdroid.device=$(XDROID_BUILD) \
    ro.modversion=$(XDROID_VERSION)
