# core.h

The `core.h` header file defines a collection of constants, macros, and functions tailored for NES development using the cc65 compiler suite, emphasizing bank switching and data handling in a game environment that uses the MMC3 mapper.

#### Constants Definitions

- **CHR Banks:**
  - `CHR_DEFAULT`: Default CHR bank index (0).

- **Data Banks:**
  - `DATA_00` to `DATA_16`: Constants representing data bank indices, ranging from 0 to 16.

- **Music Banks:**
  - `MUSIC_01` to `MUSIC_04`: Constants representing music bank indices from 17 to 20.

- **Sound Effect Banks:**
  - `SOUND_01` to `SOUND_04`: Constants representing sound effect bank indices from 21 to 24.

- **Code Banks:**
  - `CODE_XTD` to `CODE_EX1`: Constants representing extended code bank indices from 52 to 61.

#### Macros Definitions

- **Stack Operations:**
  - `PUSH(s, v)`: Pushes value `v` onto stack `s`.
  - `POP(s)`: Pops the top value from stack `s`.
  - `TOP(s)`: Retrieves the top value from stack `s` without popping.
  - `IS_EMPTY(s)`: Checks if stack `s` is empty.
  - `IS_NOT_EMPTY(s)`: Checks if stack `s` is not empty.
  - Stack operations are also defined for 2D arrays.

- **Utility Macros:**
  - Arithmetic operations for multiplication and division optimized by using shifts for powers of two (`MUL8`, `DIV8`, `UDIV8`, etc.).
  - `SYM_RAND(x)`: Generates a symmetrically distributed random number around zero up to `x`.
  - `ROUND_UP(n, s)`: Rounds `n` up to the nearest multiple of `s`.
  - `OBJECT(p, i)`: Accesses object `i` from pointer `p`.
  - `MATRIX(p, x, y, len)`: Accesses a matrix element at position `(x, y)` with row length `len`.
  - Bit manipulation (`BIT_ON`, `BIT_OFF`, `BIT_VALUE`, `BIT_TOGGLE`).
  - `PERCENT(x, p)`: Computes `p` percent of `x`.

- **LOOP and ARRAY Initialization Macros:**
  - Constructs to define and iterate over small arrays or execute a block of code a fixed number of times using recursion-like macro expansion.

- **Banked Operation Macros (Famitone2):**
  - `FAMITONE_MUSIC_INIT`, `FAMITONE_SFX_INIT`, etc.: Macros to initialize and control music and sound effects, ensuring operations are performed within the correct memory bank.
  - `CALL(_BANK, _FN)`, `CALL_WITH_ARGS(_BANK, _FN, ...)`: Macros to execute functions in specific memory banks, useful for managing code that exceeds the 6502 processor's addressing capabilities.

- **Banking Macros:**
  - `PUSH_CODE_BANK`, `POP_CODE_BANK`: Push and pop code banks for dynamic memory bank switching.

#### Summary

`core.h` facilitates complex memory management and function execution in constrained environments like the NES, where managing memory banks and handling program flow efficiently is crucial. The macros provide a robust toolkit for handling common tasks in NES development, such as memory bank switching, stack manipulations, and optimized mathematical operations. The header's design ensures that it can be easily integrated into larger projects that require dynamic data handling and code execution across different regions of memory.