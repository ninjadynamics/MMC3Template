// Uncomment to enable debug mode
// #define DEBUG

#include "mmc3.h"

#pragma bss-name (push, "ZEROPAGE")
uint8_t music_bank;
uint8_t sfx_bank;
uint8_t dpcm_bank;
uint8_t active_code_bank_index;
uint8_t active_data_bank_index;
uint8_t active_code_bank[8];
uint8_t active_data_bank[8];
uint8_t mmc3_mirroring;
uint8_t mmc3_register;
uint8_t mmc3_cpu_bank;
uint8_t mmc3_bank_num;
uint8_t mmc3_last_register;
uint8_t mmc3_last_cpu_bank;
#pragma bss-name (pop)

#pragma bss-name (push, "ZEROPAGE")
uint8_t chr_bg;
uint8_t chr_spr;
#pragma bss-name (pop)

void __fastcall__ mmc3_load_chr(void) {
  // Load sprite tileset
  MMC3_CHR_0000(chr_spr);
  MMC3_CHR_0800(chr_spr + 2);

  // Load background tileset
  MMC3_CHR_1000(chr_bg);
  MMC3_CHR_1400(chr_bg + 1);
  MMC3_CHR_1800(chr_bg + 2);
  MMC3_CHR_1C00(chr_bg + 3);
}

void __fastcall__ mmc3_setup(void) {
  // More accurate NES emulators simulate the mapper's
  // monitoring of the A12 line, so the background and
  // sprite pattern tables must be different.
  // https://forums.nesdev.com/viewtopic.php?f=2&t=19686#p257380
  set_ppu_ctrl_var(get_ppu_ctrl_var() | 0x08);

  // Load the tilesets
  mmc3_load_chr();

  // Enable CPU IRQ
  __asm__ ("cli");
}

void __fastcall__ mmc3_famitone_update_nmi(void) {
  // Play music and sfx
  famitone_update();

  // Fix things up
  POKE(0x8000, MMC_MODE | (mmc3_register));
  POKE(0x8001, mmc3_cpu_bank);
}

#ifdef DEBUG
#include <stdio.h>
void nop(void) {}
void __fastcall__ error(uint8_t r, uint8_t n) {
  char info[24];

  ppu_off();

  oam_clear();
  nmi_set_callback(nop);
  set_vram_update(NULL);

  MMC3_CHR_1000(CHR_TEXT_A    );
  MMC3_CHR_1400(CHR_TEXT_A + 1);
  MMC3_CHR_1800(CHR_TEXT_A + 2);
  MMC3_CHR_1C00(CHR_TEXT_A + 3);

  vram_adr(0x2000);
  vram_fill(NULL, 1024);
  pal_col(0,0x02); // set screen to dark blue
  pal_col(1,0x14); // fuchsia
  pal_col(2,0x20); // grey
  pal_col(3,0x30); // white

  snprintf(info, 24, "Reg: 0x%02X / Bank: 0x%02X", r, n);
  vram_adr(NTADR_A(2, 2));
  vram_write((String)"MMC3 BANK SWAP ERROR!", sizeof("MMC3 BANK SWAP ERROR!"));
  vram_adr(NTADR_A(2, 4));
  vram_write(info, sizeof(info));

  ppu_on_all();

  while(1);
}
#endif

void __fastcall__ mmc3_push_data_bank(void) {
  ++active_data_bank_index;
	#ifdef DEBUG
	if (active_data_bank_index >= 8) error(6, mmc3_bank_num);
	#endif
  active_data_bank[active_data_bank_index] = mmc3_bank_num;
  mmc3_register = 6;
  mmc3_cpu_bank = mmc3_bank_num;
  MMC3_SET_REG(6, mmc3_bank_num);
}

void __fastcall__ mmc3_push_code_bank(void) {
  ++active_code_bank_index;
	#ifdef DEBUG
	if (active_code_bank_index >= 8) error(6, mmc3_bank_num);
	#endif
  active_code_bank[active_code_bank_index] = mmc3_bank_num;
  mmc3_register = 7;
  mmc3_cpu_bank = mmc3_bank_num;
  MMC3_SET_REG(7, mmc3_bank_num);
}

void __fastcall__ mmc3_pop_data_bank(void) {
	#ifdef DEBUG
  if (active_data_bank_index == 0) error(6, mmc3_bank_num);
	#endif
  --active_data_bank_index;
  mmc3_bank_num = active_data_bank[active_data_bank_index];
  mmc3_register = 6;
  mmc3_cpu_bank = mmc3_bank_num;
  MMC3_SET_REG(6, mmc3_bank_num);
}

void __fastcall__ mmc3_pop_code_bank(void) {
	#ifdef DEBUG
  if (active_code_bank_index == 0) error(6, mmc3_bank_num);
	#endif
  --active_code_bank_index;
  mmc3_bank_num = active_code_bank[active_code_bank_index];
  mmc3_register = 7;
  mmc3_cpu_bank = mmc3_bank_num;
  MMC3_SET_REG(7, mmc3_bank_num);
}

// Trampoline functions - Banked calls must always come from the fixed bank
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

void __fastcall__ call(uint8_t bank, void (*fn)(void)) {
  CALL(bank, fn);
}

void __fastcall__ call_i8(uint8_t bank, void (*fn)(int8_t), int8_t i8) {
  CALL_WITH_ARGS(bank, fn, i8);
}

void __fastcall__ call_ptr(uint8_t bank, void (*fn)(void*), void * ptr) {
  CALL_WITH_ARGS(bank, fn, ptr);
}

void __fastcall__ call_u8(uint8_t bank, void (*fn)(uint8_t), uint8_t a8) {
  CALL_WITH_ARGS(bank, fn, a8);
}

void __fastcall__ call_u8_u8(uint8_t bank, void (*fn)(uint8_t, uint8_t), uint8_t a8, uint8_t b8) {
  CALL_WITH_ARGS(bank, fn, a8, b8);
}

void __fastcall__ call_u8_u8_u8(uint8_t bank, void (*fn)(uint8_t, uint8_t, uint8_t), uint8_t a8, uint8_t b8, uint8_t c8) {
  CALL_WITH_ARGS(bank, fn, a8, b8, c8);
}

void __fastcall__ call_u8_u8_u8_u8(uint8_t bank, void (*fn)(uint8_t, uint8_t, uint8_t, uint8_t), uint8_t a8, uint8_t b8, uint8_t c8, uint8_t d8) {
  CALL_WITH_ARGS(bank, fn, a8, b8, c8, d8);
}

void __fastcall__ call_u8_u8_u8_u8_u8(uint8_t bank, void (*fn)(uint8_t, uint8_t, uint8_t, uint8_t, uint8_t), uint8_t a8, uint8_t b8, uint8_t c8, uint8_t d8, uint8_t e8) {
  CALL_WITH_ARGS(bank, fn, a8, b8, c8, d8, e8);

}
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
