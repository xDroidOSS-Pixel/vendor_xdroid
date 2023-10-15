PATH_OVERRIDE_SOONG := $(shell echo $(TOOLS_PATH_OVERRIDE))

# Add variables that we wish to make available to soong here.
EXPORT_TO_SOONG := \
    KERNEL_ARCH \
    KERNEL_BUILD_OUT_PREFIX \
    KERNEL_CROSS_COMPILE \
    KERNEL_MAKE_CMD \
    KERNEL_MAKE_FLAGS \
    PATH_OVERRIDE_SOONG \
    TARGET_KERNEL_CONFIG \
    TARGET_KERNEL_SOURCE

# Setup SOONG_CONFIG_* vars to export the vars listed above.
# Documentation here:
# https://github.com/LineageOS/android_build_soong/commit/8328367c44085b948c003116c0ed74a047237a69

SOONG_CONFIG_NAMESPACES += xdroidVarsPlugin

SOONG_CONFIG_xdroidVarsPlugin :=

define addVar
  SOONG_CONFIG_xdroidVarsPlugin += $(1)
  SOONG_CONFIG_xdroidVarsPlugin_$(1) := $$(subst ",\",$$($1))
endef

$(foreach v,$(EXPORT_TO_SOONG),$(eval $(call addVar,$(v))))

SOONG_CONFIG_NAMESPACES += xdroidGlobalVars
SOONG_CONFIG_xdroidGlobalVars += \
    aapt_version_code \
    additional_gralloc_10_usage_bits \
    bootloader_message_offset \
    gralloc_handle_has_custom_content_md_reserved_size \
    camera_override_format_from_reserved \
    disable_bluetooth_le_read_buffer_size_v2 \
    disable_bluetooth_le_set_host_feature \
    gralloc_handle_has_reserved_size \
    target_alternative_futex_waiters \
    target_init_vendor_lib \
    target_ld_shim_libs \
    target_surfaceflinger_udfps_lib \
    target_trust_usb_control_path \
    target_trust_usb_control_enable \
    target_trust_usb_control_disable \
    uses_egl_display_array \
    needs_oplus_tag

SOONG_CONFIG_NAMESPACES += xdroidNvidiaVars
SOONG_CONFIG_xdroidNvidiaVars += \
    uses_nvidia_enhancements

SOONG_CONFIG_NAMESPACES += xdroidQcomVars
SOONG_CONFIG_xdroidQcomVars += \
    supports_extended_compress_format \
    uses_pre_uplink_features_netmgrd \
    qti_vibrator_effect_lib \
    qti_vibrator_use_effect_stream

# Only create display_headers_namespace var if dealing with UM platforms to avoid breaking build for all other platforms
ifneq ($(filter $(UM_PLATFORMS),$(TARGET_BOARD_PLATFORM)),)
SOONG_CONFIG_xdroidQcomVars += \
    qcom_display_headers_namespace
endif

# Soong bool variables
SOONG_CONFIG_xdroidGlobalVars_gralloc_handle_has_custom_content_md_reserved_size := $(TARGET_GRALLOC_HANDLE_HAS_CUSTOM_CONTENT_MD_RESERVED_SIZE)
SOONG_CONFIG_xdroidGlobalVars_gralloc_handle_has_reserved_size := $(TARGET_GRALLOC_HANDLE_HAS_RESERVED_SIZE)
SOONG_CONFIG_xdroidGlobalVars_uses_egl_display_array := $(TARGET_USES_EGL_DISPLAY_ARRAY)
SOONG_CONFIG_xdroidNvidiaVars_uses_nvidia_enhancements := $(NV_ANDROID_FRAMEWORK_ENHANCEMENTS)
SOONG_CONFIG_xdroidQcomVars_supports_extended_compress_format := $(AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT)
SOONG_CONFIG_xdroidQcomVars_uses_pre_uplink_features_netmgrd := $(TARGET_USES_PRE_UPLINK_FEATURES_NETMGRD)
SOONG_CONFIG_xdroidGlobalVars_needs_oplus_tag := $(TARGET_NEEDS_OPLUS_VENDOR_TAG)
SOONG_CONFIG_xdroidGlobalVars_camera_override_format_from_reserved := $(TARGET_CAMERA_OVERRIDE_FORMAT_FROM_RESERVED)
SOONG_CONFIG_xdroidGlobalVars_target_alternative_futex_waiters := $(TARGET_ALTERNATIVE_FUTEX_WAITERS)
SOONG_CONFIG_xdroidQcomVars_qti_vibrator_use_effect_stream := $(TARGET_QTI_VIBRATOR_USE_EFFECT_STREAM)

# Set default values
BOOTLOADER_MESSAGE_OFFSET ?= 0
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS ?= 0
TARGET_CAMERA_OVERRIDE_FORMAT_FROM_RESERVED ?= false
TARGET_GRALLOC_HANDLE_HAS_CUSTOM_CONTENT_MD_RESERVED_SIZE ?= false
TARGET_GRALLOC_HANDLE_HAS_RESERVED_SIZE ?= false
TARGET_INIT_VENDOR_LIB ?= vendor_init
TARGET_SURFACEFLINGER_UDFPS_LIB ?= surfaceflinger_udfps_lib
TARGET_TRUST_USB_CONTROL_PATH ?= /proc/sys/kernel/deny_new_usb
TARGET_TRUST_USB_CONTROL_ENABLE ?= 1
TARGET_TRUST_USB_CONTROL_DISABLE ?= 0
TARGET_GRALLOC_HANDLE_HAS_CUSTOM_CONTENT_MD_RESERVED_SIZE ?= false
TARGET_QTI_VIBRATOR_EFFECT_LIB ?= libqtivibratoreffect

# Soong value variables
SOONG_CONFIG_xdroidGlobalVars_aapt_version_code := $(shell date -u +%Y%m%d)
SOONG_CONFIG_xdroidGlobalVars_additional_gralloc_10_usage_bits := $(TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS)
SOONG_CONFIG_xdroidGlobalVars_disable_bluetooth_le_read_buffer_size_v2 := $(TARGET_DISABLE_BLUETOOTH_LE_READ_BUFFER_SIZE_V2)
SOONG_CONFIG_xdroidGlobalVars_disable_bluetooth_le_set_host_feature := $(TARGET_DISABLE_BLUETOOTH_LE_SET_HOST_FEATURE)
SOONG_CONFIG_xdroidGlobalVars_bootloader_message_offset := $(BOOTLOADER_MESSAGE_OFFSET)
SOONG_CONFIG_xdroidGlobalVars_target_init_vendor_lib := $(TARGET_INIT_VENDOR_LIB)
SOONG_CONFIG_xdroidGlobalVars_target_ld_shim_libs := $(subst $(space),:,$(TARGET_LD_SHIM_LIBS))
SOONG_CONFIG_xdroidGlobalVars_target_surfaceflinger_udfps_lib := $(TARGET_SURFACEFLINGER_UDFPS_LIB)
SOONG_CONFIG_xdroidGlobalVars_target_trust_usb_control_path := $(TARGET_TRUST_USB_CONTROL_PATH)
SOONG_CONFIG_xdroidGlobalVars_target_trust_usb_control_enable := $(TARGET_TRUST_USB_CONTROL_ENABLE)
SOONG_CONFIG_xdroidGlobalVars_target_trust_usb_control_disable := $(TARGET_TRUST_USB_CONTROL_DISABLE)
SOONG_CONFIG_xdroidQcomVars_qti_vibrator_effect_lib := $(TARGET_QTI_VIBRATOR_EFFECT_LIB)
ifneq ($(filter $(QSSI_SUPPORTED_PLATFORMS),$(TARGET_BOARD_PLATFORM)),)
SOONG_CONFIG_xdroidQcomVars_qcom_display_headers_namespace := vendor/qcom/opensource/commonsys-intf/display
else
SOONG_CONFIG_xdroidQcomVars_qcom_display_headers_namespace := $(QCOM_SOONG_NAMESPACE)/display
endif
