#!/bin/bash
#set -e

rund="$(pwd)"

if [ ! "$1" ]; then
	echo "set build directory"
	exit
fi

pushd "$1"

repo init -u https://android.googlesource.com/platform/manifest -b android-10.0.0_r36
git clone --single-branch https://github.com/eremitein/treble_manifest_caos -b v216 .repo/local_manifests
repo sync -j8 -c -q --force-sync --no-tags --no-clone-bundle --optimized-fetch --prune
bash ${rund}/apply-patches.sh ${rund}
cd device/phh/treble
bash generate.sh
cd -
. build/envsetup.sh
lunch treble_arm64_bvN-userdebug
make -j8 systemimage

popd
