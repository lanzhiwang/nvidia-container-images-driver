#!/usr/bin/env bash

set -eu
set -x

download_installer() {
    DRIVER_ARCH=${TARGETARCH/amd64/x86_64} && DRIVER_ARCH=${DRIVER_ARCH/arm64/aarch64} && curl -fSsl -O $BASE_URL/$DRIVER_VERSION/NVIDIA-Linux-$DRIVER_ARCH-$DRIVER_VERSION.run &&
        chmod +x NVIDIA-Linux-$DRIVER_ARCH-$DRIVER_VERSION.run
    # + DRIVER_ARCH=x86_64
    # + DRIVER_ARCH=x86_64
    # + curl -fSsl -O https://us.download.nvidia.com/tesla/535.104.05/NVIDIA-Linux-x86_64-535.104.05.run
    # + chmod +x NVIDIA-Linux-x86_64-535.104.05.run

}

dep_install() {
    if [ "$TARGETARCH" = "amd64" ]; then
        dpkg --add-architecture i386 &&
            apt-get update && apt-get install -y --no-install-recommends \
            apt-utils \
            build-essential \
            ca-certificates \
            curl \
            kmod \
            file \
            libelf-dev \
            libglvnd-dev \
            pkg-config &&
            rm -rf /var/lib/apt/lists/*

    # + '[' amd64 = amd64 ']'
    # + dpkg --add-architecture i386
    # + apt-get update
    # + apt-get install -y --no-install-recommends
    #     apt-utils
    #     build-essential
    #     ca-certificates
    #     curl
    #     kmod
    #     file
    #     libelf-dev
    #     libglvnd-dev
    #     pkg-config
    # + rm -rf
    #     /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_jammy-security_InRelease
    #     /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_jammy-security_main_binary-amd64_Packages.lz4
    #     /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_jammy-security_universe_binary-amd64_Packages.lz4
    #     /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_jammy-updates_InRelease
    #     /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_jammy-updates_main_binary-amd64_Packages.lz4
    #     /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_jammy-updates_universe_binary-amd64_Packages.lz4
    #     /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_jammy_InRelease
    #     /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_jammy_main_binary-amd64_Packages.lz4
    #     /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_jammy_universe_binary-amd64_Packages.lz4
    #     /var/lib/apt/lists/auxfiles
    #     /var/lib/apt/lists/developer.download.nvidia.com_compute_cuda_repos_ubuntu2204_x86%5f64_InRelease
    #     /var/lib/apt/lists/developer.download.nvidia.com_compute_cuda_repos_ubuntu2204_x86%5f64_Packages.lz4
    #     /var/lib/apt/lists/lock
    #     /var/lib/apt/lists/partial

    elif [ "$TARGETARCH" = "arm64" ]; then
        dpkg --add-architecture arm64 &&
            apt-get update && apt-get install -y \
            build-essential \
            ca-certificates \
            curl \
            kmod \
            file \
            libelf-dev \
            libglvnd-dev &&
            rm -rf /var/lib/apt/lists/*
    fi
}

repo_setup() {
    if [ "$TARGETARCH" = "amd64" ]; then
        echo "deb [arch=amd64] http://archive.ubuntu.com/ubuntu/ jammy main universe" >/etc/apt/sources.list &&
            echo "deb [arch=amd64] http://archive.ubuntu.com/ubuntu/ jammy-updates main universe" >>/etc/apt/sources.list &&
            echo "deb [arch=amd64] http://archive.ubuntu.com/ubuntu/ jammy-security main universe" >>/etc/apt/sources.list &&
            usermod -o -u 0 -g 0 _apt

    # + '[' amd64 = amd64 ']'
    # + echo 'deb [arch=amd64] http://archive.ubuntu.com/ubuntu/ jammy main universe'
    # + echo 'deb [arch=amd64] http://archive.ubuntu.com/ubuntu/ jammy-updates main universe'
    # + echo 'deb [arch=amd64] http://archive.ubuntu.com/ubuntu/ jammy-security main universe'
    # + usermod -o -u 0 -g 0 _apt

    elif [ "$TARGETARCH" = "arm64" ]; then
        echo "deb [arch=arm64] http://ports.ubuntu.com/ubuntu-ports jammy main universe" >/etc/apt/sources.list &&
            echo "deb [arch=arm64] http://ports.ubuntu.com/ubuntu-ports jammy-updates main universe" >>/etc/apt/sources.list &&
            echo "deb [arch=arm64] http://ports.ubuntu.com/ubuntu-ports jammy-security main universe" >>/etc/apt/sources.list &&
            usermod -o -u 0 -g 0 _apt
    else
        echo "TARGETARCH doesn't match a known arch target"
        exit 1
    fi
}

# /tmp/install.sh reposetup
# /tmp/install.sh depinstall
# /tmp/install.sh download_installer
if [ "$1" = "reposetup" ]; then
    repo_setup
elif [ "$1" = "depinstall" ]; then
    dep_install
elif [ "$1" = "download_installer" ]; then
    download_installer
else
    echo "Unknown function: $1"
    exit 1
fi
