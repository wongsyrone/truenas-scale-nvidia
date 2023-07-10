#!/bin/sh
kernel_version="$(apt info linux-headers-truenas-production-amd64 | awk '/Source:/ { print $2}' | sed 's/linux-//')"
version="$(apt info nvidia-kernel-dkms | awk '/Version:/ { print $2}')"
version_short="$(echo "$version" | cut -f 1 -d '-')"
for file in debian/changelog debian/control debian/rules
do
    sed -i.bak "s/@KERNEL_VERSION@/$kernel_version/g" $file
    sed -i.bak "s/@VERSION@/$version/g" $file
    sed -i.bak "s/@VERSION_SHORT@/$version_short/g" $file
done
