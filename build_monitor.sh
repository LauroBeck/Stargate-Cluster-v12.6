#!/bin/bash
echo "Building Stargate C++ Monitor v12.6..."
g++ -O3 -mavx2 stargate_monitor.cpp \
    -o stargate_monitor \
    -I$(pg_config --includedir) \
    -L$(pg_config --libdir) \
    -lpq

if [ $? -eq 0 ]; then
    echo "Build Successful. Launching..."
    ./stargate_monitor
else
    echo "Build Failed."
fi
