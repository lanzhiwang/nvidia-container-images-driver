# Copyright (c) 2021-2022, NVIDIA CORPORATION.  All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

BUILD_MULTI_ARCH_IMAGES ?= no
# BUILD_MULTI_ARCH_IMAGES: no

DOCKER ?= docker
# DOCKER: docker

BUILDX =
ifeq ($(BUILD_MULTI_ARCH_IMAGES), true)
BUILDX = buildx
endif
# BUILDX:

##### Global variables #####
include $(CURDIR)/versions.mk

ifeq ($(IMAGE_NAME),)
REGISTRY ?= nvidia
IMAGE_NAME := $(REGISTRY)/driver
endif
# REGISTRY: nvidia
# IMAGE_NAME: nvidia/driver

DRIVER_TAG = $(DRIVER_VERSION)
# DRIVER_TAG:

# VERSION indicates the version to tag the image with.
# Production tags should be in the form <driver-version>-<dist>
# Development tags should be in the form <commit-sha>-<driver-version>-<dist>
ifeq ($(VERSION),)
IMAGE_VERSION = $(DRIVER_TAG)
else
IMAGE_VERSION = $(VERSION)-$(DRIVER_TAG)
endif
# IMAGE_VERSION:

IMAGE_TAG = $(IMAGE_VERSION)-$(DIST)
# IMAGE_TAG: -
IMAGE = $(IMAGE_NAME):$(IMAGE_TAG)
# IMAGE: nvidia/driver:-

OUT_IMAGE_NAME ?= $(IMAGE_NAME)
# OUT_IMAGE_NAME: nvidia/driver

ifeq ($(OUT_VERSION),)
OUT_IMAGE_VERSION = $(DRIVER_TAG)
else
OUT_IMAGE_VERSION = $(OUT_VERSION)-$(DRIVER_TAG)
endif
# OUT_IMAGE_VERSION:

OUT_DIST ?= $(DIST)
OUT_IMAGE_TAG = $(OUT_IMAGE_VERSION)-$(OUT_DIST)
OUT_IMAGE = $(OUT_IMAGE_NAME):$(OUT_IMAGE_TAG)
# OUT_DIST:
# OUT_IMAGE_TAG: -
# OUT_IMAGE: nvidia/driver:-

##### Public rules #####
DISTRIBUTIONS := ubuntu18.04 ubuntu20.04 ubuntu22.04 signed_ubuntu20.04 signed_ubuntu22.04 rhel8 rhel9 centos7 flatcar fedora36 sles15.3 precompiled_rhcos
# DISTRIBUTIONS: ubuntu18.04 ubuntu20.04 ubuntu22.04 signed_ubuntu20.04 signed_ubuntu22.04 rhel8 rhel9 centos7 flatcar fedora36 sles15.3 precompiled_rhcos

PUSH_TARGETS := $(patsubst %, push-%, $(DISTRIBUTIONS))
# PUSH_TARGETS:  push-ubuntu18.04 push-ubuntu20.04 push-ubuntu22.04 push-signed_ubuntu20.04 push-signed_ubuntu22.04 push-rhel8 push-centos7 push-flatcar push-fedora36 push-sles15.3 push-precompiled_rhcos

BASE_FROM := jammy focal
# BASE_FROM: jammy focal

PUSH_TARGETS := $(patsubst %, push-%, $(DISTRIBUTIONS))
# PUSH_TARGETS:  push-ubuntu18.04 push-ubuntu20.04 push-ubuntu22.04 push-signed_ubuntu20.04 push-signed_ubuntu22.04 push-rhel8 push-centos7 push-flatcar push-fedora36 push-sles15.3 push-precompiled_rhcos

