#!/bin/bash
set -e

patches="$(readlink -f -- $1)"
assets="crdroid generic personal"

for d in ${assets}; do
  for project in $(cd ${patches}/patches/${d}; echo *); do
    p="$(tr _ / <<<${project} |sed -e 's;platform/;;g')"
    [ "$p" == build ] && p=build/make
    [ "$p" == vendor/hardware/overlay ] && p=vendor/hardware_overlay
    echo
    pushd $p
      git clean -fdx
      git reset --hard
      git am ${patches}/patches/${d}/${project}/0*.patch ||exit
    popd
  done
done
