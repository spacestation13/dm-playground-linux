#!/bin/bash

#Make sure the working directory is the script location
cd "$(dirname "$0")" || exit

#Remove existing install
rm ../buildroot -rf

#Download buildroot, extract inside directory, delete tar file, move decompressed directory and remove temp dir
mkdir temp
wget https://buildroot.org/downloads/buildroot-2022.05.1.tar.gz -O temp/buildroot.tar.gz
tar -xvf temp/buildroot.tar.gz
rm temp/buildroot.tar.gz
mv temp/buildroot-* ../buildroot
rmdir temp

#Setup symlink
ln -s ../byondvm ../buildroot/byondvm

#Load default config and do initial build
cd ../buildroot || exit
make defconfig byondvm_defconfig BR2_EXTERNAL=byondvm
./build.sh