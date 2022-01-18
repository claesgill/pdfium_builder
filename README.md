# Building pdfium binaries

1. [Prerequisites](#prerequisites)
1. [Running Vagrant](#running-vagrant)
1. [Build binaries](#build-binaries)

## Prerequisites
- Vagrant
- Virtualbox

## Running Vagrant
Running and install the Vagrantbox:
```sh
vagrant up
```

SSH into the Vagrantbox using:
```sh
vagrant ssh
```

Other usefull commands:
```sh
vagrant suspend             # Pause the VM
vagrant halt                # Turn off the VM
vagrant destroy --force     # When you are done with the Vagrantbox (will remove and require rebuild)
```

## Build binaries
The following systems can be built:
- Linux (x64, arm, arm64)
- iOS (arm64, x64)
- Android (x86, x64, arm, arm64)
- MacOS (x64, arm64) [TODO]
- Windows (x86, x64, arm64) [TODO]
- WASM [TODO]

Before you build you would need to modify your build settings in the [env][/vagrant_data/env]-file.  
Here you need to specify the options to fit your need:
```sh
TARGET_OS=""                     # android/ios/linux/macos/windows
TARGET_CPU=""                    # x86/x64/arm/arm64
BUILD_ALL_TARGET_CPUS=""         # true/false - true will build ALL cpus for the given TARGET_OS in separate folders
PDFIUM_BRANCH="chromium/4837"    # Selected chromium branch to build binaries from.
```

When satisfied you can run the main script to build:
```sh
cd vagrant_data
./script/main.sh   # This might take a while the first time(!)
```

Your binary will be located in the out folder in the pdfium repo:
```sh
cd pdfium/out/
```

Here you will find your build folder named `TARGET_OS-TARGET_CPU`. I.e. `android-x64`.  
If you had the `BUILD_ALL_TARGET_CPUS="true"` set, you will find a list of folders of all the available targets for the given os.
