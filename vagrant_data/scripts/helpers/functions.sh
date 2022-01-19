#!/bin/bash

create_output_dir_and_build() {
    echo "Building for $TARGET_OS-$1"
    # Add gn args
    OUTPUT_DIR_NAME="out/$TARGET_OS-$1"
    cd "$VAGRANT_DATA_PATH/pdfium"
    rm -rf "$OUTPUT_DIR_NAME"
    gn gen "$OUTPUT_DIR_NAME"
    cat $COMMON_GN_ARGS_FILE > "$OUTPUT_DIR_NAME/args.gn"
    echo "target_os = '$TARGET_OS'"   >> "$OUTPUT_DIR_NAME/args.gn"
    echo "target_cpu = '$TARGET_CPU'" >> "$OUTPUT_DIR_NAME/args.gn"
    if [ $TARGET_OS == "linux" ]; then
        echo 'use_custom_libcxx = true'  >> "$OUTPUT_DIR_NAME/args.gn"
    else
        echo 'use_custom_libcxx = false'  >> "$OUTPUT_DIR_NAME/args.gn"
    fi
    
    set -x
    ninja -C "$OUTPUT_DIR_NAME"
}
