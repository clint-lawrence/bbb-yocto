#! /bin/bash

#################################################################

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