DRIVER_PUSH_TARGETS := $(foreach push_target, $(PUSH_TARGETS), $(addprefix $(push_target)-, $(DRIVER_VERSIONS)))
# DRIVER_PUSH_TARGETS:  push-ubuntu18.04-470.199.02 push-ubuntu18.04-525.125.06 push-ubuntu18.04-535.104.05 push-ubuntu20.04-470.199.02 push-ubuntu20.04-525.125.06 push-ubuntu20.04-535.104.05 push-ubuntu22.04-470.199.02 push-ubuntu22.04-525.125.06 push-ubuntu22.04-535.104.05 push-signed_ubuntu20.04-470.199.02 push-signed_ubuntu20.04-525.125.06 push-signed_ubuntu20.04-535.104.05 push-signed_ubuntu22.04-470.199.02 push-signed_ubuntu22.04-525.125.06 push-signed_ubuntu22.04-535.104.05 push-rhel8-470.199.02 push-rhel8-525.125.06 push-rhel8-535.104.05 push-centos7-470.199.02 push-centos7-525.125.06 push-centos7-535.104.05 push-flatcar-470.199.02 push-flatcar-525.125.06 push-flatcar-535.104.05 push-fedora36-470.199.02 push-fedora36-525.125.06 push-fedora36-535.104.05 push-sles15.3-470.199.02 push-sles15.3-525.125.06 push-sles15.3-535.104.05 push-precompiled_rhcos-470.199.02 push-precompiled_rhcos-525.125.06 push-precompiled_rhcos-535.104.05

BUILD_TARGETS := $(patsubst %, build-%, $(DISTRIBUTIONS))
# BUILD_TARGETS:  build-ubuntu18.04 build-ubuntu20.04 build-ubuntu22.04 build-signed_ubuntu20.04 build-signed_ubuntu22.04 build-rhel8 build-centos7 build-flatcar build-fedora36 build-sles15.3 build-precompiled_rhcos

DRIVER_BUILD_TARGETS := $(foreach build_target, $(BUILD_TARGETS), $(addprefix $(build_target)-, $(DRIVER_VERSIONS)))
# DRIVER_BUILD_TARGETS:  build-ubuntu18.04-470.199.02 build-ubuntu18.04-525.125.06 build-ubuntu18.04-535.104.05 build-ubuntu20.04-470.199.02 build-ubuntu20.04-525.125.06 build-ubuntu20.04-535.104.05 build-ubuntu22.04-470.199.02 build-ubuntu22.04-525.125.06 build-ubuntu22.04-535.104.05 build-signed_ubuntu20.04-470.199.02 build-signed_ubuntu20.04-525.125.06 build-signed_ubuntu20.04-535.104.05 build-signed_ubuntu22.04-470.199.02 build-signed_ubuntu22.04-525.125.06 build-signed_ubuntu22.04-535.104.05 build-rhel8-470.199.02 build-rhel8-525.125.06 build-rhel8-535.104.05 build-centos7-470.199.02 build-centos7-525.125.06 build-centos7-535.104.05 build-flatcar-470.199.02 build-flatcar-525.125.06 build-flatcar-535.104.05 build-fedora36-470.199.02 build-fedora36-525.125.06 build-fedora36-535.104.05 build-sles15.3-470.199.02 build-sles15.3-525.125.06 build-sles15.3-535.104.05 build-precompiled_rhcos-470.199.02 build-precompiled_rhcos-525.125.06 build-precompiled_rhcos-535.104.05

TEST_TARGETS := $(patsubst %, test-%, $(DISTRIBUTIONS))
# TEST_TARGETS:  test-ubuntu18.04 test-ubuntu20.04 test-ubuntu22.04 test-signed_ubuntu20.04 test-signed_ubuntu22.04 test-rhel8 test-centos7 test-flatcar test-fedora36 test-sles15.3 test-precompiled_rhcos

PULL_TARGETS := $(patsubst %, pull-%, $(DISTRIBUTIONS))
# PULL_TARGETS:  pull-ubuntu18.04 pull-ubuntu20.04 pull-ubuntu22.04 pull-signed_ubuntu20.04 pull-signed_ubuntu22.04 pull-rhel8 pull-centos7 pull-flatcar pull-fedora36 pull-sles15.3 pull-precompiled_rhcos

