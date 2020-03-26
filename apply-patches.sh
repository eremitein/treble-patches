#!/bin/bash
set -e

patches="$(readlink -f -- $1)"

for project in $(cd $patches/patches; echo *); do
	p="$(tr _ / <<<$project |sed -e 's;platform/;;g')"
	[ "$p" == build ] && p=build/make
	[ "$p" == vendor/hardware/overlay ] && p=vendor/hardware_overlay
	echo
	pushd $p
	git clean -fdx; git reset --hard
	for patch in $patches/patches/$project/[!-]*.patch; do
		#Check if patch is already applied
		if patch -f -p1 --dry-run -R -i $patch &> /dev/null; then
			echo ":: Already applied $patch"
			continue
		fi

		if git apply --check $patch; then
			git am $patch
		elif patch -f -p1 --dry-run -i $patch &> /dev/null; then
			#This will fail
			git am $patch || true
			patch -f -p1 -i $patch
			git add -u
			git am --continue
			echo ":: Dirty applied $patch"
		else
			echo ":: Failed applying $patch"
		fi
	done
	popd
done

