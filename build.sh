#! /bin/bash
sudo apt update
sudo apt -yq install build-essential
sudo apt -yq install chrpath
sudo apt -yq install diffstat
sudo apt -yg install gawk
sudo apt -yg install libncurses5-dev
sudo apt -yg install texinfo
sudo apt -yq install python2.7

# Yocto is python2 only :(
sudo ln -sf /usr/bin/python2.7 /usr/bin/python
sudo ln -sf /usr/bin/python2.7 /usr/bin/python2

# does this matter if we're not interactive?
# if so, how do we do it non-interactively
#sudo dpkg-reconfigure dash


##################################################################

git clone -b thud git://git.yoctoproject.org/poky.git poky-thud

cd poky-thud
git clone -b thud git://git.openembedded.org/meta-openembedded
git clone -b thud https://github.com/meta-qt5/meta-qt5.git

mkdir ~/bbb
cd ~/bbb
git clone -b thud git://github.com/jumpnow/meta-bbb

##################################################################
cd ~
source poky-thud/oe-init-build-env ~/bbb/build

cp ../meta-bbb/conf/local.conf.sample conf/local.conf
cp ../meta-bbb/conf/bblayers.conf.sample conf/bblayers.conf

# here is where we can tweak the default options

##################################################################

# Stuff about default root password I've ignored

##################################################################

bit bake console-image