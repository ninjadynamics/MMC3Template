# mmc3.cfg

#### SYMBOLS Section

The `SYMBOLS` section defines constants that are used throughout the memory layout and segment definitions. These symbols have default (weak) values that can be overridden if necessary.

- **PAGESIZE**: Defines the size of a memory page. Default value is `$0100` (256 bytes).
- **FTSIZE**: Defines the size of the memory allocated for FAMITONE. Default value is equal to `PAGESIZE`.
- **FTSTART**: Starting address for FAMITONE memory. Default value is `$0300`.
- **STACKSIZE**: Defines the size of the stack. Default value is `$0040` (64 bytes).
- **RAMSTART**: Starting address for general-purpose RAM. It is calculated as `FTSTART + FTSIZE`, which defaults to `$0380`.
- **RAMSIZE**: Size of the general-purpose RAM. Calculated as `$0800 - RAMSTART`, which defaults to `$0480`.
- **STACKSTART**: Defines the starting address of the stack. Calculated as `$0100 - STACKSIZE`, which defaults to `$00C0`.

#### MEMORY Section

The `MEMORY` section outlines the memory areas available to the NES application, including RAM and ROM areas.

| Memory Block | Start Address | Size    | Description                              |
|--------------|---------------|---------|------------------------------------------|
| **ZP**       | `$0000`       | `$0100` | Zero Page memory.                        |
| **RAM**      | `$0380`       | `$0480` | General-purpose RAM.                     |
| **FTRAM**    | `$0300`       | `$0100` | FAMITONE sound engine RAM.               |
| **WRAM**     | `$6000`       | `$2000` | 8K Cartridge RAM.                        |
| **HEADER**   | `$0000`       | `$0010` | INES Header.                             |
| **DAT**      | `$8000`       | `$2000` | ROM Data, start of PRG ROM.              |
| **M01-M16**  | `$8000`       | `$2000` | Data banks for PRG ROM.                  |
| **M17-M24**  | `$8000`       | `$2000` | Music banks for PRG ROM.                 |
| **M25-M31**  | `$8000`       | `$2000` | Sound effect banks for PRG ROM.          |
| **EX1-EX9**  | `$A000`       | `$2000` | Extended code banks for PRG ROM.         |
| **PRG**      | `$C000`       | `$4000` | Main program code in PRG ROM.            |
| **CHR**      | `$0000`       | `$40000`| CHR ROM (graphics).                      |

#### SEGMENTS Section

The `SEGMENTS` section defines logical segments that the linker uses to place different parts of the program into the memory blocks.

| Segment  | Memory Block | Start Address | Description |
|----------|--------------|---------------|-------------|
| **HEADER** | HEADER       | `$0000`       | INES Header.          |
| **RODATA** | DAT          | `$8000`       | Read-only data.       |
| **DATA_01-16** | M01-M16 | `$8000`       | Data banks in PRG ROM.|
| **MUS_01-04**  | M17-M20 | `$8000`       | Music banks in PRG ROM.|
| **SND_01-04**  | M21-M24 | `$8000`       | Sound effect banks.    |
| **CODE_EX1-EX9** | EX1-EX9 | `$A000`    | Extended code banks.   |
| **CODE**    | PRG         | `$C000`       | Main program code.    |
| **DATA**    | PRG         | `$C000`       | Read-write data in PRG ROM, run in RAM. |
| **CHARS**   | CHR         | `$0000`       | CHR ROM (graphics).    |
| **FAMITONE** | FTRAM      | `$0300`       | FAMITONE segment.     |
| **BSS**     | RAM         | `$0380`       | Uninitialized data.    |
| **HEAP**    | RAM         | `$0380`       | Optional heap memory. |
| **ZEROPAGE** | ZP         | `$0000`       | Zero Page segment.    |
| **ONCE**    | PRG         | `$C000`       | Code that runs once.   |
| **WRAM**    | WRAM        | `$6000`       | Work RAM (optional).   |
| **STARTUP** | PRG         | `$F800`       | Startup code.         |
| **VECTORS** | PRG         | `$FFFA`       | Interrupt vectors.    |

#### SYMBOLS Section (Continuation)

Additional symbols that define NES-specific parameters:

- **__STACKSIZE__**: Defines the stack size, equal to `STACKSIZE`.
- **__STACK_START__**: Defines the starting address of the stack, equal to `STACKSTART`.
- **NES_MAPPER**: Defines the NES mapper number, set to `4` for MMC3.
- **NES_PRG_BANKS**: Number of 16K PRG banks, set to `32`.
- **NES_CHR_BANKS**: Number of 8K CHR banks, set to `32`.
- **NES_MIRRORING**: Defines the mirroring type, set to `0` for horizontal mirroring.
- **NES_BATTERY**: Defines battery save, set to `1` to enable.