PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Disable excessive dalvik debug messages
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.debug.alloc=0

#Some Permissions
PRODUCT_COPY_FILES += \
    vendor/cerberus/config/permissions/privapp-permissions-custom.xml:system/etc/permissions/privapp-permissions-custom.xml

# Backup tool
PRODUCT_COPY_FILES += \
    vendor/cerberus/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/cerberus/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/cerberus/prebuilt/common/bin/50-cerberus.sh:system/addon.d/50-cerberus.sh \
    vendor/cerberus/prebuilt/common/bin/clean_cache.sh:system/bin/clean_cache.sh

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/cerberus/prebuilt/common/bin/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/cerberus/prebuilt/common/bin/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/cerberus/prebuilt/common/bin/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
endif

# Backup services whitelist
PRODUCT_COPY_FILES += \
    vendor/cerberus/config/permissions/backup.xml:system/etc/sysconfig/backup.xml

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/cerberus/prebuilt/common/bin/otasigcheck.sh:install/bin/otasigcheck.sh

# cerberus-specific init file
PRODUCT_COPY_FILES += \
    vendor/cerberus/prebuilt/common/etc/init.local.rc:root/init.cerberus.rc

# Copy LatinIME for gesture typing
PRODUCT_COPY_FILES += \
    vendor/cerberus/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so

# SELinux filesystem labels
PRODUCT_COPY_FILES += \
    vendor/cerberus/prebuilt/common/etc/init.d/50selinuxrelabel:system/etc/init.d/50selinuxrelabel

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# init file
PRODUCT_COPY_FILES += \
    vendor/cerberus/prebuilt/common/etc/init/cerberusos-updates.rc:system/etc/init/cerberusos-updates.rc

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/cerberus/prebuilt/common/etc/mkshrc:system/etc/mkshrc \
    vendor/cerberus/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf

# Fix Dialer
#PRODUCT_COPY_FILES +=  \
#    vendor/cerberus/prebuilt/common/sysconfig/dialer_experience.xml:system/etc/sysconfig/dialer_experience.xml

# cerberus-specific startup services
PRODUCT_COPY_FILES += \
    vendor/cerberus/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/cerberus/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit \
    vendor/cerberus/prebuilt/common/bin/sysinit:system/bin/sysinit

# Required packages
PRODUCT_PACKAGES += \
    CellBroadcastReceiver \
    SpareParts \
    LockClock \
    su

# Optional packages
PRODUCT_PACKAGES += \
    Basic \
    LiveWallpapersPicker \
    PhaseBeam

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librsjni

# AudioFX
PRODUCT_PACKAGES += \
    AudioFX

# Extra Optional packages
PRODUCT_PACKAGES += \
    Calculator \
    GboardGoPreb \
    BluetoothExt

# Cerberus OS Extra Packages
PRODUCT_PACKAGES += \
	Lawnchair \
	CameraRoll \
	MiXplorerPrebuilt \
	MusicPlayer \
	LawnConf \
	MarkupGoogle \
        GDeskClock \
	WellbeingPrebuilt \
	Recorder \
	OmniRecord

# CERBERUS Den package
PRODUCT_PACKAGES += \
    CerberusOSDen

# CERBERUSOS theming packages
include packages/overlays/CerberusOS/product_packages.mk

# Extra tools
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs \
    fsck.exfat \
    mkfs.exfat \
    ntfsfix \
    ntfs-3g

PRODUCT_PACKAGES += \
    charger_res_images

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

PRODUCT_PROPERTY_OVERRIDES += \
    media.sf.omx-plugin=libffmpeg_omx.so \
    media.sf.extractor-plugin=libffmpeg_extractor.so

# Lawnchair
PRODUCT_COPY_FILES += \
    vendor/cerberus/prebuilt/common/etc/permissions/privapp-permissions-lawnchair.xml:system/etc/permissions/privapp-permissions-lawnchair.xml \
    vendor/cerberus/prebuilt/common/etc/sysconfig/lawnchair-hiddenapi-package-whitelist.xml:system/etc/sysconfig/lawnchair-hiddenapi-package-whitelist.xml

# Storage manager
PRODUCT_PROPERTY_OVERRIDES += \
    ro.storage_manager.enabled=true

# Disable rescue party
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.disable_rescue=true

# easy way to extend to add more packages
-include vendor/extra/product.mk

PRODUCT_PACKAGES += \
    AndroidDarkThemeOverlay \
    SettingsDarkThemeOverlay

PRODUCT_PACKAGE_OVERLAYS += vendor/cerberus/overlay/common

# Bootanimation
ifeq ($(TARGET_BOOTANIMATION_480P),true)
PRODUCT_COPY_FILES += \
    vendor/cerberus/bootanimation/bootanimation-480p.zip:system/media/bootanimation.zip
else
PRODUCT_COPY_FILES += \
    vendor/cerberus/bootanimation/bootanimation.zip:system/media/bootanimation.zip
endif

# Some props that we need for the google stuff we're adding
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.ime.height_ratio=1.05 \
    ro.com.google.ime.emoji_key=false

PRODUCT_GENERIC_PROPERTIES += \
    ro.boot.vendor.overlay.theme=com.google.android.theme.pixel;com.cerberus.overlay.lawnconf
	
# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/cerberus/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/cerberus/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/cerberus/prebuilt/common/bin/50-cerberus.sh:system/addon.d/50-cerberus.sh \
    vendor/cerberus/prebuilt/common/bin/blacklist:system/addon.d/blacklist

 ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/cerberus/prebuilt/common/bin/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/cerberus/prebuilt/common/bin/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/cerberus/prebuilt/common/bin/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
endif

# Versioning System
include vendor/cerberus/config/version.mk

# Google sounds
include vendor/cerberus/google/GoogleAudio.mk

EXTENDED_POST_PROCESS_PROPS := vendor/cerberus/tools/cerberus_process_props.py
