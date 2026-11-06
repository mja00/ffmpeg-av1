# ffmpeg-av1 (MinGW)

Static FFmpeg for Lichii's MinGW builds, with AV1 decoding. Switch 2 titles such as The Legend of
Zelda: Ocarina of Time ship their movies as AV1, which [crueter-ci/FFmpeg](https://github.com/crueter-ci/FFmpeg)'s
MinGW package cannot decode. MSVC and Linux use [Takoroka/ffmpeg-av1](https://github.com/Takoroka/ffmpeg-av1).

This is crueter-ci/FFmpeg's scripts (same FFmpeg commit, patch and flags), built for `mingw-amd64`
only, plus static dav1d 1.5.4 merged into `libavcodec.a` so nothing else needs linking.

- [**Releases**](https://github.com/mja00/ffmpeg-av1/releases)
- Shared libraries (`BUILD_SHARED_LIBS=ON`) are not supported.
- CMake target: `FFmpeg::FFmpeg`

## Building and Usage

See the [spec](https://github.com/crueter-ci/spec).

## Dependencies

All: GNU make, pkg-config, curl, zstd, unzip, bash, working compiler

- `amd64` only: nasm
- Linux, MinGW: ffnvcodec-headers, vulkan-headers
- dav1d: meson, ninja
