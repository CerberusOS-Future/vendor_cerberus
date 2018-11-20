# Charger
#ifneq ($(WITH_CM_CHARGER),false)
#    BOARD_HAL_STATIC_LIBRARIES := libhealthd.cm
#endif

include vendor/cerberus/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/cerberus/config/BoardConfigQcom.mk
endif

include vendor/cerberus/config/BoardConfigSoong.mk

PRODUCT_COPY_FILES += \
    vendor/cerberus/config/sysconfig/cerberus_whitelist.xml:system/etc/sysconfig/cerberus_whitelist.xml \
    vendor/cerberus/config/permissions/privapp-permissions-cerberus.xml:system/etc/permissions/privapp-permissions-cerberus.xml