DRIVER_PULL_TARGETS := $(foreach pull_target, $(PULL_TARGETS), $(addprefix $(pull_target)-, $(DRIVER_VERSIONS)))
# DRIVER_PULL_TARGETS:  pull-ubuntu18.04-470.199.02 pull-ubuntu18.04-525.125.06 pull-ubuntu18.04-535.104.05 pull-ubuntu20.04-470.199.02 pull-ubuntu20.04-525.125.06 pull-ubuntu20.04-535.104.05 pull-ubuntu22.04-470.199.02 pull-ubuntu22.04-525.125.06 pull-ubuntu22.04-535.104.05 pull-signed_ubuntu20.04-470.199.02 pull-signed_ubuntu20.04-525.125.06 pull-signed_ubuntu20.04-535.104.05 pull-signed_ubuntu22.04-470.199.02 pull-signed_ubuntu22.04-525.125.06 pull-signed_ubuntu22.04-535.104.05 pull-rhel8-470.199.02 pull-rhel8-525.125.06 pull-rhel8-535.104.05 pull-centos7-470.199.02 pull-centos7-525.125.06 pull-centos7-535.104.05 pull-flatcar-470.199.02 pull-flatcar-525.125.06 pull-flatcar-535.104.05 pull-fedora36-470.199.02 pull-fedora36-525.125.06 pull-fedora36-535.104.05 pull-sles15.3-470.199.02 pull-sles15.3-525.125.06 pull-sles15.3-535.104.05 pull-precompiled_rhcos-470.199.02 pull-precompiled_rhcos-525.125.06 pull-precompiled_rhcos-535.104.05

ARCHIVE_TARGETS := $(patsubst %, archive-%, $(DISTRIBUTIONS))
# ARCHIVE_TARGETS:  archive-ubuntu18.04 archive-ubuntu20.04 archive-ubuntu22.04 archive-signed_ubuntu20.04 archive-signed_ubuntu22.04 archive-rhel8 archive-centos7 archive-flatcar archive-fedora36 archive-sles15.3 archive-precompiled_rhcos

DRIVER_ARCHIVE_TARGETS := $(foreach archive_target, $(ARCHIVE_TARGETS), $(addprefix $(archive_target)-, $(DRIVER_VERSIONS)))
# DRIVER_ARCHIVE_TARGETS:  archive-ubuntu18.04-470.199.02 archive-ubuntu18.04-525.125.06 archive-ubuntu18.04-535.104.05 archive-ubuntu20.04-470.199.02 archive-ubuntu20.04-525.125.06 archive-ubuntu20.04-535.104.05 archive-ubuntu22.04-470.199.02 archive-ubuntu22.04-525.125.06 archive-ubuntu22.04-535.104.05 archive-signed_ubuntu20.04-470.199.02 archive-signed_ubuntu20.04-525.125.06 archive-signed_ubuntu20.04-535.104.05 archive-signed_ubuntu22.04-470.199.02 archive-signed_ubuntu22.04-525.125.06 archive-signed_ubuntu22.04-535.104.05 archive-rhel8-470.199.02 archive-rhel8-525.125.06 archive-rhel8-535.104.05 archive-centos7-470.199.02 archive-centos7-525.125.06 archive-centos7-535.104.05 archive-flatcar-470.199.02 archive-flatcar-525.125.06 archive-flatcar-535.104.05 archive-fedora36-470.199.02 archive-fedora36-525.125.06 archive-fedora36-535.104.05 archive-sles15.3-470.199.02 archive-sles15.3-525.125.06 archive-sles15.3-535.104.05 archive-precompiled_rhcos-470.199.02 archive-precompiled_rhcos-525.125.06 archive-precompiled_rhcos-535.104.05

BASE_BUILD := $(patsubst %, build-base-%, $(BASE_FROM))
# BASE_BUILD:  build-base-jammy build-base-focal

BASE_PUSH := $(patsubst %, push-base-%, $(BASE_FROM))
# BASE_PUSH:  push-base-jammy push-base-focal

BASE_BUILD_TARGETS := $(foreach target,$(BASE_BUILD),$(target))
# BASE_BUILD_TARGETS: build-base-jammy build-base-focal

BASE_PUSH_TARGETS := $(foreach target,$(BASE_PUSH),$(target))
# BASE_PUSH_TARGETS: push-base-jammy push-base-focal

PHONY: $(BASE_BUILD_TARGETS) $(BASE_PUSH_TARGETS) $(DISTRIBUTIONS) $(PUSH_TARGETS) $(BUILD_TARGETS) $(TEST_TARGETS) $(PULL_TARGETS) $(ARCHIVE_TARGETS) $(DRIVER_PUSH_TARGETS) $(DRIVER_BUILD_TARGETS) $(DRIVER_PULL_TARGETS) $(DRIVER_ARCHIVE_TARGETS)

