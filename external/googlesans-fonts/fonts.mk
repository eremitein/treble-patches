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

# We have to use PRODUCT_PACKAGES (together with BUILD_PREBUILT) instead of
# PRODUCT_COPY_FILES to install the font files, so that the NOTICE file can
# get installed too.

PRODUCT_PACKAGES := \
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
