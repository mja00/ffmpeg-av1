#!/bin/sh -e

# shellcheck disable=SC1091

# Static dav1d for FFmpeg's libdav1d decoder; package.sh merges it into libavcodec.a.

. tools/common.sh

DAV1D_VERSION=1.5.4
DAV1D_PREFIX="$PWD/dav1d-prefix"

_group "Building dav1d $DAV1D_VERSION"

curl -sSfL "https://code.videolan.org/videolan/dav1d/-/archive/$DAV1D_VERSION/dav1d-$DAV1D_VERSION.tar.gz" | tar xz

cd "dav1d-$DAV1D_VERSION"
meson setup build \
	--buildtype=release \
	--default-library=static \
	--prefix="$DAV1D_PREFIX" \
	--libdir=lib \
	-Denable_tools=false \
	-Denable_tests=false \
	-Denable_examples=false
ninja -C build install

_end
