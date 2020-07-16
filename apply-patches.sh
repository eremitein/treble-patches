#!/bin/bash
set -e

patches="$(readlink -f -- $1)"

for project in $(cd ${patches}/patches/; echo *); do
	p="$(tr _ / <<<${project} |sed -e 's;platform/;;g')"
	[ "$p" == build ] && p=build/make
	[ "$p" == vendor/hardware/overlay ] && p=vendor/hardware_overlay
	echo
	pushd $p
		git clean -fdx
		git reset --hard
		git am ${patches}/patches/${project}/0*.patch ||exit
	popd
done
