#!/bin/bash
set -e

# set optimal parallel count
export parallel=${parallel:-$(($(grep -c ^processor /proc/cpuinfo) / 2))}

git submodule init
git submodule update

./apply-patches
./compile-luajit

./do-configure
make -j $parallel
