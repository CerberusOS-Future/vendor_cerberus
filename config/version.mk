# Copyright (C) 2018 CerberusOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Versioning System
# CerberusOS Version.
CERBERUS_VERSION_NUMBER := v1.8
CERBERUS_VERSION_P := 1.8
CERBERUS_BUILD_DATE := $(shell date -u +%d-%m-%Y)
CERBERUS_DEVICE := $(CERBERUS_BUILD)

ifndef CERBERUS_BUILD_TYPE
    CERBERUS_BUILD_TYPE := UNOFFICIAL

endif

ifndef CERBERUS_MAINTAINER
    CERBERUS_MAINTAINER := Unknown
endif

ifeq ($(CERBERUS_BUILD_TYPE), OFFICIAL)

PRODUCT_PACKAGES += \
    CerberusOTA

endif

# Set all versions
CERBERUS_VERSION := CerberusOS-$(CERBERUS_VERSION_NUMBER)-$(shell date +"%Y%m%d")-Pie4-$(CERBERUS_DEVICE)-$(CERBERUS_BUILD_TYPE)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.cerberus.buildtype=$(CERBERUS_BUILD_TYPE) \
    cerberus.ota.version=$(CERBERUS_VERSION) \
    ro.modversion=$(CERBERUS_VERSION_NUMBER) \
    ro.cerberusmodversion=$(CERBERUS_VERSION_P) \
    ro.cerberus.version=$(CERBERUS_VERSION) \
    ro.cerberus.build_date=$(CERBERUS_BUILD_DATE) \
    ro.cerberus.maintainer=$(CERBERUS_MAINTAINER) \
    ro.cerberus.device=$(CERBERUS_DEVICE)
