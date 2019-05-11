#! /bin/bash
sudo apt update
sudo apt -y install build-essential
sudo apt -y install chrpath
sudo apt -y install diffstat
sudo apt -y install gawk
sudo apt -y install libncurses5-dev
sudo apt -y install texinfo
sudo apt -y install python2.7

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

bitbake console-image