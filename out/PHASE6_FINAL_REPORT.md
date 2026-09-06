# Motorola Boston (XT2419, "parrot") Bring-up — Phase 6 Final Report

Status: **compiles / repacks — NOT hardware-verified.** All statements below report
"compiles" or "does not compile", never "working/final". No physical hardware was used.

## Deliverables

| Tree | Location | Status |
|------|----------|--------|
| Vendor | `vendor/motorola/boston` (3370 proprietary files, 1.6G) | Extraction + makefiles exit 0 |
| Device | `device/motorola/boston` | BoardConfig verified against stock images |
| Kernel | `kernel/motorola/combined/{msm-kernel, common, build}` | Source at canonical tag + Motorola common; compiles |

Repacked images (in `out/`):

- `Image.boston` — compiled ARM64 kernel (39,455,076 bytes, 4K pages)
- `boot_boston.img` — header v4, base 0x0, kernel 0x8000, ramdisk 0x1000000,
  os 12.0.0 / patch 2025-09, page 4096. Unpack round-trip verified:
  kernel and ramdisk byte-match stock ramdisk.
- `vendor_boot_boston.img` — header v4, page 4096, kernel 0x8000, ramdisk 0x1000000,
  dtb 387,286 B @ 0x1f00000, tags 0x100. Verified: vendor_ramdisk and dtb byte-match
  stock components.

## Kernel compile result

- Source: `MotorolaMobilityLLC/kernel-msm` tag `MMI-V1UBS35H.97-24-16`
  (commit `51dd9323655f`, kernel 5.10.240) combined with
  `MotorolaMobilityLLC/kernel-common` branch `android-15-release-v1ubs35h.97-24-16`
  (ABI XML matches msm-kernel).
- Config: replicate of ACK consolidate flow for boston —
  `gki_defconfig` + `parrot_GKI.config` + `consolidate.fragment` +
  `parrot_consolidate.config` + `moto-parrot.config` + `moto-parrot-boston.config`
  + `debug-parrot.config` + `debug-parrot-boston.config`.
  Verified `CONFIG_BOSTON_DTB=y`, `CONFIG_UFSFEATURE=y`, `CONFIG_SCHED_MOTO_UNFAIR=m`,
  `CONFIG_BUILD_ARM64_DT_OVERLAY=y`.
- Toolchain: clang 14.0.6 (matches the `clang-r416183b` required by
  `build.config.common`), lld-14, binutils-aarch64-linux-gnu 2.40.
- Result: **compiles**. All ~2785 objects built with zero errors; `vmlinux` and
  `Image` produced; link completed.

## Environment modifications (flagged, per no-guessing rule)

- **LTO: `CONFIG_LTO_CLANG_THIN=y` instead of stock `CONFIG_LTO_CLANG_FULL=y`.**
  Full LTO vmlinux link OOM-killed in this 7 GB RAM box (even with 4 GB swap).
  Thin LTO is a deviation from the stock config; the Image is not bit-identical
  to a stock full-LTO build.

## Not verified / borrowed

- **AVB**: repacked images are unsigned (Motorola's signing keys unavailable).
  Flashing requires an unlocked bootloader or AVB vbmeta disable. Stock AVB keys
  flagged "borrowed/unverified" during bring-up.
- **Vendor DTS sources**: parrot/boston device tree sources are NOT present in the
  public kernel repos (msm-kernel or common only carry upstream QCOM boards).
  Therefore `boot_boston.img`/`vendor_boot_boston.img` use the **stock dtb**
  extracted from `vendor_boot.img` (387,286 B @ 0x1f00000), not a freshly compiled dtb.
- **TARGET_PRODUCT fragment selection**: boston fragments chosen by inference
  (`TARGET_PRODUCT_NAME=boston`), not confirmed against a Motorola build manifest.
- **Bootloader entropy / modem / RF**: not touched; modem/RF blobs ship from stock
  partition images, out of scope.
- **Hardware**: not booted. Only "compiles/repacks" is claimed.

## Known limitations

- `dtbo.img` and `recovery.img` were not repacked (stock kept).
- A full ACK `build.sh` combined run was not possible: the classic build system in
  `kernel/build` predates the android12-5.10 (2023-11) kernel's build config needs,
  and the Android `prebuilts-master/clang` toolchain download did not fit the
  environment. The defconfig flow was replicated faithfully by hand instead.
- Full-LTO stock build could not be reproduced in this environment (see above).
