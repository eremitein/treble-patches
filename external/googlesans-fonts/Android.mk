# Copyright (C) 2018 The Android Open Source Project
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

# We have to use BUILD_PREBUILT instead of PRODUCT_COPY_FIES,
# to copy over the NOTICE file.

LOCAL_PATH := $(call my-dir)

ifneq ($(SMALLER_FONT_FOOTPRINT),true)

include $(CLEAR_VARS)

# Build the rest of font files as prebuilt.
# $(1): The source file name in LOCAL_PATH.
#       It also serves as the module name and the dest file name.
define build-one-font-module
$(eval include $(CLEAR_VARS))\
$(eval LOCAL_MODULE := $(1))\
$(eval LOCAL_SRC_FILES := $(1))\
$(eval LOCAL_MODULE_CLASS := ETC)\
$(eval LOCAL_MODULE_TAGS := optional)\
$(eval LOCAL_MODULE_PATH := $(TARGET_OUT)/fonts)\
$(eval LOCAL_PRODUCT_MODULE := true) \
$(eval include $(BUILD_PREBUILT))
endef

font_src_files := \
    GoogleSans-BlackItalic.ttf \
    GoogleSans-Black.ttf \
    GoogleSans-BoldItalic.ttf \
    GoogleSans-Bold.ttf \
    GoogleSansCondensed-BoldItalic.ttf \
    GoogleSansCondensed-Bold.ttf \
    GoogleSansCondensed-Italic.ttf \
    GoogleSansCondensed-LightItalic.ttf \
    GoogleSansCondensed-Light.ttf \
    GoogleSansCondensed-MediumItalic.ttf \
    GoogleSansCondensed-Medium.ttf \
    GoogleSansCondensed-Regular.ttf \
    GoogleSans-Italic.ttf \
    GoogleSans-LightItalic.ttf \
    GoogleSans-Light.ttf \
    GoogleSans-MediumItalic.ttf \
    GoogleSans-Medium.ttf \
    GoogleSans-Regular.ttf \
    GoogleSans-ThinItalic.ttf \
    GoogleSans-Thin.ttf

$(foreach f, $(font_src_files), $(call build-one-font-module, $(f)))

build-one-font-module :=
font_src_files :=

endif
