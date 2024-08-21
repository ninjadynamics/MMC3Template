#include "mouse.h"
#include <peekpoke.h>

#define LATCH_PORT 0x4016
#define DATA_PORT1 0x4016
#define DATA_PORT2 0x4017

// If the mouse is connected on the second
// controller port, use DATA_PORT2 instead
#define MOUSE_PORT DATA_PORT1

#pragma bss-name (push, "ZEROPAGE")
uint8_t mouse_x;
uint8_t mouse_y;
bool mouse_left;
bool mouse_right;
#pragma bss-name (pop)

#pragma bss-name (push, "ZEROPAGE")
static uint8_t new_x, new_y;
static int8_t x_velocity;
static int8_t y_velocity;
static uint8_t report[4];
static uint8_t i, t, bit;
#pragma bss-name (pop)

void __fastcall__ init_mouse(uint8_t x, uint8_t y) {
  mouse_x = x;
  mouse_y = y;
}

bool __fastcall__ read_mouse(void) {
  // Latch the data by turning the latch on and off
  POKE(LATCH_PORT, 1);
  POKE(LATCH_PORT, 0);

  // Read 32 bits from the mouse into the report array
  for (i = 0; i < 32; ++i) {
    // Shift and insert bit into the correct byte
    bit = PEEK(MOUSE_PORT) & 0x01; t = i >> 3;
    report[t] = (report[t] << 1) | bit;
  }

  // Check if the mouse is connected
  if ((report[1] & 0x0F) != 0x01) return false;

  // Extract button states
  mouse_left = (report[1] >> 6) & 0x01;
  mouse_right = (report[1] >> 7) & 0x01;

  // Convert vertical displacement to two's complement
  y_velocity = report[2] & 0x7F;
  if (report[2] & 0x80) {
    y_velocity = -y_velocity;
  }

  // Convert horizontal displacement to two's complement
  x_velocity = report[3] & 0x7F;
  if (report[3] & 0x80) {
    x_velocity = -x_velocity;
  }

  // At this point, x_velocity and y_velocity contain the displacement values
  // left_button and right_button contain the button states (1 = pressed, 0 = not pressed)

  // Update the cursor X position
  if (x_velocity) {
    new_x = mouse_x + x_velocity;
    if (x_velocity > 0) {
      mouse_x = new_x < MAX_X && new_x > mouse_x ? new_x : MAX_X;
    }
    else {
      mouse_x = new_x > MIN_X && new_x < mouse_x ? new_x : MIN_X;
    }
  }

  // Update the cursor Y position
  if (y_velocity) {
    new_y = mouse_y + y_velocity;
    if (y_velocity > 0) {
      mouse_y = new_y < MAX_Y && new_y > mouse_y ? new_y : MAX_Y;
    }
    else {
      mouse_y = new_y > MIN_Y && new_y < mouse_y ? new_y : MIN_Y;
    }
  }

  // Done
  return true;
}
