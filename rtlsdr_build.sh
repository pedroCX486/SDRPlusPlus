#!/bin/bash

make 

git clone https://github.com/rtlsdrblog/rtl-sdr-blog.git
cd rtl-sdr/
mkdir build
cd build/
cmake ../

if [ -z "$GITHUB_ENV" ]
then
    # If we're on Github Actions, then go for macOS11 libusb path.
    make LIBRARY_PATH=/opt/homebrew/Cellar/libusb/1.0.26/lib/ 
else
    # If we're on desktop, then go for macOS13+ (M-series) libusb path.
    make LIBRARY_PATH=/usr/local/Cellar/libusb/1.0.26/lib/
fi

sudo make install