# mouse.c

## Overview

The NES MMC3 Mouse Module provides functionality to integrate and manage a mouse peripheral (SNES/Hyperkin) within NES projects utilizing the MMC3 mapper. This module handles mouse initialization, state updates, and interaction, enabling precise cursor control and button handling. It is designed to work seamlessly alongside standard NES controllers, with specific requirements for the order of input reading to ensure accurate mouse data processing.

## Table of Contents

1. [Module Components](#module-components)
   - [Constants](#constants)
   - [Data Structures](#data-structures)
2. [Function Reference](#function-reference)
   - [Initialization](#initialization)
   - [State Management](#state-management)
3. [Usage Guidelines](#usage-guidelines)
   - [Integration with Main Program](#integration-with-main-program)
   - [Input Reading Order](#input-reading-order)
4. [Example Usage](#example-usage)
5. [Additional Notes](#additional-notes)

---

## Module Components

### Constants

The module defines the following constants to constrain mouse movement within the NES screen boundaries:

- **`MIN_X`**: Minimum X-coordinate value for the mouse cursor.  
  ```c
  #define MIN_X 1
  ```
  
- **`MAX_X`**: Maximum X-coordinate value for the mouse cursor.  
  ```c
  #define MAX_X 255
  ```
  
- **`MIN_Y`**: Minimum Y-coordinate value for the mouse cursor.  
  ```c
  #define MIN_Y 1
  ```
  
- **`MAX_Y`**: Maximum Y-coordinate value for the mouse cursor.  
  ```c
  #define MAX_Y 239
  ```

### Data Structures

#### `MouseButton`

Represents the state of a mouse button.

```c
typedef struct MouseButton {
  bool press;  // Indicates if the button is currently pressed
  bool click;  // Indicates if the button was clicked (pressed in the current update cycle)
} MouseButton;
```

- **Fields:**
  - `press`: `true` if the button is held down; `false` otherwise.
  - `click`: `true` if the button was clicked during the latest update cycle; `false` otherwise.

#### `Mouse`

Encapsulates the overall state of the mouse, including position, button states, and connection status.

```c
typedef struct Mouse {
  uint8_t x, y;           // Current X and Y coordinates of the mouse cursor
  MouseButton left;      // State of the left mouse button
  MouseButton right;     // State of the right mouse button
  bool connected;        // Connection status of the mouse
} Mouse;
```

- **Fields:**
  - `x`, `y`: Current position of the mouse cursor on the screen.
  - `left`, `right`: Instances of `MouseButton` representing the left and right mouse buttons.
  - `connected`: `true` if the mouse is connected and functioning; `false` otherwise.

### External Variables

- **`mouse`**: An instance of the `Mouse` structure representing the current state of the mouse.
  ```c
  extern Mouse mouse;
  ```

## Function Reference

### Initialization

#### `mouse_init`

Initializes the mouse module by setting the initial cursor position and clearing the mouse state.

```c
extern void __fastcall__ mouse_init(uint8_t x, uint8_t y);
```

- **Parameters:**
  - `x`: Initial X-coordinate for the mouse cursor.
  - `y`: Initial Y-coordinate for the mouse cursor.

- **Description:**
  Sets the mouse's initial position to the specified `x` and `y` coordinates and clears any existing mouse state, ensuring a fresh start for mouse interaction.

### State Management

#### `mouse_clear`

Resets the mouse button states, indicating that no buttons are pressed or clicked.

```c
extern void __fastcall__ mouse_clear(void);
```

- **Description:**
  Clears the current state of both left and right mouse buttons, setting `press` and `click` flags to `false`.

#### `mouse_update`

Updates the mouse state by reading data from the mouse hardware, processing movement and button states.

```c
extern void __fastcall__ mouse_update(void);
```

- **Description:**
  - **Data Latching:** Initiates data latching by toggling the latch port, ensuring that a fresh set of mouse data is ready for reading.
  - **Data Reading:** Reads 32 bits of data from the mouse port into the `report` array, handling each byte individually.
  - **Connection Check:** Verifies if the mouse is properly connected by inspecting specific bits in the report data.
  - **Button States:** Updates the `press` and `click` states for both left and right mouse buttons based on the latest data.
  - **Velocity Calculation:** Calculates the X and Y velocity (displacement) from the report data, converting from two's complement if necessary.
  - **Position Update:** Adjusts the mouse cursor's position (`mouse.x` and `mouse.y`) based on the calculated velocities, ensuring the cursor remains within defined screen boundaries.
  - **Connection Status:** Sets `mouse.connected` to `true` if data was successfully read and processed; otherwise, sets it to `false`.

---

## Usage Guidelines

### Integration with Main Program

To effectively utilize the mouse module within your NES project, follow these integration steps:

1. **Include Headers:**
   Ensure that `mouse.h` is included in your main program source file.
   ```c
   #include "mouse.h"
   ```

2. **Initialize Mouse:**
   Call `mouse_init` during the initial setup phase to set the starting position of the mouse cursor.
   ```c
   mouse_init(initial_x, initial_y);
   ```

3. **Update Mouse State:**
   In your main loop, invoke `mouse_update` to refresh the mouse state based on the latest hardware input.
   ```c
   while (1) {
     mouse_update();
     // ... other code ...
   }
   ```

4. **Handle Mouse Data:**
   After updating, utilize the `mouse` structure to access the current cursor position and button states for rendering or game logic.

### Input Reading Order

**Critical:** The mouse data must be read **before** reading any controller inputs. This order is essential to ensure accurate and timely processing of mouse data. Reading the mouse first prevents controller input routines from inadvertently interfering with the mouse data stream.

**Implementation Example:**

```c
while (1) {
  oam_clear();

  // Update mouse state first
  mouse_update();

  // Then read controller inputs
  pt = pad_trigger(PAD_1);
  pp = pad_poll(PAD_1);

  // Proceed with rendering and game logic
  show_cursor();
  show_player_sprite();
  show_status();

  ppu_wait_nmi();
}
```

---

## Example Usage

Below is a simplified example demonstrating how to integrate and utilize the MMC3 Mouse Module within a main program:

```c
#include "core.h"
#include "mmc3.h"
#include "neslib.h"
#include "mouse.h"

// Main function
void main(void) {
  // Initialize graphics, sound, etc.
  // ...

  // Initialize mouse at the center of the screen
  mouse_init(128, 120);

  // Enable rendering
  ppu_on_all();

  // Main loop
  while (1) {
    // Clear previous sprites
    oam_clear();

    // Update mouse state before reading controller
    mouse_update();

    // Read controller inputs
    pt = pad_trigger(PAD_1);
    pp = pad_poll(PAD_1);

    // Render mouse cursor
    show_cursor();

    // Render player sprite based on controller input
    show_player_sprite();

    // Display status information
    show_status();

    // Wait for the next frame
    ppu_wait_nmi();
  }
}
```

**Key Points:**

- **Initialization:** The mouse is initialized at coordinates `(128, 120)`, positioning it at the center of a standard NES screen.
- **Update Sequence:** `mouse_update()` is called **before** any controller input functions (`pad_trigger` and `pad_poll`), adhering to the required input reading order.
- **Rendering:** Functions like `show_cursor()`, `show_player_sprite()`, and `show_status()` utilize the updated mouse state to render visuals and handle game logic accordingly.

---

## Additional Notes

- **Port Configuration:** By default, the mouse is connected to `DATA_PORT2` (0x4017). If your setup requires a different port or autodetection, consider modifying the `MOUSE_PORT` definition or implementing additional logic to handle port configuration dynamically.

  ```c
  #define MOUSE_PORT DATA_PORT2
  ```

- **Compatibility:** The `mouse_update` function includes specific handling to ensure compatibility with Hyperkin mice. Ensure that your mouse hardware aligns with these compatibility requirements or adjust the implementation as necessary.

- **Performance Considerations:** The `mouse_update` function uses inline assembly to efficiently read and process mouse data. This approach minimizes CPU cycles and ensures timely updates, which is crucial for maintaining responsive cursor movement and button handling within the NES's limited processing environment.

- **Memory Management:** The module utilizes the "ZEROPAGE" memory section for variables like `new_x`, `new_y`, `x_velocity`, `y_velocity`, and `report` to optimize access speed. Ensure that your project configuration supports zero-page memory allocation as used in this module.

- **Extensibility:** While the current implementation supports basic mouse functionality, consider extending the module to handle additional mouse buttons or enhanced features like scroll wheels if your hardware and project requirements necessitate such capabilities.
