#!/bin/bash

source "/home/$USER/vagrant_data/scripts/helpers/constants"
source "$SCRIPTS_PATH/helpers/functions.sh"
source "/home/$USER/vagrant_data/env"

echo "Initializing with the following settings:"
echo -e "\t TARGET_OS=$TARGET_OS"
echo -e "\t TARGET_CPU=$TARGET_CPU"
echo -e "\t BUILD_ALL_TARGET_CPUS=$BUILD_ALL_TARGET_CPUS"
echo -e "\t PDFIUM_BRANCH=$PDFIUM_BRANCH\n"

echo "Running setup - this can take a while!"
source "/home/$USER/vagrant_data/scripts/setup.sh"

case "$TARGET_OS" in
    ios)
        source "$SCRIPTS_PATH/ios.sh"
        ;;
    android)
        source "$SCRIPTS_PATH/android.sh"
        ;;
    linux)
        source $SCRIPTS_PATH/linux.sh
        ;;
    windows)
        echo "NOT IMPLEMENTED"
        ;;
    macos)
        echo "NOT IMPLEMENTED"
        ;;
    wasm)
        echo "NOT IMPLEMENTED"
        ;;
esac
