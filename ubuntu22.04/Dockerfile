# $ platform=ubuntu22.04
# $ docker build \
# -t mydriver \
# --progress plain \
# --build-arg DRIVER_VERSION="510.85.02" \
# --build-arg CUDA_VERSION=11.7.1 \
# --build-arg TARGETARCH=amd64 \
# ${platform}

# docker build --pull \
# --platform=linux/amd64 \
# --tag nvidia/driver:535.104.05-ubuntu22.04 \
# --build-arg DRIVER_VERSION="535.104.05" \
# --build-arg DRIVER_BRANCH="535" \
# --build-arg CUDA_VERSION="12.2.0" \
# --build-arg CVE_UPDATES="" \
# --file /Users/huzhi/work/code/go_code/ai/gpu/nvidia-container-images/driver/ubuntu22.04/Dockerfile \
# /Users/huzhi/work/code/go_code/ai/gpu/nvidia-container-images/driver/ubuntu22.04

ARG CUDA_VERSION
# CUDA_VERSION="12.2.0"

FROM nvidia/cuda:${CUDA_VERSION}-base-ubuntu22.04 as build
# [build 1/9] FROM docker.io/nvidia/cuda:12.2.0-base-ubuntu22.04

RUN env
# [build 2/9] RUN env
# NV_CUDA_COMPAT_PACKAGE=cuda-compat-12-2
# LD_LIBRARY_PATH=/usr/local/nvidia/lib:/usr/local/nvidia/lib64
# HOME=/root
# CUDA_VERSION=12.2.0
# NVIDIA_REQUIRE_CUDA=cuda>=12.2 brand=tesla,driver>=470,driver<471 brand=unknown,driver>=470,driver<471 brand=nvidia,driver>=470,driver<471 brand=nvidiartx,driver>=470,driver<471 brand=geforce,driver>=470,driver<471 brand=geforcertx,driver>=470,driver<471 brand=quadro,driver>=470,driver<471 brand=quadrortx,driver>=470,driver<471 brand=titan,driver>=470,driver<471 brand=titanrtx,driver>=470,driver<471 brand=tesla,driver>=525,driver<526 brand=unknown,driver>=525,driver<526 brand=nvidia,driver>=525,driver<526 brand=nvidiartx,driver>=525,driver<526 brand=geforce,driver>=525,driver<526 brand=geforcertx,driver>=525,driver<526 brand=quadro,driver>=525,driver<526 brand=quadrortx,driver>=525,driver<526 brand=titan,driver>=525,driver<526 brand=titanrtx,driver>=525,driver<526
# NVIDIA_DRIVER_CAPABILITIES=compute,utility
# NV_CUDA_CUDART_VERSION=12.2.53-1
# PATH=/usr/local/nvidia/bin:/usr/local/cuda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# NVARCH=x86_64
# NVIDIA_VISIBLE_DEVICES=all

ARG TARGETARCH
# TARGETARCH=amd64

SHELL ["/bin/bash", "-c"]

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
# [build 3/9] RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Remove cuda repository to avoid GPG errors
RUN rm -f /etc/apt/sources.list.d/cuda*
# [build 4/9] RUN rm -f /etc/apt/sources.list.d/cuda*

