#!/bin/bash

echo "Building and installing RTL-SDR's fork of the Osmocom driver..."

git clone https://github.com/rtlsdrblog/rtl-sdr-blog.git
cd rtl-sdr-blog/
mkdir build
cd build/

cmake -DCMAKE_BUILD_TYPE=Release ../

make -j3 LIBRARY_PATH=$(pkg-config --libs-only-L libusb-1.0 | sed 's/\-L//')

sudo make install