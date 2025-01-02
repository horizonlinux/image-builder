#!/usr/bin/bash

set -eoux pipefail

# Make Alternatives Directory
mkdir -p /var/lib/alternatives

# Copy Files to Container
#cp -r /ctx/just /tmp/just
cp /ctx/packages.json /tmp/packages.json
#cp /ctx/system_files/shared/etc/ublue-update/ublue-update.toml /tmp/ublue-update.toml
#rsync -rvK /ctx/system_files/shared/ /
#rsync -rvK /ctx/system_files/"${BASE_IMAGE_NAME}"/ /

# Generate image-info.json
/tmp/build_files/00-image-info.sh

# Clean Up
mv /var/lib/alternatives /staged-alternatives
#/tmp/build_files/shared/clean-stage.sh
mkdir -p /var/lib && mv /staged-alternatives /var/lib/alternatives && \
mkdir -p /var/tmp && \
chmod -R 1777 /var/tmp
ostree container commit