RUN apt-get update && apt-get install -y --no-install-recommends \
        apt-utils \
        build-essential \
        ca-certificates \
        curl \
        git && \
    rm -rf /var/lib/apt/lists/*
# [build 5/9] RUN
# apt-get update &&
# apt-get install -y --no-install-recommends apt-utils build-essential ca-certificates curl git &&
# rm -rf /var/lib/apt/lists/*

# ENV GOLANG_VERSION=1.22.1
ENV GOLANG_VERSION=1.22.2

# download appropriate binary based on the target architecture for multi-arch builds
RUN OS_ARCH=${TARGETARCH/x86_64/amd64} && OS_ARCH=${OS_ARCH/aarch64/arm64} && \
    curl https://storage.googleapis.com/golang/go${GOLANG_VERSION}.linux-${OS_ARCH}.tar.gz \
    | tar -C /usr/local -xz
# [build 6/9] RUN
# OS_ARCH=${TARGETARCH/x86_64/amd64} &&
# OS_ARCH=${OS_ARCH/aarch64/arm64} &&
# curl https://dl.google.com/go/go${GOLANG_VERSION}.linux-${OS_ARCH}.tar.gz | tar -C /usr/local -xz

ENV PATH /usr/local/go/bin:$PATH

WORKDIR /work
# [build 7/9] WORKDIR /work

RUN git clone https://gitlab.com/nvidia/container-images/driver && \
    cd driver/vgpu/src && \
    go build -o vgpu-util && \
    mv vgpu-util /work
# [build 8/9] RUN
# git clone https://gitlab.com/nvidia/container-images/driver &&
# cd driver/vgpu/src &&
# go build -o vgpu-util &&
# mv vgpu-util /work

RUN env
# [build 9/9] RUN env
# NVIDIA_VISIBLE_DEVICES=all
# NVIDIA_REQUIRE_CUDA=cuda>=12.2 brand=tesla,driver>=470,driver<471 brand=unknown,driver>=470,driver<471 brand=nvidia,driver>=470,driver<471 brand=nvidiartx,driver>=470,driver<471 brand=geforce,driver>=470,driver<471 brand=geforcertx,driver>=470,driver<471 brand=quadro,driver>=470,driver<471 brand=quadrortx,driver>=470,driver<471 brand=titan,driver>=470,driver<471 brand=titanrtx,driver>=470,driver<471 brand=tesla,driver>=525,driver<526 brand=unknown,driver>=525,driver<526 brand=nvidia,driver>=525,driver<526 brand=nvidiartx,driver>=525,driver<526 brand=geforce,driver>=525,driver<526 brand=geforcertx,driver>=525,driver<526 brand=quadro,driver>=525,driver<526 brand=quadrortx,driver>=525,driver<526 brand=titan,driver>=525,driver<526 brand=titanrtx,driver>=525,driver<526
# NVIDIA_DRIVER_CAPABILITIES=compute,utility
# NV_CUDA_CUDART_VERSION=12.2.53-1
# HOME=/root
# CUDA_VERSION=12.2.0
# GOLANG_VERSION=1.22.2
# SHLVL=0
# NVARCH=x86_64
# NV_CUDA_COMPAT_PACKAGE=cuda-compat-12-2
# LD_LIBRARY_PATH=/usr/local/nvidia/lib:/usr/local/nvidia/lib64
# TARGETARCH=amd64
# PATH=/usr/local/go/bin:/usr/local/nvidia/bin:/usr/local/cuda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# _=/usr/bin/env


FROM nvidia/cuda:${CUDA_VERSION}-base-ubuntu22.04
# [stage-1  1/18] FROM docker.io/nvidia/cuda:12.2.0-base-ubuntu22.04

RUN env
# [stage-1  2/18] RUN env
# NV_CUDA_COMPAT_PACKAGE=cuda-compat-12-2
# LD_LIBRARY_PATH=/usr/local/nvidia/lib:/usr/local/nvidia/lib64
# HOME=/root
# CUDA_VERSION=12.2.0
# NVIDIA_REQUIRE_CUDA=cuda>=12.2 brand=tesla,driver>=470,driver<471 brand=unknown,driver>=470,driver<471 brand=nvidia,driver>=470,driver<471 brand=nvidiartx,driver>=470,driver<471 brand=geforce,driver>=470,driver<471 brand=geforcertx,driver>=470,driver<471 brand=quadro,driver>=470,driver<471 brand=quadrortx,driver>=470,driver<471 brand=titan,driver>=470,driver<471 brand=titanrtx,driver>=470,driver<471 brand=tesla,driver>=525,driver<526 brand=unknown,driver>=525,driver<526 brand=nvidia,driver>=525,driver<526 brand=nvidiartx,driver>=525,driver<526 brand=geforce,driver>=525,driver<526 brand=geforcertx,driver>=525,driver<526 brand=quadro,driver>=525,driver<526 brand=quadrortx,driver>=525,driver<526 brand=titan,driver>=525,driver<526 brand=titanrtx,driver>=525,driver<526
# NVIDIA_DRIVER_CAPABILITIES=compute,utility
# NV_CUDA_CUDART_VERSION=12.2.53-1
# PATH=/usr/local/nvidia/bin:/usr/local/cuda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# NVARCH=x86_64
# NVIDIA_VISIBLE_DEVICES=all

SHELL ["/bin/bash", "-c"]

ARG BASE_URL=https://us.download.nvidia.com/tesla
ARG TARGETARCH
# TARGETARCH=amd64
ENV TARGETARCH=$TARGETARCH
ARG DRIVER_VERSION
# DRIVER_VERSION="535.104.05"
ENV DRIVER_VERSION=$DRIVER_VERSION
ENV DEBIAN_FRONTEND=noninteractive

# Arg to indicate if driver type is either of passthrough(baremetal) or vgpu
ARG DRIVER_TYPE=passthrough
ENV DRIVER_TYPE=$DRIVER_TYPE
ARG DRIVER_BRANCH=525
# DRIVER_BRANCH="535"
ENV DRIVER_BRANCH=$DRIVER_BRANCH
ARG VGPU_LICENSE_SERVER_TYPE=NLS
ENV VGPU_LICENSE_SERVER_TYPE=$VGPU_LICENSE_SERVER_TYPE
# Enable vGPU version compability check by default
ARG DISABLE_VGPU_VERSION_CHECK=true
ENV DISABLE_VGPU_VERSION_CHECK=$DISABLE_VGPU_VERSION_CHECK
ENV NVIDIA_VISIBLE_DEVICES=void

RUN env
# [stage-1  3/18] RUN env
# NV_CUDA_COMPAT_PACKAGE=cuda-compat-12-2
# LD_LIBRARY_PATH=/usr/local/nvidia/lib:/usr/local/nvidia/lib64
# HOME=/root
# CUDA_VERSION=12.2.0
# NVIDIA_REQUIRE_CUDA=cuda>=12.2 brand=tesla,driver>=470,driver<471 brand=unknown,driver>=470,driver<471 brand=nvidia,driver>=470,driver<471 brand=nvidiartx,driver>=470,driver<471 brand=geforce,driver>=470,driver<471 brand=geforcertx,driver>=470,driver<471 brand=quadro,driver>=470,driver<471 brand=quadrortx,driver>=470,driver<471 brand=titan,driver>=470,driver<471 brand=titanrtx,driver>=470,driver<471 brand=tesla,driver>=525,driver<526 brand=unknown,driver>=525,driver<526 brand=nvidia,driver>=525,driver<526 brand=nvidiartx,driver>=525,driver<526 brand=geforce,driver>=525,driver<526 brand=geforcertx,driver>=525,driver<526 brand=quadro,driver>=525,driver<526 brand=quadrortx,driver>=525,driver<526 brand=titan,driver>=525,driver<526 brand=titanrtx,driver>=525,driver<526
# NVIDIA_DRIVER_CAPABILITIES=compute,utility
# NV_CUDA_CUDART_VERSION=12.2.53-1
# PATH=/usr/local/nvidia/bin:/usr/local/cuda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# NVARCH=x86_64
# NVIDIA_VISIBLE_DEVICES=all
# TARGETARCH=amd64
# DRIVER_VERSION=535.104.05
# DEBIAN_FRONTEND=noninteractive
# DRIVER_TYPE=passthrough
# DRIVER_BRANCH=535
# VGPU_LICENSE_SERVER_TYPE=NLS
# DISABLE_VGPU_VERSION_CHECK=true
# BASE_URL=https://us.download.nvidia.com/tesla
# SHLVL=0
# _=/usr/bin/env

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
# [stage-1  4/18] RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN echo "TARGETARCH=$TARGETARCH"
# [stage-1  5/18] RUN echo "TARGETARCH=amd64"

ADD install.sh /tmp
# [stage-1  6/18] ADD install.sh /tmp

# Fetch GPG keys for CUDA repo
RUN apt-key del 7fa2af80 && OS_ARCH=${TARGETARCH/amd64/x86_64} && OS_ARCH=${OS_ARCH/arm64/sbsa} && \
    apt-key adv --fetch-keys "https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/${OS_ARCH}/3bf863cc.pub"
# [stage-1  7/18] RUN
# apt-key del 7fa2af80 &&
# OS_ARCH=${TARGETARCH/amd64/x86_64} &&
# OS_ARCH=${OS_ARCH/arm64/sbsa} &&
# apt-key adv --fetch-keys "https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/${OS_ARCH}/3bf863cc.pub"

RUN /tmp/install.sh reposetup && /tmp/install.sh depinstall && \
    curl -fsSL -o /usr/local/bin/donkey https://github.com/3XX0/donkey/releases/download/v1.1.0/donkey && \
    chmod +x /usr/local/bin/donkey
# [stage-1  8/18] RUN
# /tmp/install.sh reposetup &&
# /tmp/install.sh depinstall &&
# curl -fsSL -o /usr/local/bin/donkey https://github.com/3XX0/donkey/releases/download/v1.1.0/donkey &&
# chmod +x /usr/local/bin/donkey

# The following additional packages will be installed:
#   apt binutils binutils-common binutils-x86-64-linux-gnu bzip2 cpp cpp-11
#   dpkg-dev g++ g++-11 gcc gcc-11 gcc-11-base libapt-pkg6.0 libasan6 libatomic1
#   libbinutils libbrotli1 libbsd0 libc-dev-bin libc6 libc6-dev libcc1-0
#   libcrypt-dev libctf-nobfd0 libctf0 libcurl4 libdpkg-perl libdrm-amdgpu1
#   libdrm-common libdrm-intel1 libdrm-nouveau2 libdrm-radeon1 libdrm2 libedit2
#   libegl-dev libegl-mesa0 libegl1 libelf1 libexpat1 libgbm1 libgcc-11-dev
#   libgdbm-compat4 libgdbm6 libgl-dev libgl1 libgl1-mesa-dri libglapi-mesa
#   libgles-dev libgles1 libgles2 libglib2.0-0 libglvnd-core-dev libglvnd0
#   libglx-dev libglx-mesa0 libglx0 libgomp1 libicu70 libisl23 libitm1 libkmod2
#   libllvm15 liblsan0 libmagic-mgc libmagic1 libmd0 libmpc3 libmpfr6
#   libnghttp2-14 libnsl-dev libopengl-dev libopengl0 libpciaccess0 libperl5.34
#   libpsl5 libpthread-stubs0-dev libquadmath0 librtmp1 libsensors-config
#   libsensors5 libssh-4 libstdc++-11-dev libtirpc-dev libtsan0 libubsan1
#   libwayland-client0 libwayland-server0 libx11-6 libx11-data libx11-dev
#   libx11-xcb1 libxau-dev libxau6 libxcb-dri2-0 libxcb-dri3-0 libxcb-glx0
#   libxcb-present0 libxcb-randr0 libxcb-shm0 libxcb-sync1 libxcb-xfixes0
#   libxcb1 libxcb1-dev libxdmcp-dev libxdmcp6 libxext6 libxfixes3 libxml2
#   libxshmfence1 libxxf86vm1 linux-libc-dev lto-disabled-list make patch perl
#   perl-base perl-modules-5.34 rpcsvc-proto x11proto-dev xorg-sgml-doctools
#   xtrans-dev xz-utils zlib1g-dev
# Suggested packages:
#   apt-doc aptitude | synaptic | wajig powermgmt-base binutils-doc bzip2-doc
#   cpp-doc gcc-11-locales debian-keyring g++-multilib g++-11-multilib
#   gcc-11-doc gcc-multilib manpages-dev autoconf automake libtool flex bison
#   gdb gcc-doc gcc-11-multilib glibc-doc locales git bzr gdbm-l10n pciutils
#   lm-sensors libstdc++-11-doc libx11-doc libxcb-doc make-doc ed diffutils-doc
#   perl-doc libterm-readline-gnu-perl | libterm-readline-perl-perl
#   libtap-harness-archive-perl
# Recommended packages:
#   fakeroot libalgorithm-merge-perl manpages manpages-dev libc-devtools
#   libnss-nis libnss-nisplus libfile-fcntllock-perl liblocale-gettext-perl
#   libgl1-amber-dri libglib2.0-data shared-mime-info xdg-user-dirs publicsuffix
#   netbase
# The following NEW packages will be installed:
#   apt-utils binutils binutils-common binutils-x86-64-linux-gnu build-essential
#   bzip2 cpp cpp-11 curl dpkg-dev file g++ g++-11 gcc gcc-11 gcc-11-base kmod
#   libasan6 libatomic1 libbinutils libbrotli1 libbsd0 libc-dev-bin libc6-dev
#   libcc1-0 libcrypt-dev libctf-nobfd0 libctf0 libcurl4 libdpkg-perl
#   libdrm-amdgpu1 libdrm-common libdrm-intel1 libdrm-nouveau2 libdrm-radeon1
#   libdrm2 libedit2 libegl-dev libegl-mesa0 libegl1 libelf-dev libelf1
#   libexpat1 libgbm1 libgcc-11-dev libgdbm-compat4 libgdbm6 libgl-dev libgl1
#   libgl1-mesa-dri libglapi-mesa libgles-dev libgles1 libgles2 libglib2.0-0
#   libglvnd-core-dev libglvnd-dev libglvnd0 libglx-dev libglx-mesa0 libglx0
#   libgomp1 libicu70 libisl23 libitm1 libkmod2 libllvm15 liblsan0 libmagic-mgc
#   libmagic1 libmd0 libmpc3 libmpfr6 libnghttp2-14 libnsl-dev libopengl-dev
#   libopengl0 libpciaccess0 libperl5.34 libpsl5 libpthread-stubs0-dev
#   libquadmath0 librtmp1 libsensors-config libsensors5 libssh-4
#   libstdc++-11-dev libtirpc-dev libtsan0 libubsan1 libwayland-client0
#   libwayland-server0 libx11-6 libx11-data libx11-dev libx11-xcb1 libxau-dev
#   libxau6 libxcb-dri2-0 libxcb-dri3-0 libxcb-glx0 libxcb-present0
#   libxcb-randr0 libxcb-shm0 libxcb-sync1 libxcb-xfixes0 libxcb1 libxcb1-dev
#   libxdmcp-dev libxdmcp6 libxext6 libxfixes3 libxml2 libxshmfence1 libxxf86vm1
#   linux-libc-dev lto-disabled-list make patch perl perl-modules-5.34
#   pkg-config rpcsvc-proto x11proto-dev xorg-sgml-doctools xtrans-dev xz-utils
#   zlib1g-dev
# The following packages will be upgraded:
#   apt libapt-pkg6.0 libc6 perl-base

COPY nvidia-driver /usr/local/bin
# [stage-1  9/18] COPY nvidia-driver /usr/local/bin

COPY --from=build /work/vgpu-util /usr/local/bin
# [stage-1 10/18] COPY --from=build /work/vgpu-util /usr/local/bin

ADD drivers drivers/
# [stage-1 11/18] ADD drivers drivers/

# Fetch the installer automatically for passthrough/baremetal types
RUN if [ "$DRIVER_TYPE" != "vgpu" ]; then \
    cd drivers && \
    /tmp/install.sh download_installer && \
    ls -al; fi
# [stage-1 12/18] RUN
# if [ "passthrough" != "vgpu" ]; then
#     cd drivers &&
#     /tmp/install.sh download_installer &&
#     ls -al;
# fi

# total 332960
# drwxr-xr-x 1 root root      4096 Apr 26 03:38 .
# drwxr-xr-x 1 root root      4096 Apr 26 03:38 ..
# -rwxr-xr-x 1 root root 340936244 Apr 26 03:38 NVIDIA-Linux-x86_64-535.104.05.run
# -rw-r--r-- 1 root root        66 Apr 26 03:38 README.md

# Fabric manager packages are not available for arm64
RUN if [ "$DRIVER_TYPE" != "vgpu" ] && [ "$TARGETARCH" != "arm64" ]; then \
    apt-get update && \
    apt-get install -y --no-install-recommends nvidia-fabricmanager-${DRIVER_BRANCH}=${DRIVER_VERSION}-1 \
    libnvidia-nscq-${DRIVER_BRANCH}=${DRIVER_VERSION}-1; fi
# [stage-1 13/18] RUN
# if [ "passthrough" != "vgpu" ] && [ "amd64" != "arm64" ]; then
#     apt-get update &&
#     apt-get install -y --no-install-recommends nvidia-fabricmanager-535=535.104.05-1 libnvidia-nscq-535=535.104.05-1;
# fi

# The following NEW packages will be installed:
#   libnvidia-nscq-535 nvidia-fabricmanager-535

WORKDIR  /drivers
# [stage-1 14/18] WORKDIR  /drivers

ARG PUBLIC_KEY=empty
COPY ${PUBLIC_KEY} kernel/pubkey.x509
# [stage-1 15/18] COPY empty kernel/pubkey.x509

# Install / upgrade packages here that are required to resolve CVEs
ARG CVE_UPDATES
RUN if [ -n "${CVE_UPDATES}" ]; then \
        apt-get update && apt-get upgrade -y ${CVE_UPDATES} && \
        rm -rf /var/lib/apt/lists/*; \
    fi
# [stage-1 16/18] RUN
# if [ -n "" ]; then
#     apt-get update && apt-get upgrade -y  && rm -rf /var/lib/apt/lists/*;
# fi

# Remove cuda repository to avoid GPG errors
RUN rm -f /etc/apt/sources.list.d/cuda*
# [stage-1 17/18] RUN rm -f /etc/apt/sources.list.d/cuda*

# Add NGC DL license from the CUDA image
RUN mkdir /licenses && mv /NGC-DL-CONTAINER-LICENSE /licenses/NGC-DL-CONTAINER-LICENSE
# [stage-1 18/18] RUN mkdir /licenses && mv /NGC-DL-CONTAINER-LICENSE /licenses/NGC-DL-CONTAINER-LICENSE

ENTRYPOINT ["nvidia-driver", "init"]
