MMC3 Template
=====

[Open this project in 8bitworkshop](http://8bitworkshop.com/redir.html?platform=nes&githubURL=https%3A%2F%2Fgithub.com%2Fninjadynamics%2FMMC3Template&file=main.c).

#### Introduction

This is a template designed for developing NES (Nintendo Entertainment System) games using the MMC3 memory mapper. The MMC3 mapper is one of the most advanced mappers used in NES cartridges, allowing for extensive bank switching, IRQ handling, and more complex games that go beyond the limitations of the basic NES hardware. This template leverages the cc65 compiler suite and integrates with various tools and libraries, including FamiTone2 for sound and neslib for basic NES functions.

#### Project Components

1. **Configuration Files:**
   - **MMC3 Configuration (`mmc3.cfg`)**: Defines the memory layout, symbol declarations, and segment mapping necessary for linking the game. This file organizes the ROM and RAM addresses, manages CHR and PRG banks, and configures the NES header. The memory map allows for efficient bank switching, critical for MMC3's capabilities.
   - **Startup Code (`crt0.s`)**: Handles the NES initialization process, including setting up the PPU, clearing RAM and VRAM, and configuring the MMC3 mapper. It ensures that the NES environment is properly prepared before the main game logic begins execution.

2. **Header Files:**
   - **Core Header (`core.h`)**: Defines key macros, constants, and utility functions used throughout the project. It includes definitions for CHR, data, music, sound effect banks, and various stack operations and bit manipulation utilities. This file serves as a backbone for memory management and game logic.
   - **MMC3 Header (`mmc3.h`)**: Contains macros and functions specific to interacting with the MMC3 mapper, such as bank switching and IRQ management. It also declares variables that are used across different parts of the program to maintain the current state of the MMC3 mapper.

3. **C Source Files:**
   - **MMC3 Implementation (`mmc3.c`)**: Provides the actual implementation of the functions declared in `mmc3.h`. This includes loading CHR data, setting up the MMC3 mapper, managing bank switching, and updating the FamiTone sound engine during NMI (Non-Maskable Interrupt) events.
   - **Main Program (`main.c`)**: The entry point of the game, initializing the NES environment, setting up palettes, sound, and the MMC3 mapper, and running the main game loop. It serves as a starting point for game development, with placeholders for game logic.

4. **Sound and Music:**
   - The project includes sound and music files managed by FamiTone2, a sound engine optimized for NES. The integration is handled through macros in `core.h` and functions in `mmc3.c`, allowing seamless bank switching and playback of music and sound effects.

5. **Graphics:**
   - **Character ROM (`chr_default.s`)**: Stores the default CHR data, which contains the tile graphics used by the game. The MMC3 mapper allows dynamic switching of these tiles during gameplay, providing a richer graphical experience.

#### Project Workflow

1. **Initialization:**
   - The NES initializes with `crt0.s`, setting up the hardware and the MMC3 mapper. This involves configuring the PPU, clearing RAM/VRAM, and establishing the initial memory bank setup.
   - The MMC3 mapper is configured to handle both PRG (Program ROM) and CHR (Character ROM) banks, enabling dynamic code and data loading as the game progresses.

2. **Graphics Setup:**
   - `main.c` configures the NES palettes and loads the default CHR tilesets into the appropriate memory banks. This setup ensures that both background and sprite graphics are ready for rendering.
   - The PPU is then turned on, and the initial game screen is displayed.

3. **Sound Setup:**
   - The FamiTone2 sound engine is initialized, preparing the system to play music and sound effects. This setup involves bank switching to ensure the correct sound data is loaded and ready for use.

4. **Main Game Loop:**
   - The main game loop in `main.c` runs continuously, handling player input, game logic, rendering updates, and sound playback. Although the loop is currently empty, it is designed to be populated with the game’s core mechanics.

5. **Bank Switching:**
   - Throughout the game, bank switching is used to load different parts of the program and data into the NES’s limited addressable memory space. This is managed through macros and functions defined in `core.h` and `mmc3.c`.

6. **IRQ Handling:**
   - The MMC3’s IRQ capabilities are leveraged to manage complex tasks like scrolling and split-screen effects, which are crucial for many NES games. This is controlled through the functions and macros in `mmc3.h` and implemented in `mmc3.c`.

#### Key Features

- **Memory Management**: The project provides a robust system for managing the NES’s limited memory through efficient use of bank switching, allowing for larger and more complex games.
- **Graphics Handling**: It includes a basic system for managing CHR banks, enabling dynamic loading of tile graphics during gameplay.
- **Sound Integration**: FamiTone2 integration allows for advanced sound capabilities, including music and sound effects, with support for both NTSC and PAL formats.
- **Modularity**: The project is highly modular, with clear separation between initialization, core functionality, and game logic. This design makes it easier to extend and modify the template for specific game projects.

#### Conclusion

This template aims at being a comprehensive starting point for developing NES games that utilize the MMC3 mapper. It combines efficient memory management, robust sound integration, and flexible graphics handling, all within a well-structured codebase. This template is ideal for developers looking to create sophisticated NES games that push the limits of the original hardware.