#! /bin/bash

##################################################################
cd ~
source poky-krogoth/oe-init-build-env ~/bbb/build


# here is where we can tweak the default options

##################################################################

# Stuff about default root password I've ignored

##################################################################

# Build target image => tmp/deploy/images/beaglebone
bitbake qt5-image

# Build the installer image which copies to eMMC => tmp/deploy/images/beaglebone
bitbake installer-image

# Build sdk => tmp/deploy/sdk/poky[...].sh
bitbake qt5-image -c populate_sdk
