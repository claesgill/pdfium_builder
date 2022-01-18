# Modify .gclient target os
rm $VAGRANT_DATA_PATH/.gclient
cat $GCLIENT_FILE > $VAGRANT_DATA_PATH/.gclient
echo "target_os = [ '$TARGET_OS' ]" >> $VAGRANT_DATA_PATH/.gclient

# Sync pdfium
set -x # to see output from gclient
gclient sync -r --no-history --shallow
set +x

# Add gn args
# cd $VAGRANT_DATA_PATH/pdfium
# rm -rf $OUTPUT_DIR_NAME
# gn gen $OUTPUT_DIR_NAME
# cat $COMMON_GN_ARGS_FILE > $OUTPUT_DIR_NAME/args.gn
# echo 'target_os = "$TARGET_OS"' >> $OUTPUT_DIR_NAME/args.gn
# echo 'target_cpu = "$TARGET_CPU"' >> $OUTPUT_DIR_NAME/args.gn
