#! /bin/bash
sudo apt update
sudo apt -y install build-essential
sudo apt -y install chrpath
sudo apt -y install diffstat
sudo apt -y install gawk
sudo apt -y install libncurses5-dev
sudo apt -y install texinfo
sudo apt -y install python2.7
sudo apt -y install git
sudo apt -y install pkg-config
sudo apt -y install subversion
sudo apt -y install texi2html

# Yocto is python2 only :(
sudo ln -sf /usr/bin/python2.7 /usr/bin/python
sudo ln -sf /usr/bin/python2.7 /usr/bin/python2

# does this matter if we're not interactive?
# if so, how do we do it non-interactively
#sudo dpkg-reconfigure dash


##################################################################

git clone -b krogoth git://git.yoctoproject.org/poky.git poky-krogoth

cd poky-krogoth
git clone -b krogoth git://git.openembedded.org/meta-openembedded
git clone -b krogoth https://github.com/meta-qt5/meta-qt5.git

# find out why, if at all, we need these layers
git clone -b v5.6.3 https://code.qt.io/yocto/meta-boot2qt.git 
git clone -b krogoth git://git.yoctoproject.org/meta-mingw
git clone -b krogoth https://git.yoctoproject.org/git/meta-qt4.git
git clone -b krogoth git://git.yoctoproject.org/meta-ti

mkdir ~/bbb
cd ~/bbb
git clone -b krogoth git://github.com/clint-lawrence/meta-bbb

##################################################################
cd ~
source poky-krogoth/oe-init-build-env ~/bbb/build

cp ../meta-bbb/conf/local.conf-sample conf/local.conf
cp ../meta-bbb/conf/bblayers.conf-sample conf/bblayers.conf

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
