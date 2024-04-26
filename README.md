# GPU Driver Container

[![build status](https://gitlab.com/nvidia/container-images/driver/badges/master/pipeline.svg)](https://gitlab.com/nvidia/container-images/driver/-/commits/master)

The NVIDIA GPU driver container allows the provisioning of the NVIDIA driver through the use of containers.
NVIDIA GPU 驱动程序容器允许通过使用容器来配置 NVIDIA 驱动程序。

## Documentation

[Driver Container documentation](https://docs.nvidia.com/datacenter/cloud-native/driver-containers/overview.html)

## Releases

[NVIDIA GPU Driver at NGC](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/driver)

## Building from Source

```sh
platform=ubuntu22.04 # where ${platform} is one of the supported platforms (e.g. ubuntu22.04)

docker build \
-t mydriver \
--build-arg DRIVER_VERSION="510.85.02" \
--build-arg CUDA_VERSION=11.7.1 \
--build-arg TARGETARCH=amd64 \
${platform}
```

## License

[Apache License 2.0](LICENSE)
[License For Customer Use of NVIDIA Software](https://www.nvidia.com/content/DriverDownload-March2009/licence.php?lang=us)



```bash
$ lspci | grep -i nv
00:09.0 3D controller: NVIDIA Corporation Device 20b7 (rev a1)
$

查询 20b7 https://www.pcilookup.com/

$ dpkg-deb --info nvidia-driver-local-repo-ubuntu2204-550.54.15_1.0-1_amd64.deb
 new Debian package, version 2.0.
 size 393450926 bytes: control archive=2932 bytes.
      70 bytes,     1 lines      conffiles
     414 bytes,    11 lines      control
   10470 bytes,    81 lines      md5sums
     750 bytes,    24 lines   *  postinst             #!/bin/sh
 Package: nvidia-driver-local-repo-ubuntu2204-550.54.15
 Source: nvidia-driver-local-repo
 Version: 1.0-1
 Architecture: amd64
 Maintainer: cudatools <cudatools@nvidia.com>
 Installed-Size: 384853
 Section: multiverse/devel
 Priority: optional
 Description: nvidia-driver-local repository configuration files
  Contains repository configuration for nvidia-driver-local.
  Contains a local repository for nvidia-driver-local.


$ dpkg-deb -c nvidia-driver-local-repo-ubuntu2204-550.54.15_1.0-1_amd64.deb
drwxr-xr-x root/root         0 2024-03-06 06:13 ./
drwxr-xr-x root/root         0 2024-03-06 06:13 ./etc/
drwxr-xr-x root/root         0 2024-03-06 06:13 ./etc/apt/
drwxr-xr-x root/root         0 2024-03-06 06:13 ./etc/apt/sources.list.d/
-rw-r--r-- root/root       137 2024-03-06 06:13 ./etc/apt/sources.list.d/nvidia-driver-local-ubuntu2204-550.54.15.list
drwxr-xr-x root/root         0 2024-03-06 06:13 ./usr/
drwxr-xr-x root/root         0 2024-03-06 06:13 ./usr/share/
drwxr-xr-x root/root         0 2024-03-06 06:13 ./usr/share/doc/
drwxr-xr-x root/root         0 2024-03-06 06:13 ./usr/share/doc/nvidia-driver-local-repo-ubuntu2204-550.54.15/
-rw-r--r-- root/root       153 2024-03-06 06:13 ./usr/share/doc/nvidia-driver-local-repo-ubuntu2204-550.54.15/changelog.Debian.gz
drwxr-xr-x root/root         0 2024-03-06 06:13 ./var/
drwxr-xr-x root/root         0 2024-03-06 06:13 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/
-rw-r--r-- root/root      1660 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/CD0EDF6B.pub
-rw-r--r-- root/root      1572 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/InRelease
-rw-r--r-- root/root      1928 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/Local.md5
-rw-r--r-- root/root       836 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/Local.md5.gpg
-rw-r--r-- root/root    122480 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/Packages
-rw-r--r-- root/root     22106 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/Packages.gz
-rw-r--r-- root/root       690 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/Release
-rw-r--r-- root/root       833 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/Release.gpg
-rw-r--r-- root/root  34560748 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/cuda-compat-12-4_550.54.15-1_amd64.deb
-rw-r--r-- root/root      2546 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/cuda-drivers-550_550.54.15-1_amd64.deb
-rw-r--r-- root/root      3296 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/cuda-drivers-fabricmanager-550_550.54.15-1_amd64.deb
-rw-r--r-- root/root      3256 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/cuda-drivers-fabricmanager_550.54.15-1_amd64.deb
-rw-r--r-- root/root      2506 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/cuda-drivers_550.54.15-1_amd64.deb
-rw-r--r-- root/root   7299486 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/imex_550.54.15-1_amd64.deb
-rw-r--r-- root/root     13008 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/libnvidia-cfg1-530_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root    145406 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/libnvidia-cfg1-550_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root     13000 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/libnvidia-common-530_550.54.15-0ubuntu1_all.deb
-rw-r--r-- root/root     17076 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/libnvidia-common-550_550.54.15-0ubuntu1_all.deb
-rw-r--r-- root/root     13012 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/libnvidia-compute-530_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root     13012 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/libnvidia-compute-530_550.54.15-0ubuntu1_i386.deb
-rw-r--r-- root/root  49492780 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/libnvidia-compute-550_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root  51036032 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/libnvidia-compute-550_550.54.15-0ubuntu1_i386.deb
-rw-r--r-- root/root     13008 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/libnvidia-decode-530_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root     13008 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/libnvidia-decode-530_550.54.15-0ubuntu1_i386.deb
-rw-r--r-- root/root   1782788 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/libnvidia-decode-550_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root   2128968 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/libnvidia-decode-550_550.54.15-0ubuntu1_i386.deb
-rw-r--r-- root/root     13008 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/libnvidia-encode-530_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root     13008 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/libnvidia-encode-530_550.54.15-0ubuntu1_i386.deb
-rw-r--r-- root/root    100060 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/libnvidia-encode-550_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root    107378 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/libnvidia-encode-550_550.54.15-0ubuntu1_i386.deb
-rw-r--r-- root/root     13012 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/libnvidia-extra-530_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root     13012 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/libnvidia-extra-530_550.54.15-0ubuntu1_i386.deb
-rw-r--r-- root/root     71132 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/libnvidia-extra-550_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root     76664 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/libnvidia-extra-550_550.54.15-0ubuntu1_i386.deb
-rw-r--r-- root/root     13008 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/libnvidia-fbc1-530_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root     13008 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/libnvidia-fbc1-530_550.54.15-0ubuntu1_i386.deb
-rw-r--r-- root/root     54948 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/libnvidia-fbc1-550_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root     59676 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/libnvidia-fbc1-550_550.54.15-0ubuntu1_i386.deb
-rw-r--r-- root/root     13000 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/libnvidia-gl-530_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root     13000 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/libnvidia-gl-530_550.54.15-0ubuntu1_i386.deb
-rw-r--r-- root/root 135904134 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/libnvidia-gl-550_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root  17771008 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/libnvidia-gl-550_550.54.15-0ubuntu1_i386.deb
-rw-r--r-- root/root    355554 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/libnvidia-nscq-550_550.54.15-1_amd64.deb
-rw-r--r-- root/root     94546 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/libxnvctrl-dev_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root     21290 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/libxnvctrl0_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root     13020 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-compute-utils-530_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root    117810 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-compute-utils-550_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root     13008 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-dkms-530-open_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root     13004 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-dkms-530_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root     16758 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-dkms-550-open_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root     36242 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-dkms-550_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root     13008 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-driver-530-open_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root     12996 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-driver-530_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root     14442 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-driver-550-open_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root    489370 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-driver-550_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root      1166 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-driver-local-CD0EDF6B-keyring.gpg
-rw-r--r-- root/root   5274080 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-fabricmanager-550_550.54.15-1_amd64.deb
-rw-r--r-- root/root    542790 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-fabricmanager-dev-550_550.54.15-1_amd64.deb
-rw-r--r-- root/root  36837524 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-firmware-550-550.54.15_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root     13016 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-headless-530-open_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root     13012 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-headless-530_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root     13144 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-headless-550-open_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root     13128 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-headless-550_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root     13024 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-headless-no-dkms-530-open_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root     13020 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-headless-no-dkms-530_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root     13264 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-headless-no-dkms-550-open_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root     13248 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-headless-no-dkms-550_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root     13012 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-kernel-common-530_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root    108706 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-kernel-common-550_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root     13028 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-kernel-open-550_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root     13024 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-kernel-source-530-open_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root     13012 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-kernel-source-530_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root   4863968 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-kernel-source-550-open_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root  41067798 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-kernel-source-550_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root     21674 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-modprobe_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root    946506 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-settings_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root     13012 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-utils-530_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root    493662 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-utils-550_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root     13028 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/xserver-xorg-video-nvidia-530_550.54.15-0ubuntu1_amd64.deb
-rw-r--r-- root/root   1534234 2024-03-06 06:12 ./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/xserver-xorg-video-nvidia-550_550.54.15-0ubuntu1_amd64.deb
$


$ dpkg -i nvidia-driver-local-repo-ubuntu2204-550.54.15_1.0-1_amd64.deb
Selecting previously unselected package nvidia-driver-local-repo-ubuntu2204-550.54.15.
(Reading database ... 4393 files and directories currently installed.)
Preparing to unpack nvidia-driver-local-repo-ubuntu2204-550.54.15_1.0-1_amd64.deb ...
Unpacking nvidia-driver-local-repo-ubuntu2204-550.54.15 (1.0-1) ...
Setting up nvidia-driver-local-repo-ubuntu2204-550.54.15 (1.0-1) ...

The public nvidia-driver-local-repo-ubuntu2204-550.54.15 GPG key does not appear to be installed.
To install the key, run this command:
sudo cp /var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-driver-local-CD0EDF6B-keyring.gpg /usr/share/keyrings/

$
$ cat /etc/apt/sources.list.d/nvidia-driver-local-ubuntu2204-550.54.15.list
deb [signed-by=/usr/share/keyrings/nvidia-driver-local-CD0EDF6B-keyring.gpg] file:///var/nvidia-driver-local-repo-ubuntu2204-550.54.15 /
$



./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-driver-530-open_550.54.15-0ubuntu1_amd64.deb
./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-driver-530_550.54.15-0ubuntu1_amd64.deb
./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-driver-550-open_550.54.15-0ubuntu1_amd64.deb
./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-driver-550_550.54.15-0ubuntu1_amd64.deb
./var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-driver-local-CD0EDF6B-keyring.gpg



$ dpkg-deb --info /var/nvidia-driver-local-repo-ubuntu2204-550.54.15/nvidia-driver-550_550.54.15-0ubuntu1_amd64.deb
 new Debian package, version 2.0.
 size 489370 bytes: control archive=4116 bytes.
   28362 bytes,    21 lines      control
    6086 bytes,    69 lines      md5sums
 Package: nvidia-driver-550
 Source: nvidia-graphics-drivers-550
 Version: 550.54.15-0ubuntu1
 Architecture: amd64
 Maintainer: Ubuntu Core Developers <ubuntu-devel-discuss@lists.ubuntu.com>
 Installed-Size: 1711
 Depends:
 	libnvidia-gl-550 (= 550.54.15-0ubuntu1),
	nvidia-dkms-550 (<= 550.54.15-1),
	nvidia-dkms-550 (>= 550.54.15),
	nvidia-kernel-common-550 (<= 550.54.15-1),
	nvidia-kernel-common-550 (>= 550.54.15),
	nvidia-kernel-source-550 (= 550.54.15-0ubuntu1),
	libnvidia-compute-550 (= 550.54.15-0ubuntu1),
	libnvidia-extra-550 (= 550.54.15-0ubuntu1),
	nvidia-compute-utils-550 (= 550.54.15-0ubuntu1),
	libnvidia-decode-550 (= 550.54.15-0ubuntu1),
	libnvidia-encode-550 (= 550.54.15-0ubuntu1),
	nvidia-utils-550 (= 550.54.15-0ubuntu1),
	xserver-xorg-video-nvidia-550 (= 550.54.15-0ubuntu1),
	libnvidia-cfg1-550 (= 550.54.15-0ubuntu1),
	libnvidia-fbc1-550 (= 550.54.15-0ubuntu1)

 Recommends:
 	nvidia-settings,
	nvidia-prime (>= 0.8),
	libnvidia-compute-550:i386 (= 550.54.15-0ubuntu1),
	libnvidia-decode-550:i386 (= 550.54.15-0ubuntu1),
	libnvidia-encode-550:i386 (= 550.54.15-0ubuntu1),
	libnvidia-fbc1-550:i386 (= 550.54.15-0ubuntu1),
	libnvidia-gl-550:i386 (= 550.54.15-0ubuntu1)

 Section: non-free/libs
 Priority: optional
 Homepage: http://www.nvidia.com
 Description: NVIDIA driver metapackage
  This metapackage depends on the NVIDIA binary driver and on all of its libraries,
  to provide hardware acceleration for OpenGL/GLX/EGL/GLES/Vulkan
  applications on either X11 or on Wayland.
  .
  See /usr/share/doc/nvidia-driver-550/README.txt.gz
  for a complete list of supported GPUs and PCI IDs.
 Modaliases: nvidia(pci:v000010DEd00001340sv*sd*bc03sc*i*, pci:v000010DEd00001341sv*sd*bc03sc*i*, pci:v000010DEd00001344sv*sd*bc03sc*i*, pci:v000010DEd00001346sv*sd*bc03sc*i*, pci:v000010DEd00001347sv*sd*bc03sc*i*, pci:v000010DEd00001348sv*sd*bc03sc*i*, pci:v000010DEd00001349sv*sd*bc03sc*i*, pci:v000010DEd0000134Bsv*sd*bc03sc*i*, pci:v000010DEd0000134Dsv*sd*bc03sc*i*, pci:v000010DEd0000134Esv*sd*bc03sc*i*, pci:v000010DEd0000134Fsv*sd*bc03sc*i*, pci:v000010DEd0000137Asv*sd*bc03sc*i*, pci:v000010DEd0000137Bsv*sd*bc03sc*i*, pci:v000010DEd00001380sv*sd*bc03sc*i*, pci:v000010DEd00001381sv*sd*bc03sc*i*, pci:v000010DEd00001382sv*sd*bc03sc*i*, pci:v000010DEd00001390sv*sd*bc03sc*i*, pci:v000010DEd00001391sv*sd*bc03sc*i*, pci:v000010DEd00001392sv*sd*bc03sc*i*, pci:v000010DEd00001393sv*sd*bc03sc*i*, pci:v000010DEd00001398sv*sd*bc03sc*i*, pci:v000010DEd00001399sv*sd*bc03sc*i*, pci:v000010DEd0000139Asv*sd*bc03sc*i*, pci:v000010DEd0000139Bsv*sd*bc03sc*i*, pci:v000010DEd0000139Csv*sd*bc03sc*i*, pci:v000010DEd0000139Dsv*sd*bc03sc*i*, pci:v000010DEd000013B0sv*sd*bc03sc*i*, pci:v000010DEd000013B1sv*sd*bc03sc*i*, pci:v000010DEd000013B2sv*sd*bc03sc*i*, pci:v000010DEd000013B3sv*sd*bc03sc*i*, pci:v000010DEd000013B4sv*sd*bc03sc*i*, pci:v000010DEd000013B6sv*sd*bc03sc*i*, pci:v000010DEd000013B9sv*sd*bc03sc*i*, pci:v000010DEd000013BAsv*sd*bc03sc*i*, pci:v000010DEd000013BBsv*sd*bc03sc*i*, pci:v000010DEd000013BCsv*sd*bc03sc*i*, pci:v000010DEd000013C0sv*sd*bc03sc*i*, pci:v000010DEd000013C2sv*sd*bc03sc*i*, pci:v000010DEd000013D7sv*sd*bc03sc*i*, pci:v000010DEd000013D8sv*sd*bc03sc*i*, pci:v000010DEd000013D9sv*sd*bc03sc*i*, pci:v000010DEd000013DAsv*sd*bc03sc*i*, pci:v000010DEd000013F0sv*sd*bc03sc*i*, pci:v000010DEd000013F1sv*sd*bc03sc*i*, pci:v000010DEd000013F2sv*sd*bc03sc*i*, pci:v000010DEd000013F3sv*sd*bc03sc*i*, pci:v000010DEd000013F8sv*sd*bc03sc*i*, pci:v000010DEd000013F9sv*sd*bc03sc*i*, pci:v000010DEd000013FAsv*sd*bc03sc*i*, pci:v000010DEd000013FBsv*sd*bc03sc*i*, pci:v000010DEd00001401sv*sd*bc03sc*i*, pci:v000010DEd00001402sv*sd*bc03sc*i*, pci:v000010DEd00001406sv*sd*bc03sc*i*, pci:v000010DEd00001407sv*sd*bc03sc*i*, pci:v000010DEd00001427sv*sd*bc03sc*i*, pci:v000010DEd00001430sv*sd*bc03sc*i*, pci:v000010DEd00001431sv*sd*bc03sc*i*, pci:v000010DEd00001436sv*sd*bc03sc*i*, pci:v000010DEd000015F0sv*sd*bc03sc*i*, pci:v000010DEd000015F7sv*sd*bc03sc*i*, pci:v000010DEd000015F8sv*sd*bc03sc*i*, pci:v000010DEd000015F9sv*sd*bc03sc*i*, pci:v000010DEd00001617sv*sd*bc03sc*i*, pci:v000010DEd00001618sv*sd*bc03sc*i*, pci:v000010DEd00001619sv*sd*bc03sc*i*, pci:v000010DEd0000161Asv*sd*bc03sc*i*, pci:v000010DEd00001667sv*sd*bc03sc*i*, pci:v000010DEd0000174Dsv*sd*bc03sc*i*, pci:v000010DEd0000174Esv*sd*bc03sc*i*, pci:v000010DEd0000179Csv*sd*bc03sc*i*, pci:v000010DEd000017C2sv*sd*bc03sc*i*, pci:v000010DEd000017C8sv*sd*bc03sc*i*, pci:v000010DEd000017F0sv*sd*bc03sc*i*, pci:v000010DEd000017F1sv*sd*bc03sc*i*, pci:v000010DEd000017FDsv*sd*bc03sc*i*, pci:v000010DEd00001B00sv*sd*bc03sc*i*, pci:v000010DEd00001B02sv*sd*bc03sc*i*, pci:v000010DEd00001B06sv*sd*bc03sc*i*, pci:v000010DEd00001B30sv*sd*bc03sc*i*, pci:v000010DEd00001B38sv*sd*bc03sc*i*, pci:v000010DEd00001B80sv*sd*bc03sc*i*, pci:v000010DEd00001B81sv*sd*bc03sc*i*, pci:v000010DEd00001B82sv*sd*bc03sc*i*, pci:v000010DEd00001B83sv*sd*bc03sc*i*, pci:v000010DEd00001B84sv*sd*bc03sc*i*, pci:v000010DEd00001B87sv*sd*bc03sc*i*, pci:v000010DEd00001BA0sv*sd*bc03sc*i*, pci:v000010DEd00001BA1sv*sd*bc03sc*i*, pci:v000010DEd00001BA2sv*sd*bc03sc*i*, pci:v000010DEd00001BB0sv*sd*bc03sc*i*, pci:v000010DEd00001BB1sv*sd*bc03sc*i*, pci:v000010DEd00001BB4sv*sd*bc03sc*i*, pci:v000010DEd00001BB5sv*sd*bc03sc*i*, pci:v000010DEd00001BB6sv*sd*bc03sc*i*, pci:v000010DEd00001BB7sv*sd*bc03sc*i*, pci:v000010DEd00001BB8sv*sd*bc03sc*i*, pci:v000010DEd00001BB9sv*sd*bc03sc*i*, pci:v000010DEd00001BBBsv*sd*bc03sc*i*, pci:v000010DEd00001BC7sv*sd*bc03sc*i*, pci:v000010DEd00001BE0sv*sd*bc03sc*i*, pci:v000010DEd00001BE1sv*sd*bc03sc*i*, pci:v000010DEd00001C02sv*sd*bc03sc*i*, pci:v000010DEd00001C03sv*sd*bc03sc*i*, pci:v000010DEd00001C04sv*sd*bc03sc*i*, pci:v000010DEd00001C06sv*sd*bc03sc*i*, pci:v000010DEd00001C07sv*sd*bc03sc*i*, pci:v000010DEd00001C09sv*sd*bc03sc*i*, pci:v000010DEd00001C20sv*sd*bc03sc*i*, pci:v000010DEd00001C21sv*sd*bc03sc*i*, pci:v000010DEd00001C22sv*sd*bc03sc*i*, pci:v000010DEd00001C23sv*sd*bc03sc*i*, pci:v000010DEd00001C30sv*sd*bc03sc*i*, pci:v000010DEd00001C31sv*sd*bc03sc*i*, pci:v000010DEd00001C60sv*sd*bc03sc*i*, pci:v000010DEd00001C61sv*sd*bc03sc*i*, pci:v000010DEd00001C62sv*sd*bc03sc*i*, pci:v000010DEd00001C81sv*sd*bc03sc*i*, pci:v000010DEd00001C82sv*sd*bc03sc*i*, pci:v000010DEd00001C83sv*sd*bc03sc*i*, pci:v000010DEd00001C8Csv*sd*bc03sc*i*, pci:v000010DEd00001C8Dsv*sd*bc03sc*i*, pci:v000010DEd00001C8Fsv*sd*bc03sc*i*, pci:v000010DEd00001C90sv*sd*bc03sc*i*, pci:v000010DEd00001C91sv*sd*bc03sc*i*, pci:v000010DEd00001C92sv*sd*bc03sc*i*, pci:v000010DEd00001C94sv*sd*bc03sc*i*, pci:v000010DEd00001C96sv*sd*bc03sc*i*, pci:v000010DEd00001CB1sv*sd*bc03sc*i*, pci:v000010DEd00001CB2sv*sd*bc03sc*i*, pci:v000010DEd00001CB3sv*sd*bc03sc*i*, pci:v000010DEd00001CB6sv*sd*bc03sc*i*, pci:v000010DEd00001CBAsv*sd*bc03sc*i*, pci:v000010DEd00001CBBsv*sd*bc03sc*i*, pci:v000010DEd00001CBCsv*sd*bc03sc*i*, pci:v000010DEd00001CBDsv*sd*bc03sc*i*, pci:v000010DEd00001CFAsv*sd*bc03sc*i*, pci:v000010DEd00001CFBsv*sd*bc03sc*i*, pci:v000010DEd00001D01sv*sd*bc03sc*i*, pci:v000010DEd00001D02sv*sd*bc03sc*i*, pci:v000010DEd00001D10sv*sd*bc03sc*i*, pci:v000010DEd00001D11sv*sd*bc03sc*i*, pci:v000010DEd00001D12sv*sd*bc03sc*i*, pci:v000010DEd00001D13sv*sd*bc03sc*i*, pci:v000010DEd00001D16sv*sd*bc03sc*i*, pci:v000010DEd00001D33sv*sd*bc03sc*i*, pci:v000010DEd00001D34sv*sd*bc03sc*i*, pci:v000010DEd00001D52sv*sd*bc03sc*i*, pci:v000010DEd00001D81sv*sd*bc03sc*i*, pci:v000010DEd00001DB1sv*sd*bc03sc*i*, pci:v000010DEd00001DB3sv*sd*bc03sc*i*, pci:v000010DEd00001DB4sv*sd*bc03sc*i*, pci:v000010DEd00001DB5sv*sd*bc03sc*i*, pci:v000010DEd00001DB6sv*sd*bc03sc*i*, pci:v000010DEd00001DB7sv*sd*bc03sc*i*, pci:v000010DEd00001DB8sv*sd*bc03sc*i*, pci:v000010DEd00001DBAsv*sd*bc03sc*i*, pci:v000010DEd00001DF0sv*sd*bc03sc*i*, pci:v000010DEd00001DF2sv*sd*bc03sc*i*, pci:v000010DEd00001DF6sv*sd*bc03sc*i*, pci:v000010DEd00001E02sv*sd*bc03sc*i*, pci:v000010DEd00001E04sv*sd*bc03sc*i*, pci:v000010DEd00001E07sv*sd*bc03sc*i*, pci:v000010DEd00001E09sv*sd*bc03sc*i*, pci:v000010DEd00001E30sv*sd*bc03sc*i*, pci:v000010DEd00001E36sv*sd*bc03sc*i*, pci:v000010DEd00001E78sv*sd*bc03sc*i*, pci:v000010DEd00001E81sv*sd*bc03sc*i*, pci:v000010DEd00001E82sv*sd*bc03sc*i*, pci:v000010DEd00001E84sv*sd*bc03sc*i*, pci:v000010DEd00001E87sv*sd*bc03sc*i*, pci:v000010DEd00001E89sv*sd*bc03sc*i*, pci:v000010DEd00001E90sv*sd*bc03sc*i*, pci:v000010DEd00001E91sv*sd*bc03sc*i*, pci:v000010DEd00001E93sv*sd*bc03sc*i*, pci:v000010DEd00001EB0sv*sd*bc03sc*i*, pci:v000010DEd00001EB1sv*sd*bc03sc*i*, pci:v000010DEd00001EB5sv*sd*bc03sc*i*, pci:v000010DEd00001EB6sv*sd*bc03sc*i*, pci:v000010DEd00001EC2sv*sd*bc03sc*i*, pci:v000010DEd00001EC7sv*sd*bc03sc*i*, pci:v000010DEd00001ED0sv*sd*bc03sc*i*, pci:v000010DEd00001ED1sv*sd*bc03sc*i*, pci:v000010DEd00001ED3sv*sd*bc03sc*i*, pci:v000010DEd00001EF5sv*sd*bc03sc*i*, pci:v000010DEd00001F02sv*sd*bc03sc*i*, pci:v000010DEd00001F03sv*sd*bc03sc*i*, pci:v000010DEd00001F06sv*sd*bc03sc*i*, pci:v000010DEd00001F07sv*sd*bc03sc*i*, pci:v000010DEd00001F08sv*sd*bc03sc*i*, pci:v000010DEd00001F0Asv*sd*bc03sc*i*, pci:v000010DEd00001F0Bsv*sd*bc03sc*i*, pci:v000010DEd00001F10sv*sd*bc03sc*i*, pci:v000010DEd00001F11sv*sd*bc03sc*i*, pci:v000010DEd00001F12sv*sd*bc03sc*i*, pci:v000010DEd00001F14sv*sd*bc03sc*i*, pci:v000010DEd00001F15sv*sd*bc03sc*i*, pci:v000010DEd00001F36sv*sd*bc03sc*i*, pci:v000010DEd00001F42sv*sd*bc03sc*i*, pci:v000010DEd00001F47sv*sd*bc03sc*i*, pci:v000010DEd00001F50sv*sd*bc03sc*i*, pci:v000010DEd00001F51sv*sd*bc03sc*i*, pci:v000010DEd00001F54sv*sd*bc03sc*i*, pci:v000010DEd00001F55sv*sd*bc03sc*i*, pci:v000010DEd00001F76sv*sd*bc03sc*i*, pci:v000010DEd00001F82sv*sd*bc03sc*i*, pci:v000010DEd00001F83sv*sd*bc03sc*i*, pci:v000010DEd00001F91sv*sd*bc03sc*i*, pci:v000010DEd00001F95sv*sd*bc03sc*i*, pci:v000010DEd00001F96sv*sd*bc03sc*i*, pci:v000010DEd00001F97sv*sd*bc03sc*i*, pci:v000010DEd00001F98sv*sd*bc03sc*i*, pci:v000010DEd00001F99sv*sd*bc03sc*i*, pci:v000010DEd00001F9Csv*sd*bc03sc*i*, pci:v000010DEd00001F9Dsv*sd*bc03sc*i*, pci:v000010DEd00001F9Fsv*sd*bc03sc*i*, pci:v000010DEd00001FA0sv*sd*bc03sc*i*, pci:v000010DEd00001FB0sv*sd*bc03sc*i*, pci:v000010DEd00001FB1sv*sd*bc03sc*i*, pci:v000010DEd00001FB2sv*sd*bc03sc*i*, pci:v000010DEd00001FB6sv*sd*bc03sc*i*, pci:v000010DEd00001FB7sv*sd*bc03sc*i*, pci:v000010DEd00001FB8sv*sd*bc03sc*i*, pci:v000010DEd00001FB9sv*sd*bc03sc*i*, pci:v000010DEd00001FBAsv*sd*bc03sc*i*, pci:v000010DEd00001FBBsv*sd*bc03sc*i*, pci:v000010DEd00001FBCsv*sd*bc03sc*i*, pci:v000010DEd00001FDDsv*sd*bc03sc*i*, pci:v000010DEd00001FF0sv*sd*bc03sc*i*, pci:v000010DEd00001FF2sv*sd*bc03sc*i*, pci:v000010DEd00001FF9sv*sd*bc03sc*i*, pci:v000010DEd000020B0sv*sd*bc03sc*i*, pci:v000010DEd000020B2sv*sd*bc03sc*i*, pci:v000010DEd000020B3sv*sd*bc03sc*i*, pci:v000010DEd000020B5sv*sd*bc03sc*i*, pci:v000010DEd000020B6sv*sd*bc03sc*i*, pci:v000010DEd000020B7sv*sd*bc03sc*i*, pci:v000010DEd000020BDsv*sd*bc03sc*i*, pci:v000010DEd000020F1sv*sd*bc03sc*i*, pci:v000010DEd000020F3sv*sd*bc03sc*i*, pci:v000010DEd000020F5sv*sd*bc03sc*i*, pci:v000010DEd000020F6sv*sd*bc03sc*i*, pci:v000010DEd000020FDsv*sd*bc03sc*i*, pci:v000010DEd00002182sv*sd*bc03sc*i*, pci:v000010DEd00002184sv*sd*bc03sc*i*, pci:v000010DEd00002187sv*sd*bc03sc*i*, pci:v000010DEd00002188sv*sd*bc03sc*i*, pci:v000010DEd00002189sv*sd*bc03sc*i*, pci:v000010DEd00002191sv*sd*bc03sc*i*, pci:v000010DEd00002192sv*sd*bc03sc*i*, pci:v000010DEd000021C4sv*sd*bc03sc*i*, pci:v000010DEd000021D1sv*sd*bc03sc*i*, pci:v000010DEd00002203sv*sd*bc03sc*i*, pci:v000010DEd00002204sv*sd*bc03sc*i*, pci:v000010DEd00002206sv*sd*bc03sc*i*, pci:v000010DEd00002207sv*sd*bc03sc*i*, pci:v000010DEd00002208sv*sd*bc03sc*i*, pci:v000010DEd0000220Asv*sd*bc03sc*i*, pci:v000010DEd0000220Dsv*sd*bc03sc*i*, pci:v000010DEd00002216sv*sd*bc03sc*i*, pci:v000010DEd00002230sv*sd*bc03sc*i*, pci:v000010DEd00002231sv*sd*bc03sc*i*, pci:v000010DEd00002232sv*sd*bc03sc*i*, pci:v000010DEd00002233sv*sd*bc03sc*i*, pci:v000010DEd00002235sv*sd*bc03sc*i*, pci:v000010DEd00002236sv*sd*bc03sc*i*, pci:v000010DEd00002237sv*sd*bc03sc*i*, pci:v000010DEd00002238sv*sd*bc03sc*i*, pci:v000010DEd00002321sv*sd*bc03sc*i*, pci:v000010DEd00002322sv*sd*bc03sc*i*, pci:v000010DEd00002324sv*sd*bc03sc*i*, pci:v000010DEd00002329sv*sd*bc03sc*i*, pci:v000010DEd00002330sv*sd*bc03sc*i*, pci:v000010DEd00002331sv*sd*bc03sc*i*, pci:v000010DEd00002339sv*sd*bc03sc*i*, pci:v000010DEd0000233Asv*sd*bc03sc*i*, pci:v000010DEd00002342sv*sd*bc03sc*i*, pci:v000010DEd00002414sv*sd*bc03sc*i*, pci:v000010DEd00002420sv*sd*bc03sc*i*, pci:v000010DEd00002438sv*sd*bc03sc*i*, pci:v000010DEd00002460sv*sd*bc03sc*i*, pci:v000010DEd00002482sv*sd*bc03sc*i*, pci:v000010DEd00002484sv*sd*bc03sc*i*, pci:v000010DEd00002486sv*sd*bc03sc*i*, pci:v000010DEd00002487sv*sd*bc03sc*i*, pci:v000010DEd00002488sv*sd*bc03sc*i*, pci:v000010DEd00002489sv*sd*bc03sc*i*, pci:v000010DEd0000248Asv*sd*bc03sc*i*, pci:v000010DEd0000249Csv*sd*bc03sc*i*, pci:v000010DEd0000249Dsv*sd*bc03sc*i*, pci:v000010DEd000024A0sv*sd*bc03sc*i*, pci:v000010DEd000024B0sv*sd*bc03sc*i*, pci:v000010DEd000024B1sv*sd*bc03sc*i*, pci:v000010DEd000024B6sv*sd*bc03sc*i*, pci:v000010DEd000024B7sv*sd*bc03sc*i*, pci:v000010DEd000024B8sv*sd*bc03sc*i*, pci:v000010DEd000024B9sv*sd*bc03sc*i*, pci:v000010DEd000024BAsv*sd*bc03sc*i*, pci:v000010DEd000024BBsv*sd*bc03sc*i*, pci:v000010DEd000024C7sv*sd*bc03sc*i*, pci:v000010DEd000024C9sv*sd*bc03sc*i*, pci:v000010DEd000024DCsv*sd*bc03sc*i*, pci:v000010DEd000024DDsv*sd*bc03sc*i*, pci:v000010DEd000024E0sv*sd*bc03sc*i*, pci:v000010DEd000024FAsv*sd*bc03sc*i*, pci:v000010DEd00002503sv*sd*bc03sc*i*, pci:v000010DEd00002504sv*sd*bc03sc*i*, pci:v000010DEd00002507sv*sd*bc03sc*i*, pci:v000010DEd00002508sv*sd*bc03sc*i*, pci:v000010DEd00002520sv*sd*bc03sc*i*, pci:v000010DEd00002521sv*sd*bc03sc*i*, pci:v000010DEd00002523sv*sd*bc03sc*i*, pci:v000010DEd00002531sv*sd*bc03sc*i*, pci:v000010DEd00002544sv*sd*bc03sc*i*, pci:v000010DEd00002560sv*sd*bc03sc*i*, pci:v000010DEd00002563sv*sd*bc03sc*i*, pci:v000010DEd00002571sv*sd*bc03sc*i*, pci:v000010DEd00002582sv*sd*bc03sc*i*, pci:v000010DEd00002584sv*sd*bc03sc*i*, pci:v000010DEd000025A0sv*sd*bc03sc*i*, pci:v000010DEd000025A2sv*sd*bc03sc*i*, pci:v000010DEd000025A5sv*sd*bc03sc*i*, pci:v000010DEd000025A6sv*sd*bc03sc*i*, pci:v000010DEd000025A7sv*sd*bc03sc*i*, pci:v000010DEd000025A9sv*sd*bc03sc*i*, pci:v000010DEd000025AAsv*sd*bc03sc*i*, pci:v000010DEd000025ABsv*sd*bc03sc*i*, pci:v000010DEd000025ACsv*sd*bc03sc*i*, pci:v000010DEd000025ADsv*sd*bc03sc*i*, pci:v000010DEd000025B6sv*sd*bc03sc*i*, pci:v000010DEd000025B8sv*sd*bc03sc*i*, pci:v000010DEd000025B9sv*sd*bc03sc*i*, pci:v000010DEd000025BAsv*sd*bc03sc*i*, pci:v000010DEd000025BBsv*sd*bc03sc*i*, pci:v000010DEd000025BCsv*sd*bc03sc*i*, pci:v000010DEd000025BDsv*sd*bc03sc*i*, pci:v000010DEd000025E0sv*sd*bc03sc*i*, pci:v000010DEd000025E2sv*sd*bc03sc*i*, pci:v000010DEd000025E5sv*sd*bc03sc*i*, pci:v000010DEd000025ECsv*sd*bc03sc*i*, pci:v000010DEd000025EDsv*sd*bc03sc*i*, pci:v000010DEd000025F9sv*sd*bc03sc*i*, pci:v000010DEd000025FAsv*sd*bc03sc*i*, pci:v000010DEd000025FBsv*sd*bc03sc*i*, pci:v000010DEd00002684sv*sd*bc03sc*i*, pci:v000010DEd00002685sv*sd*bc03sc*i*, pci:v000010DEd000026B1sv*sd*bc03sc*i*, pci:v000010DEd000026B2sv*sd*bc03sc*i*, pci:v000010DEd000026B3sv*sd*bc03sc*i*, pci:v000010DEd000026B5sv*sd*bc03sc*i*, pci:v000010DEd000026B9sv*sd*bc03sc*i*, pci:v000010DEd000026BAsv*sd*bc03sc*i*, pci:v000010DEd00002702sv*sd*bc03sc*i*, pci:v000010DEd00002704sv*sd*bc03sc*i*, pci:v000010DEd00002705sv*sd*bc03sc*i*, pci:v000010DEd00002717sv*sd*bc03sc*i*, pci:v000010DEd00002730sv*sd*bc03sc*i*, pci:v000010DEd00002757sv*sd*bc03sc*i*, pci:v000010DEd00002770sv*sd*bc03sc*i*, pci:v000010DEd00002782sv*sd*bc03sc*i*, pci:v000010DEd00002783sv*sd*bc03sc*i*, pci:v000010DEd00002786sv*sd*bc03sc*i*, pci:v000010DEd000027A0sv*sd*bc03sc*i*, pci:v000010DEd000027B0sv*sd*bc03sc*i*, pci:v000010DEd000027B1sv*sd*bc03sc*i*, pci:v000010DEd000027B2sv*sd*bc03sc*i*, pci:v000010DEd000027B6sv*sd*bc03sc*i*, pci:v000010DEd000027B8sv*sd*bc03sc*i*, pci:v000010DEd000027BAsv*sd*bc03sc*i*, pci:v000010DEd000027BBsv*sd*bc03sc*i*, pci:v000010DEd000027E0sv*sd*bc03sc*i*, pci:v000010DEd000027FBsv*sd*bc03sc*i*, pci:v000010DEd00002803sv*sd*bc03sc*i*, pci:v000010DEd00002805sv*sd*bc03sc*i*, pci:v000010DEd00002820sv*sd*bc03sc*i*, pci:v000010DEd00002838sv*sd*bc03sc*i*, pci:v000010DEd00002860sv*sd*bc03sc*i*, pci:v000010DEd00002882sv*sd*bc03sc*i*, pci:v000010DEd000028A0sv*sd*bc03sc*i*, pci:v000010DEd000028A1sv*sd*bc03sc*i*, pci:v000010DEd000028B0sv*sd*bc03sc*i*, pci:v000010DEd000028B8sv*sd*bc03sc*i*, pci:v000010DEd000028B9sv*sd*bc03sc*i*, pci:v000010DEd000028BAsv*sd*bc03sc*i*, pci:v000010DEd000028BBsv*sd*bc03sc*i*, pci:v000010DEd000028E0sv*sd*bc03sc*i*, pci:v000010DEd000028E1sv*sd*bc03sc*i*, pci:v000010DEd000028F8sv*sd*bc03sc*i*, pci:v000010DEd00001EB8sv*sd*bc03sc*i*, pci:v000010DEd000025BCsv*sd*bc03sc*i*, pci:v000010DEd000025BDsv*sd*bc03sc*i*, pci:v000010DEd000025ECsv*sd*bc03sc*i*, pci:v000010DEd00002717sv*sd*bc03sc*i*, pci:v000010DEd00002730sv*sd*bc03sc*i*, pci:v000010DEd000027B7sv*sd*bc03sc*i*, pci:v000010DEd000027BAsv*sd*bc03sc*i*, pci:v000010DEd000027BBsv*sd*bc03sc*i*, pci:v000010DEd00002838sv*sd*bc03sc*i*, pci:v000010DEd00002860sv*sd*bc03sc*i*, pci:v000010DEd000028B8sv*sd*bc03sc*i*, pci:v000010DEd000028E1sv*sd*bc03sc*i*, pci:v000010DEd000028E0sv*sd*bc03sc*i*)

 Pmaliases: nvidia(pci:v000010DEd00001E02sv0000*sd0000*bc03sc*i*, pci:v000010DEd00001E04sv0000*sd0000*bc03sc*i*, pci:v000010DEd00001E07sv0000*sd0000*bc03sc*i*, pci:v000010DEd00001E30sv000010DEsd0000129Ebc03sc*i*, pci:v000010DEd00001E36sv0000*sd0000*bc03sc*i*, pci:v000010DEd00001E78sv000010DEsd000013D9bc03sc*i*, pci:v000010DEd00001E81sv0000*sd0000*bc03sc*i*, pci:v000010DEd00001E82sv0000*sd0000*bc03sc*i*, pci:v000010DEd00001E84sv0000*sd0000*bc03sc*i*, pci:v000010DEd00001E87sv0000*sd0000*bc03sc*i*, pci:v000010DEd00001E89sv0000*sd0000*bc03sc*i*, pci:v000010DEd00001E90sv00001D05sd00001069bc03sc*i*, pci:v000010DEd00001E91sv00008086sd00003012bc03sc*i*, pci:v000010DEd00001E93sv00001D05sd00001089bc03sc*i*, pci:v000010DEd00001EB0sv0000*sd0000*bc03sc*i*, pci:v000010DEd00001EB1sv0000*sd0000*bc03sc*i*, pci:v000010DEd00001EB5sv00001A58sd0000200Abc03sc*i*, pci:v000010DEd00001EB6sv000017AAsd000022BAbc03sc*i*, pci:v000010DEd00001EC2sv0000*sd0000*bc03sc*i*, pci:v000010DEd00001EC7sv0000*sd0000*bc03sc*i*, pci:v000010DEd00001ED0sv000017AAsd00003FFEbc03sc*i*, pci:v000010DEd00001ED1sv000017AAsd00003FD0bc03sc*i*, pci:v000010DEd00001ED3sv000017AAsd00003FD0bc03sc*i*, pci:v000010DEd00001EF5sv0000*sd0000*bc03sc*i*, pci:v000010DEd00001F02sv0000*sd0000*bc03sc*i*, pci:v000010DEd00001F03sv0000*sd0000*bc03sc*i*, pci:v000010DEd00001F06sv0000*sd0000*bc03sc*i*, pci:v000010DEd00001F07sv0000*sd0000*bc03sc*i*, pci:v000010DEd00001F08sv0000*sd0000*bc03sc*i*, pci:v000010DEd00001F0Asv0000*sd0000*bc03sc*i*, pci:v000010DEd00001F10sv00008086sd00002087bc03sc*i*, pci:v000010DEd00001F11sv0000*sd0000*bc03sc*i*, pci:v000010DEd00001F12sv000017AAsd00003803bc03sc*i*, pci:v000010DEd00001F14sv00001A58sd00003002bc03sc*i*, pci:v000010DEd00001F15sv0000*sd0000*bc03sc*i*, pci:v000010DEd00001F36sv00001414sd00000032bc03sc*i*, pci:v000010DEd00001F42sv0000*sd0000*bc03sc*i*, pci:v000010DEd00001F47sv0000*sd0000*bc03sc*i*, pci:v000010DEd00001F50sv000017AAsd00003FFEbc03sc*i*, pci:v000010DEd00001F51sv0000*sd0000*bc03sc*i*, pci:v000010DEd00001F54sv000017AAsd00003FD0bc03sc*i*, pci:v000010DEd00001F55sv0000*sd0000*bc03sc*i*, pci:v000010DEd00001F76sv0000102Bsd00002900bc03sc*i*, pci:v000010DEd00001F82sv0000*sd0000*bc03sc*i*, pci:v000010DEd00001F83sv0000*sd0000*bc03sc*i*, pci:v000010DEd00001F91sv00001A58sd00001001bc03sc*i*, pci:v000010DEd00001F95sv00001E83sd00003E30bc03sc*i*, pci:v000010DEd00001F96sv00001462sd00001297bc03sc*i*, pci:v000010DEd00001F97sv0000*sd0000*bc03sc*i*, pci:v000010DEd00001F98sv0000*sd0000*bc03sc*i*, pci:v000010DEd00001F99sv00001E83sd00003E30bc03sc*i*, pci:v000010DEd00001F9Csv0000*sd0000*bc03sc*i*, pci:v000010DEd00001F9Dsv00001462sd0000132Ebc03sc*i*, pci:v000010DEd00001F9Fsv0000*sd0000*bc03sc*i*, pci:v000010DEd00001FA0sv0000*sd0000*bc03sc*i*, pci:v000010DEd00001FB0sv000017AAsd000012DBbc03sc*i*, pci:v000010DEd00001FB1sv000017AAsd00001488bc03sc*i*, pci:v000010DEd00001FB2sv000017AAsd00001489bc03sc*i*, pci:v000010DEd00001FB6sv0000*sd0000*bc03sc*i*, pci:v000010DEd00001FB7sv0000*sd0000*bc03sc*i*, pci:v000010DEd00001FB8sv000017AAsd000022C1bc03sc*i*, pci:v000010DEd00001FB9sv000017AAsd000022C1bc03sc*i*, pci:v000010DEd00001FBAsv0000*sd0000*bc03sc*i*, pci:v000010DEd00001FBBsv0000*sd0000*bc03sc*i*, pci:v000010DEd00001FBCsv0000*sd0000*bc03sc*i*, pci:v000010DEd00001FDDsv0000*sd0000*bc03sc*i*, pci:v000010DEd00001FF0sv000017AAsd00001612bc03sc*i*, pci:v000010DEd00001FF2sv000017AAsd000018FFbc03sc*i*, pci:v000010DEd00001FF9sv0000*sd0000*bc03sc*i*, pci:v000010DEd000020B0sv000010DEsd00001450bc03sc*i*, pci:v000010DEd000020B2sv000010DEsd00001625bc03sc*i*, pci:v000010DEd000020B3sv000010DEsd000014A8bc03sc*i*, pci:v000010DEd000020B5sv000010DEsd00001642bc03sc*i*, pci:v000010DEd000020B6sv000010DEsd00001492bc03sc*i*, pci:v000010DEd000020B7sv000010DEsd00001852bc03sc*i*, pci:v000010DEd000020BDsv000010DEsd000017F4bc03sc*i*, pci:v000010DEd000020F1sv000010DEsd0000145Fbc03sc*i*, pci:v000010DEd000020F3sv000010DEsd000017A2bc03sc*i*, pci:v000010DEd000020F5sv000010DEsd0000179Abc03sc*i*, pci:v000010DEd000020F6sv000017AAsd0000180Abc03sc*i*, pci:v000010DEd000020FDsv000010DEsd000017F8bc03sc*i*, pci:v000010DEd00002182sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002184sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002187sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002188sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002191sv000017AAsd0000381Ebc03sc*i*, pci:v000010DEd00002192sv0000*sd0000*bc03sc*i*, pci:v000010DEd000021C4sv0000*sd0000*bc03sc*i*, pci:v000010DEd000021D1sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002203sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002204sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002206sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002207sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002208sv0000*sd0000*bc03sc*i*, pci:v000010DEd0000220Asv0000*sd0000*bc03sc*i*, pci:v000010DEd0000220Dsv0000*sd0000*bc03sc*i*, pci:v000010DEd00002216sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002230sv000017AAsd00001459bc03sc*i*, pci:v000010DEd00002231sv000017AAsd0000147Ebc03sc*i*, pci:v000010DEd00002232sv000017AAsd0000163Cbc03sc*i*, pci:v000010DEd00002233sv000017AAsd0000165Abc03sc*i*, pci:v000010DEd00002235sv000010DEsd0000145Abc03sc*i*, pci:v000010DEd00002236sv000010DEsd00001482bc03sc*i*, pci:v000010DEd00002237sv000010DEsd0000152Fbc03sc*i*, pci:v000010DEd00002238sv000010DEsd00001677bc03sc*i*, pci:v000010DEd00002321sv000010DEsd00001839bc03sc*i*, pci:v000010DEd00002322sv000010DEsd000017A4bc03sc*i*, pci:v000010DEd00002324sv000010DEsd000017A8bc03sc*i*, pci:v000010DEd00002329sv000010DEsd0000198Cbc03sc*i*, pci:v000010DEd00002330sv000010DEsd000016C1bc03sc*i*, pci:v000010DEd00002331sv000010DEsd00001626bc03sc*i*, pci:v000010DEd00002339sv000010DEsd000017FCbc03sc*i*, pci:v000010DEd0000233Asv000010DEsd0000183Abc03sc*i*, pci:v000010DEd00002342sv000010DEsd00001809bc03sc*i*, pci:v000010DEd00002414sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002420sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002438sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002460sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002482sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002484sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002486sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002487sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002488sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002489sv0000*sd0000*bc03sc*i*, pci:v000010DEd0000248Asv0000*sd0000*bc03sc*i*, pci:v000010DEd0000249Csv00001D05sd00001194bc03sc*i*, pci:v000010DEd0000249Dsv0000*sd0000*bc03sc*i*, pci:v000010DEd000024A0sv00001D05sd00001192bc03sc*i*, pci:v000010DEd000024B0sv000017AAsd000014ADbc03sc*i*, pci:v000010DEd000024B1sv000010DEsd00001658bc03sc*i*, pci:v000010DEd000024B6sv0000*sd0000*bc03sc*i*, pci:v000010DEd000024B7sv0000*sd0000*bc03sc*i*, pci:v000010DEd000024B8sv0000*sd0000*bc03sc*i*, pci:v000010DEd000024B9sv0000*sd0000*bc03sc*i*, pci:v000010DEd000024BAsv0000*sd0000*bc03sc*i*, pci:v000010DEd000024BBsv0000*sd0000*bc03sc*i*, pci:v000010DEd000024C7sv0000*sd0000*bc03sc*i*, pci:v000010DEd000024C9sv0000*sd0000*bc03sc*i*, pci:v000010DEd000024DCsv0000*sd0000*bc03sc*i*, pci:v000010DEd000024DDsv0000*sd0000*bc03sc*i*, pci:v000010DEd000024E0sv0000*sd0000*bc03sc*i*, pci:v000010DEd000024FAsv0000*sd0000*bc03sc*i*, pci:v000010DEd00002503sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002504sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002507sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002508sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002520sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002521sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002523sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002531sv000017AAsd0000151Dbc03sc*i*, pci:v000010DEd00002544sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002560sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002563sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002571sv000017AAsd00001611bc03sc*i*, pci:v000010DEd00002582sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002584sv0000*sd0000*bc03sc*i*, pci:v000010DEd000025A0sv00001D05sd00001196bc03sc*i*, pci:v000010DEd000025A2sv00001D05sd00001195bc03sc*i*, pci:v000010DEd000025A5sv0000*sd0000*bc03sc*i*, pci:v000010DEd000025A6sv0000*sd0000*bc03sc*i*, pci:v000010DEd000025A7sv0000*sd0000*bc03sc*i*, pci:v000010DEd000025A9sv0000*sd0000*bc03sc*i*, pci:v000010DEd000025AAsv0000*sd0000*bc03sc*i*, pci:v000010DEd000025ABsv0000*sd0000*bc03sc*i*, pci:v000010DEd000025ACsv0000*sd0000*bc03sc*i*, pci:v000010DEd000025ADsv0000*sd0000*bc03sc*i*, pci:v000010DEd000025B6sv000010DEsd0000157Ebc03sc*i*, pci:v000010DEd000025B8sv0000*sd0000*bc03sc*i*, pci:v000010DEd000025B9sv0000*sd0000*bc03sc*i*, pci:v000010DEd000025BAsv0000*sd0000*bc03sc*i*, pci:v000010DEd000025BBsv0000*sd0000*bc03sc*i*, pci:v000010DEd000025BCsv0000*sd0000*bc03sc*i*, pci:v000010DEd000025BDsv0000*sd0000*bc03sc*i*, pci:v000010DEd000025E0sv0000*sd0000*bc03sc*i*, pci:v000010DEd000025E2sv0000*sd0000*bc03sc*i*, pci:v000010DEd000025E5sv0000*sd0000*bc03sc*i*, pci:v000010DEd000025ECsv0000*sd0000*bc03sc*i*, pci:v000010DEd000025EDsv0000*sd0000*bc03sc*i*, pci:v000010DEd000025F9sv0000*sd0000*bc03sc*i*, pci:v000010DEd000025FAsv0000*sd0000*bc03sc*i*, pci:v000010DEd000025FBsv0000*sd0000*bc03sc*i*, pci:v000010DEd00002684sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002685sv0000*sd0000*bc03sc*i*, pci:v000010DEd000026B1sv000017AAsd000016A1bc03sc*i*, pci:v000010DEd000026B2sv000017AAsd000017FAbc03sc*i*, pci:v000010DEd000026B3sv000017AAsd00001934bc03sc*i*, pci:v000010DEd000026B5sv000010DEsd000017DAbc03sc*i*, pci:v000010DEd000026B9sv000010DEsd000018CFbc03sc*i*, pci:v000010DEd000026BAsv000010DEsd00001957bc03sc*i*, pci:v000010DEd00002702sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002704sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002705sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002717sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002730sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002757sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002770sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002782sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002783sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002786sv0000*sd0000*bc03sc*i*, pci:v000010DEd000027A0sv0000*sd0000*bc03sc*i*, pci:v000010DEd000027B0sv000017AAsd000016FAbc03sc*i*, pci:v000010DEd000027B1sv000017AAsd0000180Cbc03sc*i*, pci:v000010DEd000027B2sv000017AAsd0000181Bbc03sc*i*, pci:v000010DEd000027B6sv000010DEsd00001933bc03sc*i*, pci:v000010DEd000027B8sv000010DEsd000016EEbc03sc*i*, pci:v000010DEd000027BAsv0000*sd0000*bc03sc*i*, pci:v000010DEd000027BBsv0000*sd0000*bc03sc*i*, pci:v000010DEd000027E0sv0000*sd0000*bc03sc*i*, pci:v000010DEd000027FBsv0000*sd0000*bc03sc*i*, pci:v000010DEd00002803sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002805sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002820sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002838sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002860sv0000*sd0000*bc03sc*i*, pci:v000010DEd00002882sv0000*sd0000*bc03sc*i*, pci:v000010DEd000028A0sv0000*sd0000*bc03sc*i*, pci:v000010DEd000028A1sv0000*sd0000*bc03sc*i*, pci:v000010DEd000028B0sv000017AAsd00001870bc03sc*i*, pci:v000010DEd000028B8sv0000*sd0000*bc03sc*i*, pci:v000010DEd000028B9sv0000*sd0000*bc03sc*i*, pci:v000010DEd000028BAsv0000*sd0000*bc03sc*i*, pci:v000010DEd000028BBsv0000*sd0000*bc03sc*i*, pci:v000010DEd000028E0sv0000*sd0000*bc03sc*i*, pci:v000010DEd000028E1sv0000*sd0000*bc03sc*i*, pci:v000010DEd000028F8sv0000*sd0000*bc03sc*i*, pci:v000010DEd000027B7sv0000*sd0000*bc03sc*i*)
 Support: PB
root@28e5f9b9e317:/driver#






```
