# mmc3.h

The `mmc3.h` header file provides macros, constants, and function declarations to interface with the MMC3 mapper for NES games. The MMC3 mapper is responsible for bank switching and IRQ handling, which allows for more complex and dynamic NES games by expanding memory capabilities beyond the original hardware limits.

#### Constants and Macros

- **MMC_MODE**:  
  Defines the MMC3 mode, which is used in bank switching. The value `0x80` corresponds to a specific bit setting that must match the A12 inversion logic in `crt0.s`.

- **MMC3_SET_REG(r, n)**:  
  A macro that sets a specific MMC3 register (`r`) to a value (`n`). This involves writing to the memory-mapped registers at `$8000` and `$8001`.

- **CHR Bank Switching Macros**:  
  These macros handle character (CHR) memory bank switching:
  - `MMC3_CHR_0000(n)`: Switches the CHR bank at `$0000`.
  - `MMC3_CHR_0800(n)`: Switches the CHR bank at `$0800`.
  - `MMC3_CHR_1000(n)`: Switches the CHR bank at `$1000`.
  - `MMC3_CHR_1400(n)`: Switches the CHR bank at `$1400`.
  - `MMC3_CHR_1800(n)`: Switches the CHR bank at `$1800`.
  - `MMC3_CHR_1C00(n)`: Switches the CHR bank at `$1C00`.

- **PPU_MASK_VALUE**:  
  Default value for the PPU (Picture Processing Unit) mask register.

- **PPU_MASK_VALUE_GRAYSCALE**:  
  Grayscale mode for the PPU, combining the default PPU mask with grayscale mode.

- **STROBE(addr)**:  
  A macro to send a strobe signal to a specific address, usually used in IRQ handling.

- **MMC3_IRQ Macros**:  
  These macros manage IRQ (Interrupt Request) handling for the MMC3:
  - `MMC3_IRQ_SET_VALUE(n)`: Sets the IRQ counter value.
  - `MMC3_IRQ_RELOAD()`: Reloads the IRQ counter.
  - `MMC3_IRQ_DISABLE()`: Disables IRQ.
  - `MMC3_IRQ_ENABLE()`: Enables IRQ.

#### Externally Declared Variables

These variables are declared in the zero page (a special memory area with faster access) for efficiency:

- **Banking Variables**:
  - `music_bank`, `sfx_bank`, `dpcm_bank`: Variables for storing the current music, sound effects, and DPCM (Delta Pulse Code Modulation) bank numbers.
  - `active_code_bank_index`, `active_data_bank_index`: Indices tracking the currently active code and data banks.
  - `active_code_bank[8]`, `active_data_bank[8]`: Arrays storing the active code and data banks.
  - `mmc3_mirroring`, `mmc3_register`, `mmc3_cpu_bank`, `mmc3_bank_num`: Variables related to MMC3 configuration and active registers.
  - `mmc3_last_register`, `mmc3_last_cpu_bank`: Variables storing the last used MMC3 register and CPU bank.

- **CHR (Character) Memory Variables**:
  - `chr_bg`, `chr_spr`: Variables holding the current CHR bank numbers for background and sprites.

#### Function Declarations

These functions manage MMC3 bank switching and IRQ handling:

- **mmc3_setup**:  
  Initializes the MMC3 mapper, sets up the PPU control register, loads CHR data, and enables CPU IRQ.

- **mmc3_load_chr**:  
  Loads the CHR data for sprites and background into the appropriate memory banks.

- **mmc3_famitone_update_nmi**:  
  Updates the FamiTone music engine and corrects the MMC3 bank registers after NMI (Non-Maskable Interrupt).

- **Bank Switching Functions**:
  - `mmc3_switch_data_bank`, `mmc3_push_data_bank`, `mmc3_pop_data_bank`: Functions to manage data bank switching.
  - `mmc3_push_code_bank`, `mmc3_pop_code_bank`: Functions to manage code bank switching.

- **Trampoline Functions**:  
  These functions ensure safe bank switching by always executing from the fixed bank:
  - `call`, `call_i8`, `call_ptr`, `call_u8`, `call_u8_u8`, `call_u8_u8_u8`, `call_u8_u8_u8_u8`, `call_u8_u8_u8_u8_u8`: Functions that handle banked function calls with various argument types.


# mmc3.c

The `mmc3.c` file provides the implementation for the functions declared in `mmc3.h`, managing bank switching and IRQ handling for games using the MMC3 mapper.

#### Global Variables

- **Banking Variables**:  
  Variables for managing active banks for music, sound effects, DPCM, and code/data swapping.

- **CHR Variables**:  
  `chr_bg` and `chr_spr` store the current CHR bank indices for background and sprites.

#### Function Implementations

- **mmc3_load_chr**:  
  Loads the current CHR banks for both background and sprite graphics using predefined macros.

- **mmc3_setup**:  
  Configures the MMC3 mapper by setting the PPU control register to differentiate between background and sprite patterns. It then loads the CHR data and enables IRQs.

- **mmc3_famitone_update_nmi**:  
  Updates the FamiTone engine during the NMI, ensuring that MMC3 registers are correctly set after the update.

- **Bank Switching Functions**:
  - `mmc3_push_data_bank`, `mmc3_pop_data_bank`: Pushes or pops the active data bank, ensuring that the current bank index is within valid bounds.
  - `mmc3_push_code_bank`, `mmc3_pop_code_bank`: Similar to data bank functions, but for code banks.

- **Trampoline Functions**:  
  These functions enable calling banked functions from the fixed bank, ensuring safe execution when switching banks.

- **Debug Mode**:  
  When `DEBUG` is defined, the `error` function provides debugging information in case of bank switching errors, displaying the register and bank values on the screen and halting execution.