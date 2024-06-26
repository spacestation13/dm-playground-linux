#!/bin/bash

#Make sure the working directory is the script location
cd "$(dirname "$0")" || exit

#Remove existing install
rm ../buildroot -rf

#Download buildroot, extract inside directory, delete tar file, move decompressed directory and remove temp dir
mkdir temp
wget https://buildroot.org/downloads/buildroot-2024.02.3.tar.gz -O temp/buildroot.tar.gz
tar -xvf temp/buildroot.tar.gz
rm temp/buildroot.tar.gz
mv buildroot-* ../buildroot
rmdir temp

#Setup symlink
ln -s "$(pwd)" ../buildroot/byondvm

#Load default config and do initial build
cd ../buildroot || exit
make defconfig byondvm_defconfig BR2_EXTERNAL=byondvm
./byondvm/build.sh