ifeq ($(BUILD_MULTI_ARCH_IMAGES),true)
include $(CURDIR)/multi-arch.mk
else
include $(CURDIR)/native-only.mk
endif

pull-%: DIST = $(word 2,$(subst -, ,$@))
pull-%: DRIVER_VERSION = $(word 3,$(subst -, ,$@))
pull-%: DRIVER_BRANCH = $(word 1,$(subst ., ,${DRIVER_VERSION}))

$(PULL_TARGETS): %: $(foreach driver_version, $(DRIVER_VERSIONS), $(addprefix %-, $(driver_version)))

pull-signed_ubuntu20.04%: DIST = signed-ubuntu20.04
pull-signed_ubuntu20.04%: DRIVER_TAG = $(DRIVER_BRANCH)

pull-signed_ubuntu22.04%: DIST = ubuntu22.04
pull-signed_ubuntu22.04%: DRIVER_TAG = $(DRIVER_BRANCH)
pull-signed_ubuntu22.04%: IMAGE_TAG = $(DRIVER_BRANCH)-$(KERNEL_VERSION)-$(DIST)

PLATFORM ?= linux/amd64
$(DRIVER_PULL_TARGETS): pull-%:
	$(DOCKER) pull "--platform=$(PLATFORM)" "$(IMAGE)"

archive-%: DIST = $(word 2,$(subst -, ,$@))
archive-%: DRIVER_VERSION = $(word 3,$(subst -, ,$@))
archive-%: DRIVER_BRANCH = $(word 1,$(subst ., ,${DRIVER_VERSION}))

$(ARCHIVE_TARGETS): %: $(foreach driver_version, $(DRIVER_VERSIONS), $(addprefix %-, $(driver_version)))

archive-signed_ubuntu20.04%: DIST = signed-ubuntu20.04
archive-signed_ubuntu20.04%: DRIVER_TAG = $(DRIVER_BRANCH)

archive-signed_ubuntu22.04%: DIST = ubuntu22.04
archive-signed_ubuntu22.04%: DRIVER_TAG = $(DRIVER_BRANCH)
archive-signed_ubuntu22.04%: IMAGE_TAG = $(DRIVER_BRANCH)-$(KERNEL_VERSION)-$(DIST)

$(DRIVER_ARCHIVE_TARGETS): archive-%:
	$(DOCKER) save "$(IMAGE)" -o "archive.tar"

# $(DRIVER_PUSH_TARGETS) is in the form of push-$(DIST)-$(DRIVER_VERSION)
# Parse the target to set the required variables.
push-%: DIST = $(word 2,$(subst -, ,$@))
push-%: DRIVER_VERSION = $(word 3,$(subst -, ,$@))
push-%: DRIVER_BRANCH = $(word 1,$(subst ., ,${DRIVER_VERSION}))

# push-ubuntu20.04 pushes all driver images for ubuntu20.04
# push-ubuntu20.04-$(DRIVER_VERSION) pushes an image for the specific $(DRIVER_VERSION)
$(PUSH_TARGETS): %: $(foreach driver_version, $(DRIVER_VERSIONS), $(addprefix %-, $(driver_version)))

push-signed_ubuntu20.04%: DIST = signed-ubuntu20.04
push-signed_ubuntu20.04%: DRIVER_TAG = $(DRIVER_BRANCH)

push-signed_ubuntu22.04%: DIST = ubuntu22.04
push-signed_ubuntu22.04%: DRIVER_TAG = $(DRIVER_BRANCH)
push-signed_ubuntu22.04%: IMAGE_TAG = $(DRIVER_BRANCH)-$(KERNEL_VERSION)-$(DIST)
push-signed_ubuntu22.04%: OUT_IMAGE_TAG = $(DRIVER_BRANCH)-$(KERNEL_VERSION)-$(DIST)

