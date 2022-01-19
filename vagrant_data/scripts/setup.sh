# Modify .gclient target os
rm $VAGRANT_DATA_PATH/.gclient
cat $GCLIENT_FILE > $VAGRANT_DATA_PATH/.gclient
echo "target_os = [ '$TARGET_OS' ]" >> $VAGRANT_DATA_PATH/.gclient

# Sync pdfium
set -x # to see output from gclient
gclient sync -r "origin/$PDFIUM_BRANCH" --no-history --shallow --force
set +x

if [ $TARGET_OS == "android" ]; then
    /home/vagrant/vagrant_data/pdfium/build/install-build-deps-android.sh
else
    # TODO: True for all other builds???
    # /home/vagrant/vagrant_data/pdfium/build/install-build-deps.sh
fi
