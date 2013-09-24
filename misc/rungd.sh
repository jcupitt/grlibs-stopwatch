#!/bin/bash

# Compile and run gd_resize under the local (uninstalled) build of LibGD

set -e

#VG=valgrind tool=callgrind
#VG="cgdb -- --args"

GDDIR=../../gd-libgd/src
GDBLD_DIR=$GDDIR/.libs/

cd `dirname $0`

# pushd ../../gd-libgd/src
# if make -q; then
#     echo "Lib is up to date."
# else
#     cd ..
# #    make clean
#     make -j 4

#     echo
#     echo
#     echo "Installing:"
#     sudo make install
#     sudo ldconfig
# fi
# popd

cd ../c_tests/

echo "Compiling..."
time \
gcc -g -O -Wall `pkg-config gdlib --libs --cflags` \
    gd_resize.c timer.c util.c \
    -lgd -lm -o gd_resize 
echo

#export MALLOC_CHECK_=

#export LD_LIBRARY_PATH=../../
#$VG ./gd_resize ../data/8s.jpg out 1600 # Exactly half the size
$VG ./gd_resize ../data/8s.jpg out 2080 2080 # 2080 2080 2080 
#$VG ./gd_resize ../data/8s.jpg out 4160 4160 # 2080 2080 2080 



