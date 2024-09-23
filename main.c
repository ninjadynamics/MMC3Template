/* - - - - - - - - - - - - - - - - - - */
/* Necessary for 8bitworkshop          */
/* - - - - - - - - - - - - - - - - - - */
//
#define LIBARGS nes.lib
#define CFGFILE mmc3.cfg
//
//#resource "mmc3.cfg"
//#resource "neslib.s"
//#resource "famitone2.s"
//#resource "chr_default.s"
//
//#resource "music.s"
//#resource "sounds.s"
//#resource "music_themoon.s"
//#resource "music_journey.s"
//#resource "music_shatterhand.s"
//#resource "music_farewell.s"
//#resource "music_dedricil.s"
//#resource "music_rain.s"
//#resource "sfx.s"
//
//#link "mouse.c"
//#link "mmc3.c"
//#link "crt0.s"
//
/* - - - - - - - - - - - - - - - - - - */

#include "core.h"
#include "mmc3.h"
#include "neslib.h"
#include "mouse.h"

// Gamepad readings
static byte pt, pp;

// Player sprite
static uint8_t px, py;

void __fastcall__ show_status(void) {
  #define X(x) (x * 8)
  #define Y(y) (y * 8) - 1
  uint8_t v[3];

  // Show mouse coordinates
  // - - - - - - - - - - - - - - - - - -
  v[0] = '0' + (mouse.x / 100);
  v[1] = '0' + (mouse.x % 100 / 10);
  v[2] = '0' + (mouse.x % 10);
  oam_spr(X(4), Y(2), v[0], 1);
  oam_spr(X(5), Y(2), v[1], 1);
  oam_spr(X(6), Y(2), v[2], 1);
  // - - - - - - - - - - - - - - - - - -
  v[0] = '0' + (mouse.y / 100);
  v[1] = '0' + (mouse.y % 100 / 10);
  v[2] = '0' + (mouse.y % 10);
  oam_spr(X(4), Y(4), v[0], 1);
  oam_spr(X(5), Y(4), v[1], 1);
  oam_spr(X(6), Y(4), v[2], 1);

  // Show mouse button presses
  // - - - - - - - - - - - - - - - - - -
  oam_spr(X(25), Y(2), mouse.left.press * 0x7F, 3);
  oam_spr(X(28), Y(2), mouse.right.press * 0x7F, 2);

  // Show gamepad status
  // - - - - - - - - - - - - - - - - - -
  oam_spr(X(20), Y(24), 0x1C, 2 * to_bool(pp & PAD_UP    ));
  oam_spr(X(20), Y(26), 0x1D, 2 * to_bool(pp & PAD_DOWN  ));
  oam_spr(X(19), Y(25), 0x1E, 2 * to_bool(pp & PAD_LEFT  ));
  oam_spr(X(21), Y(25), 0x1F, 2 * to_bool(pp & PAD_RIGHT ));
  oam_spr(X(23), Y(25), 0x1B, 2 * to_bool(pp & PAD_SELECT));
  oam_spr(X(25), Y(25), 0x1A, 2 * to_bool(pp & PAD_START ));
  oam_spr(X(27), Y(25), 0x42, 2 * to_bool(pp & PAD_B     ));
  oam_spr(X(29), Y(25), 0x41, 2 * to_bool(pp & PAD_A     ));
  #undef X
  #undef Y
}

void __fastcall__ show_player_sprite(void) {
  if (pp & PAD_RIGHT) ++px; else if (pp & PAD_LEFT) --px;
  if (pp & PAD_DOWN ) ++py; else if (pp & PAD_UP  ) --py;
  oam_spr(px, py, 0xB1, 3);
}

void __fastcall__ show_cursor(void) {
  oam_spr(mouse.x, mouse.y - 1, 0x80, 0);
}

void main(void) {

  const unsigned char pal[16]={
    0x0f,0x00,0x10,0x30,
    0x0f,0x0c,0x21,0x32,
    0x0f,0x05,0x16,0x27,
    0x0f,0x1b,0x2a,0x39
  };

  // Set the palettes
  pal_bg(pal);
  pal_spr(pal);

  // Clear sprites
  oam_clear();

  // Set default tilesets
  chr_bg   = CHR_DEFAULT;
  chr_spr  = CHR_DEFAULT;

  // Load tilesets
  mmc3_setup();

  // Init bank swapping
  active_data_bank_index = 0;
  active_code_bank_index = 0;
  active_data_bank[0] = 0;
  active_code_bank[0] = 0;

  // Initialize sound
  FAMITONE_MUSIC_INIT(NULL);
  FAMITONE_SFX_INIT(NULL);

  // Draw static text
  #define TEXT "X:"
  vram_adr(NTADR_A(2, 2));
  vram_write(TEXT, sizeof(TEXT));
  #undef TEXT

  #define TEXT "Y:"
  vram_adr(NTADR_A(2, 4));
  vram_write(TEXT, sizeof(TEXT));
  #undef TEXT

  #define TEXT "[ ][ ]"
  vram_adr(NTADR_A(24, 2));
  vram_write(TEXT, sizeof(TEXT));
  #undef TEXT

  #define TEXT "HELLO WORLD!"
  vram_adr(NTADR_A(2, 25));
  vram_write(TEXT, sizeof(TEXT));
  #undef TEXT

  // Enable rendering
  ppu_on_all();

  // Set mouse/player positions
  #define MIDDLE_SCREEN_X (256 / 2) - 4
  #define MIDDLE_SCREEN_Y (240 / 2) - 4
  px = MIDDLE_SCREEN_X;
  py = MIDDLE_SCREEN_Y + 32;
  mouse_init(MIDDLE_SCREEN_X, MIDDLE_SCREEN_Y);
  #undef MIDDLE_SCREEN_X
  #undef MIDDLE_SCREEN_Y

  // The main loop
  while (1) {
    // Clear sprites
    oam_clear();

    // Read the mouse after the controller
    mouse_update(); // Assuming it's connected on port 2

    // Read controller before the mouse
    pt = pad_trigger(PAD_1);
    pp = pad_poll(PAD_1);

    // Display mouse cursor
    show_cursor();

    // Display player sprite
    show_player_sprite();

    // Display mouse/controller status
    show_status();

    // Wait for next frame
    ppu_wait_nmi();
  }
}
