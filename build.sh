#!/bin/bash

cd ../buildroot || exit
core_count=$(grep -c   "^processor" /proc/cpuinfo)
make -j "$core_count"
make -j "$core_count"