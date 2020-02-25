# Copyright (C) 2015 The Android Open Source Project
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
# because MINIMAL_FONT_FOOTPRINT is only available in Android.mks.

LOCAL_PATH := $(call my-dir)

##########################################
# create symlink for given font
# $(1): new font $(2): link target
# should be used with eval: $(eval $(call ...))
define create-font-symlink
$(PRODUCT_OUT)/system/fonts/$(1) : $(PRODUCT_OUT)/system/fonts/$(2)
	@echo "Symlink: $$@ -> $$<"
	@mkdir -p $$(dir $$@)
	@rm -rf $$@
	$(hide) ln -sf $$(notdir $$<) $$@
# this magic makes LOCAL_REQUIRED_MODULES work
ALL_MODULES.$(1).INSTALLED := \
    $(ALL_MODULES.$(1).INSTALLED) $(PRODUCT_OUT)/system/fonts/$(1)
endef

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
$(eval include $(BUILD_PREBUILT))
endef

font_src_files := \
    SimpleDay-Regular.ttf

ifeq ($(MINIMAL_FONT_FOOTPRINT),true)

$(eval $(call create-font-symlink,SimpleDay-Bold.ttf,SimpleDay-Regular.ttf))
$(eval $(call create-font-symlink,SimpleDay-BoldItalic.ttf,SimpleDay-Regular.ttf))
$(eval $(call create-font-symlink,SimpleDay-Italic.ttf,SimpleDay-Regular.ttf))
$(eval $(call create-font-symlink,SimpleDay-Medium.ttf,SimpleDay-Regular.ttf))
$(eval $(call create-font-symlink,SimpleDay-MediumItalic.ttf,SimpleDay-Regular.ttf))

else # !MINIMAL_FONT
font_src_files += \
    SimpleDay-Bold.ttf \
    SimpleDay-BoldItalic.ttf \
    SimpleDay-Italic.ttf \
    SimpleDay-Medium.ttf \
    SimpleDay-MediumItalic.ttf \

endif # !MINIMAL_FONT

$(foreach f, $(font_src_files), $(call build-one-font-module, $(f)))

build-one-font-module :=
font_src_files :=
