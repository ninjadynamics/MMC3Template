#include "mouse.h"

void __fastcall__ mouse_init(uint8_t x, uint8_t y) {
  mouse.x = x;
  mouse.y = y;
  mouse_mask = 1;
}
