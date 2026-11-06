#!/bin/sh -e

# Generate build matrix

target() {
    printf '{"runs-on": "%s", "arch": "%s", "platform": "%s", "container": "%s"}' "$1" "$2" "$3" "$4"
}

first=1
add() {
    [ "$first" -eq 1 ] && first=0 || printf ','
    target "$1" "$2" "$3" "$4"
}

printf '['

# MSVC and Linux AV1 builds already come from Takoroka/ffmpeg-av1; this repo only fills in MinGW.
add windows-latest amd64 mingw

echo ']'