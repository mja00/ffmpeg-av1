#!/bin/sh -e

set -e

# shellcheck disable=SC1091

. tools/common.sh

ROOTDIR="$PWD"

copy_build_artifacts() {
	_group "Copying build artifacts"

	make install -C "$DIRECTORY"
	rm -rf out/share out/lib/pkgconfig

	# Consumers link only the FFmpeg libs; ar -M keeps dav1d's duplicate per-bitdepth member names.
	printf 'open out/lib/libavcodec.a\naddlib dav1d-prefix/lib/libdav1d.a\nsave\nend\n' | ar -M

	_end
}

copy_build_artifacts
copy_cmake
package

echo "-- Done! Artifacts are in $ROOTDIR/artifacts, raw lib/include data is in out"