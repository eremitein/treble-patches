crDRom Project (crDroid based)


This is GSI project, patches based on the Phh's and Andy Yan works

apply-patches.sh to apply all patches
	ex. usage:
	cd /where/crdroid/sources
	bash ~/files/patches/crdroid/v224/apply-patches.sh ~/files/patches/crdroid/v224/

buildcrDRom.sh for starting build process from zero
	ex. usage:
	cd ~/files/patches/crdroid/v224
	bash buildcrDRom.sh /where/crdroid/sources

Patches separated to the three category:
crdroid - specific fixes to adapt crDroid for GSI (mainly based on Andy's patches)
generic - Phh's patches, some of them adapted for crDroid
personal - my personal additional tweaks & fixes (for crDRom Project)
