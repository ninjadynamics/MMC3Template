# crt0.s

The `crt0.s` file is the startup file. It is responsible for initializing the NES hardware, setting up memory mapping for the MMC3 mapper, and preparing the environment for the main application code. This file also includes various utility routines and data segments essential for the functioning of NES programs.

#### Constants and Configuration

- **A12_INVERSION**:  
  Value `$80` is used to control the inversion of the A12 line for MMC3, which must match the `MMC_MODE` defined in `mmc3.h`.

- **FT_BASE_ADR, FT_DPCM_OFF, FT_SFX_STREAMS**:  
  These constants define the base address for FamiTone2 sound engine in RAM, the offset for DPCM (Delta Pulse Code Modulation) samples, and the number of simultaneous sound effect streams.

- **FT_THREAD, FT_PAL_SUPPORT, FT_NTSC_SUPPORT, FT_DPCM_ENABLE, FT_SFX_ENABLE**:  
  These configuration flags control various features of the FamiTone2 sound engine, such as threading, PAL/NTSC support, DPCM enablement, and sound effects.

- **FT_BANKED_MUSIC, FT_BANKED_SFX, FT_BANKED_DPCM**:  
  These flags control whether bank switching is enabled for music, sound effects, and DPCM samples.

#### Segment Declarations

- **"ZEROPAGE" Segment**:  
  Declares variables in the zero page (memory addresses $0000-$00FF), which are faster to access. This segment includes variables for PPU (Picture Processing Unit) control, controller states, random number generation, temporary storage, and other essential state variables.

- **"HEADER" Segment**:  
  Defines the NES header, which includes information about the PRG (Program ROM) and CHR (Character ROM) banks, mirroring type, mapper number, and other attributes. This header is essential for NES emulators and hardware to correctly initialize the game.

  ```plaintext
  +-------------+-------------------------------------------------------------------+
  | Byte        | Description                                                       |
  +-------------+-------------------------------------------------------------------+
  | $0000-$0003 | "NES" and EOF marker ($1A)                                        |
  | $0004       | Number of 16KB PRG ROM banks                                      |
  | $0005       | Number of 8KB CHR ROM banks                                       |
  | $0006       | Flags (mirroring, battery-backed RAM, trainer, mapper low nibble) |
  | $0007       | Flags (VS System, playchoice, mapper high nibble)                 |
  | $0008-$000F | Reserved (filled with zeros)                                      |
  +-------------+-------------------------------------------------------------------+
  ```

- **"STARTUP" Segment**:  
  Contains the main startup code responsible for initializing the NES hardware, including setting up the PPU, clearing memory, initializing the MMC3 mapper, and calling the `main` function. This segment is executed right after the NES powers on or resets.

#### Startup Routine

- **_exit and start**:  
  The `_exit` label is an entry point for the startup code. The code begins by disabling interrupts (`sei`), setting up the stack, and disabling the DMC and PPU.

- **initMMC**:  
  Initializes the MMC3 mapper by setting mirroring, disabling IRQs, enabling Work RAM, and setting up PRG and CHR banking. This ensures that the correct memory banks are mapped before the main code executes.

- **initPPU**:  
  Initializes the PPU by clearing the palette and VRAM, setting the scroll registers, and configuring the PPU control and mask registers.

- **clearPalette, clearVRAM, clearRAM**:  
  These routines clear the palette memory, VRAM, and RAM, respectively, to ensure a clean state before the game starts.

- **detectNTSC**:  
  Detects whether the system is running in NTSC mode by timing specific PPU operations.

- **waitSync3**:  
  Waits for the next PPU frame to synchronize the startup process with the vertical blank period.

- **NMI Callback Setup**:  
  Sets up a trampoline for the NMI callback (Non-Maskable Interrupt), initially pointing to a NOP (No Operation) routine.

- **Music and Sound Effects Initialization**:  
  Initializes the FamiTone sound engine, loading music and sound effect data into memory.

- **Main Call**:  
  Finally, the `jmp _main` instruction transfers control to the main application code, which is defined in the user's program.

#### Vectors

- **"VECTORS" Segment**:  
  Defines the interrupt vectors for NMI (Non-Maskable Interrupt), Reset, and IRQ/BRK (Interrupt Request/Break) routines. These vectors point to specific code locations that handle these events.

  ```plaintext
  +----------+---------------------------------------------+
  | Address  | Vector                                      |
  +----------+---------------------------------------------+
  | $FFFA    | NMI Vector (points to nmi)                  |
  | $FFFC    | Reset Vector (points to start)              |
  | $FFFE    | IRQ/BRK Vector (points to irq)              |
  +----------+---------------------------------------------+
  ```

#### Additional Included Segments

- **"RODATA" Segment**:  
  Contains read-only data, such as the music and sound effect data included from external files (`music.s` and `sounds.s`).

- **"SAMPLES" Segment**:  
  Reserved for including DPCM samples, though it is commented out in this file.

- **"CHARS" Segment**:  
  Contains character data (graphics), included from the `chr_default.s` file.

### Summary

The `crt0.s` file is essential for setting up the NES environment, handling the MMC3 mapper configuration, initializing the PPU, and preparing the system for the execution of the main program. It ensures that all necessary hardware components are correctly configured and that memory is cleared and ready for use, providing a stable and consistent starting point for NES games.