# ADuCM410 Blink

A bare-metal LED blink project for the Analog Devices ADuCM410 (Cortex-M33) microcontroller, built without an IDE using the ARM Compiler 6 toolchain.

## Hardware

- Target: ADuCM410 (160 MHz Cortex-M33, 1MB flash, 96KB RAM, 12x 12-bit VDACs)
- Eval board: EVAL-ADuCM410EVB

## Project Structure

```
.
├── ADuCM410.sct                      # Scatter file defining flash/RAM memory layout
├── README.md
├── activate.sh                       # ARM toolchain activation via vcpkg (must be sourced)
├── build
│   ├── blink.bin
│   ├── blink.dis
│   └── blink.elf
├── build.sh                          # Build script
├── main.c                            # Blink loop on P0_5 using busy-wait delay
├── startup_ADuCM410.s                # ADI-provided startup file (vector table, Reset_Handler)
├── third_party
│   ├── ADuCM410
│   │   └── common                    # ARM CMSIS-Core headers (core_cm33.h etc.)
│   └── CMSIS
│       └── Include                   # ADI device headers and peripheral libraries
└── vcpkg-configuration.json          # vcpkg toolchain dependencies
```

## Toolchain

- ARM Compiler 6 (armclang + armasm) distributed via vcpkg
- arm-none-eabi-objdump for ELF inspection (install separately e.g. via Homebrew)

To activate the toolchain:
```zsh
source activate.sh
```

## Building

```zsh
source activate.sh
./build.sh
```

The build is clean on every run. Output files are placed in `build/` (gitignored):
- `blink.elf` - fully linked ELF binary with debug info
- `blink.bin` - raw binary for flashing
- `blink.dis` - disassembly listing

## Memory Map

| Region           | Address      | Size    | Contents                    |
|------------------|--------------|---------|-----------------------------|
| INTVEC_REGION    | 0x00000000   | ~8KB    | Vector table + Keil runtime |
| PAGE0_CHECKSUM   | 0x00001FFC   | 4B      | Flash block checksum        |
| ER_IROM1         | 0x00002000   | ~1016KB | Application code            |
| ER_ISRAM         | 0x10000000   | 32KB    | Instruction SRAM (unused)   |
| ER_DRAM          | 0x20000000   | 96KB    | RAM (stack, heap, data)     |

## Notes

- GPIO clocks are enabled by default on reset - no explicit clock init required
- `SetupSram` enables instruction cache and ISRAM before jumping to `__main`
- Stack size: 1KB, Heap size: 512B (defined in startup file)
- LED pin is placeholder (P0_5) - update once eval board schematic is available
