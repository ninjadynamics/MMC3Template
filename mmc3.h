#ifndef _MMC3_H
#define _MMC3_H

#include <peekpoke.h>
#include <nes.h>

#include "core.h"
#include "options.h"

#define MMC3_SET_REG(r, n) ( \
  POKE(0x8000, A12_INVERSION | (r)),\
  POKE(0x8001, (n)) \
)

#define MMC3_CHR_0000(n) MMC3_SET_REG(0, (n))
#define MMC3_CHR_0800(n) MMC3_SET_REG(1, (n))
#define MMC3_CHR_1000(n) MMC3_SET_REG(2, (n))
#define MMC3_CHR_1400(n) MMC3_SET_REG(3, (n))
#define MMC3_CHR_1800(n) MMC3_SET_REG(4, (n))
#define MMC3_CHR_1C00(n) MMC3_SET_REG(5, (n))

#define PPU_MASK_VALUE 0x1E
#define PPU_MASK_VALUE_GRAYSCALE (PPU_MASK_VALUE | 0x01)

#define STROBE(addr) __asm__ ("sta %w", addr)

#define MMC3_IRQ_SET_VALUE(n) POKE(0xc000, (n));
#define MMC3_IRQ_RELOAD()     STROBE(0xc001)
#define MMC3_IRQ_DISABLE()    STROBE(0xe000)
#define MMC3_IRQ_ENABLE()     STROBE(0xe001)

// Bank swapping
extern uint8_t music_bank;
#pragma zpsym("music_bank")
extern uint8_t sfx_bank;
#pragma zpsym("sfx_bank")
extern uint8_t dpcm_bank;
#pragma zpsym("dpcm_bank")
extern uint8_t active_code_bank_index;
#pragma zpsym("active_code_bank_index")
extern uint8_t active_data_bank_index;
#pragma zpsym("active_data_bank_index")
extern uint8_t active_code_bank[8];
#pragma zpsym("active_code_bank")
extern uint8_t active_data_bank[8];
#pragma zpsym("active_data_bank")
extern uint8_t mmc3_mirroring;
#pragma zpsym("mmc3_mirroring")
extern uint8_t mmc3_register;
#pragma zpsym("mmc3_register")
extern uint8_t mmc3_cpu_bank;
#pragma zpsym("mmc3_cpu_bank")
extern uint8_t mmc3_bank_num;
#pragma zpsym("mmc3_bank_num")
extern uint8_t mmc3_last_register;
#pragma zpsym("mmc3_last_register")
extern uint8_t mmc3_last_cpu_bank;
#pragma zpsym("mmc3_last_cpu_bank")

extern uint8_t chr_bg;
#pragma zpsym("chr_bg")
extern uint8_t chr_spr;
#pragma zpsym("chr_spr")

void __fastcall__ mmc3_setup(void);
void __fastcall__ mmc3_load_chr(void);
void __fastcall__ mmc3_famitone_update_nmi(void);

void __fastcall__ mmc3_switch_data_bank(uint8_t n);
void __fastcall__ mmc3_push_data_bank(void);
void __fastcall__ mmc3_push_code_bank(void);
void __fastcall__ mmc3_pop_data_bank(void);
void __fastcall__ mmc3_pop_code_bank(void);

void __fastcall__ call(uint8_t bank, void (*fn)(void));
void __fastcall__ call_i8(uint8_t bank, void (*fn)(int8_t), int8_t i8);
void __fastcall__ call_ptr(uint8_t bank, void (*fn)(void*), void * ptr);
void __fastcall__ call_u8(uint8_t bank, void (*fn)(uint8_t), uint8_t a8);
void __fastcall__ call_u8_u8(uint8_t bank, void (*fn)(uint8_t, uint8_t), uint8_t a8, uint8_t b8);
void __fastcall__ call_u8_u8_u8(uint8_t bank, void (*fn)(uint8_t, uint8_t, uint8_t), uint8_t a8, uint8_t b8, uint8_t c8);
void __fastcall__ call_u8_u8_u8_u8(uint8_t bank, void (*fn)(uint8_t, uint8_t, uint8_t, uint8_t), uint8_t a8, uint8_t b8, uint8_t c8, uint8_t d8);
void __fastcall__ call_u8_u8_u8_u8_u8(uint8_t bank, void (*fn)(uint8_t, uint8_t, uint8_t, uint8_t, uint8_t), uint8_t a8, uint8_t b8, uint8_t c8, uint8_t d8, uint8_t e8);

#endif // mmc3.h

/*
*********************************************************************
*                        SAFE BANK SWAPPING                         *
*********************************************************************
* https://github.com/nesdoug/33_MMC3/blob/master/MMC3/mmc3_code.asm *
*********************************************************************
; because the CHR bank swap and PRG bank swap use the same
; register, the IRQ code and the MAIN code might try to
; use this register at the same time, and conflict
; thus we need redundant writes to make sure that
; both go through.
;
; This only works if the MAIN code only ever changes
; the PRG bank and the IRQ code only ever changes the
; CHR banks.
; However, the main code can safely do CHR changes if
; the IRQ system is not changing CHR

safe_bank_swapping:
	lda mmc3_8000_CHR
	sta $8000
	lda mmc3_8001_CHR
	sta $8001
	lda mmc3_8000_PRG
	sta $8000
	lda mmc3_8001_PRG
	sta $8001
	rts
*********************************************************************
*/
