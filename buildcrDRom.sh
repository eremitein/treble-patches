#!/bin/bash
#set -e

rund="$(pwd)"
para="$(nproc)"

if [ ! "$1" ]; then
  echo "set build directory"
  exit
fi

pushd "$1"

repo init -u https://github.com/crdroidandroid/android.git -b 10.0
git clone --single-branch https://github.com/phhusson/treble_manifest -b android-10.0 .repo/local_manifests
sed -i -E '/external\/exfat/d' .repo/local_manifests/manifest.xml
rm .repo/local_manifests/foss.xml
rm .repo/local_manifests/replace.xml
rm .repo/local_manifests/gmsexpress.xml
repo sync -j${para} -c -q --force-sync --no-tags --no-clone-bundle --optimized-fetch --prune ||exit
#mkdir device/generic
#cd device/generic
#git clone --single-branch https://android.googlesource.com/device/generic/common
#cd -
bash ${rund}/apply-patches.sh ${rund}
cd device/phh/treble
bash generate.sh lineage
cd -
. build/envsetup.sh
lunch treble_arm64_bvN-userdebug
make -j${para} systemimage

popd