# $(DRIVER_BUILD_TARGETS) is in the form of build-$(DIST)-$(DRIVER_VERSION)
# Parse the target to set the required variables.
build-%: DIST = $(word 2,$(subst -, ,$@))
build-%: DRIVER_VERSION = $(word 3,$(subst -, ,$@))
build-%: DRIVER_BRANCH = $(word 1,$(subst ., ,${DRIVER_VERSION}))
build-%: SUBDIR = $(word 2,$(subst -, ,$@))
build-%: DOCKERFILE = $(CURDIR)/$(SUBDIR)/Dockerfile

# Both ubuntu20.04 and build-ubuntu20.04 trigger a build of all driver images for ubuntu20.04
# build-ubuntu20.04-$(DRIVER_VERSION) triggers a build for a specific $(DRIVER_VERSION)
$(DISTRIBUTIONS): %: build-%
$(BUILD_TARGETS): %: $(foreach driver_version, $(DRIVER_VERSIONS), $(addprefix %-, $(driver_version)))
$(DRIVER_BUILD_TARGETS):
	DOCKER_BUILDKIT=1 \
		$(DOCKER) $(BUILDX) build --pull \
				$(DOCKER_BUILD_OPTIONS) \
				$(DOCKER_BUILD_PLATFORM_OPTIONS) \
				--tag $(IMAGE) \
				--build-arg DRIVER_VERSION="$(DRIVER_VERSION)" \
				--build-arg DRIVER_BRANCH="$(DRIVER_BRANCH)" \
				--build-arg CUDA_VERSION="$(CUDA_VERSION)" \
				--build-arg CVE_UPDATES="$(CVE_UPDATES)" \
				$(DOCKER_BUILD_ARGS) \
				--file $(DOCKERFILE) \
				$(CURDIR)/$(SUBDIR)

# $ make -n --just-print build-centos7-535.104.05
# DOCKER_BUILDKIT=1 \
# 		docker  build --pull \
# 				 \
# 				--platform=linux/amd64 \
# 				--tag nvidia/driver:535.104.05-centos7 \
# 				--build-arg DRIVER_VERSION="535.104.05" \
# 				--build-arg DRIVER_BRANCH="535" \
# 				--build-arg CUDA_VERSION="12.2.0" \
# 				--build-arg CVE_UPDATES="" \
# 				 \
# 				--file /Users/huzhi/work/code/go_code/ai/gpu/nvidia-container-images/driver/centos7/Dockerfile \
# 				/Users/huzhi/work/code/go_code/ai/gpu/nvidia-container-images/driver/centos7
# $

# $ make -n --just-print build-ubuntu22.04-535.104.05
# DOCKER_BUILDKIT=1 \
# 		docker  build --pull \
# 				 \
# 				--platform=linux/amd64 \
# 				--tag nvidia/driver:535.104.05-ubuntu22.04 \
# 				--build-arg DRIVER_VERSION="535.104.05" \
# 				--build-arg DRIVER_BRANCH="535" \
# 				--build-arg CUDA_VERSION="12.2.0" \
# 				--build-arg CVE_UPDATES="" \
# 				 \
# 				--file /Users/huzhi/work/code/go_code/ai/gpu/nvidia-container-images/driver/ubuntu22.04/Dockerfile \
# 				/Users/huzhi/work/code/go_code/ai/gpu/nvidia-container-images/driver/ubuntu22.04
# $

build-rhcos%: SUBDIR = rhel8

build-fedora%: SUBDIR = fedora

build-sles15%: SUBDIR = sle15
build-sles%: DOCKER_BUILD_ARGS = --build-arg SLES_VERSION=$(subst sles,,$(word 2,$(subst -, ,$@)))

# ubuntu20.04 Precompiled Driver
build-signed_ubuntu20.04%: DIST = signed-ubuntu20.04
build-signed_ubuntu20.04%: SUBDIR = ubuntu20.04/precompiled
build-signed_ubuntu20.04%: DRIVER_TAG = $(DRIVER_BRANCH)

# ubuntu22.04 Precompiled Driver
build-signed_ubuntu22.04%: DIST = ubuntu22.04
build-signed_ubuntu22.04%: SUBDIR = ubuntu22.04/precompiled
build-signed_ubuntu22.04%: DRIVER_TAG = $(DRIVER_BRANCH)
build-signed_ubuntu22.04%: IMAGE_TAG = $(DRIVER_BRANCH)-$(KERNEL_VERSION)-$(DIST)
build-signed_ubuntu22.04%: DOCKER_BUILD_ARGS =  --build-arg KERNEL_VERSION="$(KERNEL_VERSION)"

