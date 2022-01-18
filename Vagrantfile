# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "ubuntu/xenial64" # "ubuntu/trusty64"

  # Port forwarding (using NAT instead of DHCP)
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Port forwarded mapping which allows access to a specific port (only accessable via localhost)
  config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Share an additional folder to the guest VM.
  #     arg1: path on the host to the actual folder.
  #     arg2: path on the guest to mount the folder.
  config.vm.synced_folder "./vagrant_data", "/home/vagrant/vagrant_data"

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    # vb.gui = true
    vb.memory = "2048"
  end

  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y git
    apt-get install -y make
    apt-get install -y cmake
    apt-get install -y ninja
    apt-get install -y g++-arm-linux-gnueabihf    # Linux arm
    sudo apt-get install -y g++-aarch64-linux-gnu # Linux arm64 
    
    # Install python3.9 (required python >=3.8 for build script PDFium)
    sudo add-apt-repository ppa:deadsnakes/ppa
    sudo apt update
    sudo apt install python3.9 python3.9-dev python3.9-venv
    echo "alias python3='/usr/bin/python3.9'" >> ~/.bashrc
    
    # Install/upgrade libstdc++6
    sudo add-apt-repository ppa:ubuntu-toolchain-r/test
    sudo apt-get update
    sudo apt-get install -y gcc-4.9
    sudo apt-get upgrade -y libstdc++6

    # Download & install depot_tools and PDFium
    cd /home/vagrant/vagrant_data
    git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
    echo "export PATH=~/vagrant_data/depot_tools:$PATH" >> /home/vagrant/.bashrc
    source /home/vagrant/.bashrc
    git clone https://pdfium.googlesource.com/pdfium
    gclient config --unmanaged https://pdfium.googlesource.com/pdfium.git

  SHELL
end
