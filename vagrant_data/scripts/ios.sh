#!/bin/bash

source "/home/$USER/vagrant_data/scripts/helpers/functions.sh"

if [ $BUILD_ALL_TARGET_CPUS == "true" ]; then
    echo "Building for all target CPUs. Available: 'x64' and 'arm64'"
    create_output_dir_and_build "x64"
    create_output_dir_and_build "arm64"
else
    create_output_dir_and_build "$TARGET_CPU"
fi