# base is an image used to poll Canonical for the latest kernel version
build-base-%: DOCKERFILE = $(CURDIR)/base/Dockerfile
build-base-%: TARGET = $(word 3,$(subst -, ,$@))
build-base-%: IMAGE_TAG = base-$(word 3,$(subst -, ,$@))-$(KERNEL_FLAVOR)-$(DRIVER_BRANCH)
$(BASE_BUILD_TARGETS):
	DOCKER_BUILDKIT=1 \
		$(DOCKER) $(BUILDX) build --pull --no-cache \
				$(DOCKER_BUILD_OPTIONS) \
				--tag $(IMAGE)  \
				--target $(TARGET) \
				--build-arg CUDA_VERSION="$(CUDA_VERSION)" \
				--build-arg DRIVER_BRANCH="$(DRIVER_BRANCH)" \
				--build-arg KERNEL_FLAVOR="$(KERNEL_FLAVOR)" \
				--file $(DOCKERFILE) \
				$(CURDIR)/base

push-base-%: TARGET = $(word 3,$(subst -, ,$@))
push-base-%: IMAGE_TAG = base-$(word 3,$(subst -, ,$@))-$(KERNEL_FLAVOR)-$(DRIVER_BRANCH)
push-base-%: OUT_IMAGE_TAG = ${IMAGE_TAG}
$(BASE_PUSH_TARGETS):
	regctl \
		image copy \
		$(IMAGE) $(OUT_IMAGE)

print:
	@echo "BUILD_MULTI_ARCH_IMAGES: "$(BUILD_MULTI_ARCH_IMAGES)
	@echo "DOCKER: "$(DOCKER)
	@echo "BUILDX: "$(BUILDX)
	@echo "DRIVER_VERSIONS: "$(DRIVER_VERSIONS)
	@echo "CUDA_VERSION: "$(CUDA_VERSION)
	@echo "REGISTRY: "$(REGISTRY)
	@echo "IMAGE_NAME: "$(IMAGE_NAME)
	@echo "DRIVER_TAG: "$(DRIVER_TAG)
	@echo "IMAGE_VERSION: "$(IMAGE_VERSION)
	@echo "IMAGE_TAG: "$(IMAGE_TAG)
	@echo "IMAGE: "$(IMAGE)
	@echo "OUT_IMAGE_NAME: "$(OUT_IMAGE_NAME)
	@echo "OUT_IMAGE_VERSION: "$(OUT_IMAGE_VERSION)
	@echo "OUT_DIST: "$(OUT_DIST)
	@echo "OUT_IMAGE_TAG: "$(OUT_IMAGE_TAG)
	@echo "OUT_IMAGE: "$(OUT_IMAGE)
	@echo "DISTRIBUTIONS: "$(DISTRIBUTIONS)
	@echo "PUSH_TARGETS: "$(PUSH_TARGETS)
	@echo "BASE_FROM: "$(BASE_FROM)
	@echo "PUSH_TARGETS: "$(PUSH_TARGETS)
	@echo "DRIVER_PUSH_TARGETS: "$(DRIVER_PUSH_TARGETS)
	@echo "BUILD_TARGETS: "$(BUILD_TARGETS)
	@echo "DRIVER_BUILD_TARGETS: "$(DRIVER_BUILD_TARGETS)
	@echo "TEST_TARGETS: "$(TEST_TARGETS)
	@echo "PULL_TARGETS: "$(PULL_TARGETS)
	@echo "DRIVER_PULL_TARGETS: "$(DRIVER_PULL_TARGETS)
	@echo "ARCHIVE_TARGETS: "$(ARCHIVE_TARGETS)
	@echo "DRIVER_ARCHIVE_TARGETS: "$(DRIVER_ARCHIVE_TARGETS)
	@echo "BASE_BUILD: "$(BASE_BUILD)
	@echo "BASE_PUSH: "$(BASE_PUSH)
	@echo "BASE_BUILD_TARGETS: "$(BASE_BUILD_TARGETS)
	@echo "BASE_PUSH_TARGETS: "$(BASE_PUSH_TARGETS)
