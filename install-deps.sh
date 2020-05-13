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