# mouse.c

The `mouse` module provides functionality to interface with a mouse peripheral on an NES system. It includes initialization, updating the mouse state, and handling both click and press events for the left and right mouse buttons. The module is designed to work with a mouse connected to either the first or second controller port.

## API Reference

### Data Structures

- **`MouseButton`**: Represents the state of a mouse button.
    - `bool press`: Indicates if the button is currently pressed.
    - `bool click`: Indicates if the button was clicked (pressed down after being released).

- **`Mouse`**: Represents the overall mouse state.
    - `uint8_t x`: The current X position of the mouse cursor.
    - `uint8_t y`: The current Y position of the mouse cursor.
    - `MouseButton left`: State of the left mouse button.
    - `MouseButton right`: State of the right mouse button.
    - `bool connected`: Indicates if the mouse is currently connected.

### Constants

- `MIN_X`, `MAX_X`: The minimum and maximum X coordinates for the mouse cursor.
- `MIN_Y`, `MAX_Y`: The minimum and maximum Y coordinates for the mouse cursor.

### Global Variables

- `Mouse mouse`: An instance of the `Mouse` structure that holds the current state of the mouse. This variable is available globally and is placed in the zero-page memory for faster access.

### Functions

- **`void __fastcall__ mouse_init(uint8_t x, uint8_t y);`**

    Initializes the mouse with a starting position. This function sets the initial cursor position and clears the mouse button states.

    - `x`: Initial X position of the mouse cursor.
    - `y`: Initial Y position of the mouse cursor.

- **`void __fastcall__ mouse_clear(void);`**

    Clears the mouse button states. This function is typically used during initialization to reset the `press` and `click` states of both left and right mouse buttons.

- **`void __fastcall__ mouse_update(void);`**

    Updates the mouse state by reading data from the mouse peripheral. This function should be called regularly (e.g., once per frame) to ensure the mouse state is kept up to date.

    - It reads 32 bits of data from the mouse, updates the cursor position, and checks the button states.
    - Sets the `connected` flag in the `Mouse` structure to indicate whether the mouse is properly connected and recognized.

## Usage

1. **Initialization**:

    Before using the mouse, initialize it with a starting position:

    ```c
    mouse_init(128, 120); // Initializes mouse at the center of the screen (x=128, y=120)
    ```

2. **Updating the Mouse State**:

    Call `mouse_update()` once per frame to update the mouse state. This function will handle reading data from the mouse, updating the cursor position, and detecting button presses and clicks.

    ```c
    while (1) {
        mouse_update();
        
        // Use mouse.x, mouse.y for cursor position
        // Use mouse.left.press, mouse.left.click for left button state
        // Use mouse.right.press, mouse.right.click for right button state

        // Example: Check for left click
        if (mouse.left.click) {
            // Handle left click event
        }
        
        // Other game logic...
    }
    ```

3. **Clearing Mouse State**:

    If you need to reset the mouse button states, use `mouse_clear()`:

    ```c
    mouse_clear();
    ```

## Internal Functionality

- **Port Latching**: The `mouse_update()` function begins by latching the data by writing to the `LATCH_PORT` (always `0x4016`), which tells the mouse to prepare its data for reading.
  
- **Data Reading**: The mouse data is read using the `PEEK()` function to get the data from either `DATA_PORT1` or `DATA_PORT2`, depending on the port the mouse is connected to. The `MOUSE_PORT` macro is used to determine which port to read from. This macro can be adjusted to switch between ports.

- **Button and Click Detection**: The module keeps track of both the press and click states of the left and right mouse buttons. A click is detected when a button press is registered after the button was previously released.

- **Cursor Movement**: The cursor position is updated based on the displacement values read from the mouse. The position is bounded by `MIN_X`, `MAX_X`, `MIN_Y`, and `MAX_Y` to keep the cursor within the screen.

## Port Configuration

- **MOUSE_PORT**: By default, `MOUSE_PORT` is set to `DATA_PORT1`. To switch to port 2, change this definition to `DATA_PORT2`. This change will affect where `mouse_update()` reads the mouse data from.

```c
#define MOUSE_PORT DATA_PORT2 // Use this to switch to the second port
```

## Example

Here is an example of how to use the mouse module in a typical game loop:

```c
#include "mouse.h"

void main(void) {
    // Initialize mouse at position (128, 120)
    mouse_init(128, 120);
    
    // Main game loop
    while (1) {
        mouse_update(); // Update mouse state
        
        // Use mouse coordinates
        uint8_t cursor_x = mouse.x;
        uint8_t cursor_y = mouse.y;
        
        // Handle mouse click
        if (mouse.left.click) {
            // Perform action on left click
        }
        
        // Other game logic...

        // Wait for the next frame
        // wait_for_vsync();
    }
}
```

## Notes

- The mouse module uses unrolled loops and assembly NOP instructions to ensure proper timing when reading from the mouse. This ensures compatibility with different mouse models, including the Hyperkin mouse.
- The module currently assumes the mouse is connected to port 1. To use port 2, change the `MOUSE_PORT` definition or introduce a configuration setting to select the port at runtime.
- This module is designed for the NES environment, where direct hardware access and precise timing are critical.

## Conclusion

The `mouse` module provides a simple and efficient way to handle mouse input on an NES system. It abstracts the complexity of reading raw mouse data, offering easy-to-use functions and structures for managing mouse state. This documentation should provide sufficient information for integrating and using the mouse module in your NES projects.
