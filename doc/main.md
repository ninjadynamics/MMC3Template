# main.c

The `main.c` file is the primary entry point for the NES program, responsible for initializing the game environment, setting up graphics, sound, and handling the main game loop. It is designed to work with the MMC3 mapper and leverages the `core.h`, `mmc3.h`, and `neslib.h` libraries for various functionalities.

#### 8bitworkshop Integration

The initial section includes directives necessary for the 8bitworkshop platform, which is an online IDE for retro game development.

- **LIBARGS, CFGFILE**: Specifies the library (`nes.lib`) and configuration file (`mmc3.cfg`) used for compiling the program.
- **#resource and #link**: These directives manage the inclusion of various resources and files, such as configuration files, libraries, and sound/music assets. These are necessary for the build process but are commented out, likely for documentation purposes or because they are automatically handled by the 8bitworkshop environment.

#### Main Function

The `main` function is where the initialization and primary game loop are defined.

- **Palette Initialization:**
  ```c
  const unsigned char pal[16] = {
    0x0f, 0x00, 0x10, 0x30,
    0x0f, 0x0c, 0x21, 0x32,
    0x0f, 0x05, 0x16, 0x27,
    0x0f, 0x0b, 0x1a, 0x29
  };
  ```
  This array defines the color palette used by the NES for backgrounds and sprites. The palette is organized into four sets of four colors, which will be applied to both the background and sprites.

- **Setting Palettes:**
  ```c
  pal_bg(pal);
  pal_spr(pal);
  ```
  These functions set the background (`pal_bg`) and sprite (`pal_spr`) palettes using the values defined in the `pal` array.

- **Clearing Sprites:**
  ```c
  oam_clear();
  ```
  Clears all Object Attribute Memory (OAM) entries, effectively removing any sprites currently on screen.

- **Setting Default Tilesets:**
  ```c
  chr_bg = CHR_DEFAULT;
  chr_spr = CHR_DEFAULT;
  ```
  Initializes the CHR (Character) banks for background and sprites to the default tileset.

- **MMC3 Setup:**
  ```c
  mmc3_setup();
  ```
  Calls `mmc3_setup()` to initialize the MMC3 mapper, load the CHR data into the correct memory banks, and set up the PPU (Picture Processing Unit) control registers.

- **Bank Swapping Initialization:**
  ```c
  active_data_bank_index = 0;
  active_code_bank_index = 0;
  active_data_bank[0] = 0;
  active_code_bank[0] = 0;
  ```
  Initializes the indices and arrays that manage the active data and code banks. These are used to dynamically switch memory banks as the game runs.

- **Sound Initialization:**
  ```c
  FAMITONE_MUSIC_INIT(NULL);
  FAMITONE_SFX_INIT(NULL);
  ```
  Initializes the FamiTone sound engine for music and sound effects. The `NULL` argument suggests that no specific sound data is being loaded at this point, likely serving as a placeholder or for initial setup.

- **Drawing Message:**
  ```c
  vram_adr(NTADR_A(2,2));
  vram_write("HELLO, WORLD!", 13);
  ```
  This sequence writes the message "HELLO, WORLD!" to the screen at coordinates (2, 2) in the name table, using `vram_adr` to set the address and `vram_write` to write the text.

- **Enabling Rendering:**
  ```c
  ppu_on_all();
  ```
  Enables rendering on the NES, allowing the graphics to be displayed. This turns on the PPU, enabling background and sprite rendering.

- **Main Game Loop:**
  ```c
  while (1) {
    // ...
  }
  ```
  The infinite loop represents the main game loop where game logic, input handling, and rendering updates would occur. The body of the loop is currently empty, implying that this is either a template or a starting point for further development.

### Summary

The `main.c` file serves as the foundational setup for an NES game, initializing the system's palette, memory banks, graphics, and sound. It is designed to work with the MMC3 mapper, which allows for more advanced memory management on the NES. The main game loop is left empty, providing a basic structure upon which the game's functionality can be built.