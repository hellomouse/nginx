#!/bin/bash
set -e

# set optimal parallel count
export parallel=${parallel:-$(($(grep -c ^processor /proc/cpuinfo) / 2))}

./init

./apply-patches
./compile-luajit
./compile-boringssl

./do-configure
make -j $parallel
