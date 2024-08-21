#ifndef _MOUSE_H
#define _MOUSE_H

#include "core.h"

#define MIN_X   1
#define MAX_X 255
#define MIN_Y   1
#define MAX_Y 239

extern uint8_t mouse_x;
#pragma zpsym("mouse_x")
extern uint8_t mouse_y;
#pragma zpsym("mouse_y")

extern bool mouse_left;
#pragma zpsym("mouse_left")
extern bool mouse_right;
#pragma zpsym("mouse_right")

extern void __fastcall__ init_mouse(uint8_t x, uint8_t y);
extern bool __fastcall__ read_mouse(void);

#endif // mouse.h