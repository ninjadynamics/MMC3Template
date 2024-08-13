; Compile

; Startup code for cc65 and Shiru's NES library
; based on code by Groepaz/Hitmen <groepaz@gmx.net>, Ullrich von Bassewitz <uz@cc65.org>

A12_INVERSION = $80     ;must match MMC_MODE in mmc3.h

FT_BASE_ADR = $0300     ;page in RAM, should be $xx00
FT_DPCM_OFF = $c000     ;$c000..$ffc0, 64-byte steps
FT_SFX_STREAMS  = 4     ;number of sound effects played at once, 1..4

FT_THREAD       = 1     ;undefine if you call sound effects in the same thread as sound update
FT_PAL_SUPPORT  = 0     ;undefine to exclude PAL support (either PAL or NTSC - do NOT enable both!)
FT_NTSC_SUPPORT = 1     ;undefine to exclude NTSC support (either PAL or NTSC - do NOT enable both!)
FT_DPCM_ENABLE  = 0     ;undefine to exclude all DMC code
FT_SFX_ENABLE   = 1     ;undefine to exclude all sound effects code

FT_BANKED_MUSIC = 1     ;undefine if there is no need for music bank switching
FT_BANKED_SFX   = 1     ;undefine if there is no need for sound effects bank switching
FT_BANKED_DPCM  = 0     ;undefine if there is no need for samples bank switching

;REMOVED initlib
;this called the CONDES function

    .export _exit,__STARTUP__:absolute=1
    .import push0,popa,popax,_main,zerobss,copydata

; Linker generated symbols
    .import __STACK_START__ ,__STACKSIZE__ ;changed
    .import __ROM0_START__  ,__ROM0_SIZE__
    .import __STARTUP_LOAD__,__STARTUP_RUN__,__STARTUP_SIZE__
    .import __CODE_LOAD__   ,__CODE_RUN__   ,__CODE_SIZE__
    .import __RODATA_LOAD__ ,__RODATA_RUN__ ,__RODATA_SIZE__
    .import NES_MAPPER, NES_PRG_BANKS, NES_CHR_BANKS, NES_MIRRORING, NES_BATTERY

    .importzp _PAD_STATE, _PAD_STATET ;added
    .include "zeropage.inc"


PPU_CTRL        =$2000
PPU_MASK        =$2001
PPU_STATUS      =$2002
PPU_OAM_ADDR    =$2003
PPU_OAM_DATA    =$2004
PPU_SCROLL      =$2005
PPU_ADDR        =$2006
PPU_DATA        =$2007
PPU_OAM_DMA     =$4014
PPU_FRAMECNT    =$4017
DMC_FREQ        =$4010
CTRL_PORT1      =$4016
CTRL_PORT2      =$4017
OAM_BUF         =$0200
PAL_BUF         =$01A0

MMC3_BNKSEL     =$8000
MMC3_BNKVAL     =$8001
MMC3_MIRROR     =$A000


.segment "ZEROPAGE"

NTSC_MODE:          .res 1
FRAME_CNT1:         .res 1
FRAME_CNT2:         .res 1
VRAM_UPDATE:        .res 1
NAME_UPD_ADR:       .res 2
NAME_UPD_ENABLE:    .res 1
PAL_UPDATE:         .res 1
PAL_BG_PTR:         .res 2
PAL_SPR_PTR:        .res 2
SCROLL_X:           .res 1
SCROLL_Y:           .res 1
SCROLL_X1:          .res 1
SCROLL_Y1:          .res 1
PAD_STATE:          .res 2      ;one byte per controller
PAD_STATEP:         .res 2
PAD_STATET:         .res 2
PPU_CTRL_VAR:       .res 1
PPU_CTRL_VAR1:      .res 1
PPU_MASK_VAR:       .res 1
RAND_SEED:          .res 2
FT_TEMP:            .res 3
TEMP:               .res 11
SPRID:              .res 1

PAD_BUF     =TEMP+1
PTR         =TEMP   ;word
LEN         =TEMP+2 ;word
NEXTSPR     =TEMP+4
SCRX        =TEMP+5
SCRY        =TEMP+6
SRC         =TEMP+7 ;word
DST         =TEMP+9 ;word
RLE_LOW     =TEMP
RLE_HIGH    =TEMP+1
RLE_TAG     =TEMP+2
RLE_BYTE    =TEMP+3

NMICallback:        .res 3

.exportzp NMICallback


.segment "HEADER"
    .byte $4e,$45,$53,$1a
    .byte <NES_PRG_BANKS
    .byte <NES_CHR_BANKS
    .byte <NES_MIRRORING|(<NES_MAPPER<<4)|(<NES_BATTERY<<1)
    .byte <NES_MAPPER&$f0
    .res 8,0


.segment "STARTUP"

start:
_exit:
    sei
    cld
    ldx #$40
    stx CTRL_PORT2
    ldx #$ff
    txs
    inx
    stx PPU_MASK
    stx DMC_FREQ
    stx PPU_CTRL        ;no NMI

initMMC:
    ; MMC3 initialization (NROM-like mapping)
    ; https://forums.nesdev.com/viewtopic.php?p=209344#p209344

    ; set mirroring
    lda #$00        ; 0->vertical, 1->horizontal
    sta MMC3_MIRROR
    
    ; disable IRQ
    sta $E000
    
    ; enable Work RAM
    lda #$80
    sta $A001    

    ; PRG banking setup (8 kB banks)
    lda #6          ; select R6 (used as a swappable data bank)
    sta MMC3_BNKSEL
    lda #0          ; set R6 to bank 0
    sta MMC3_BNKVAL

    lda #7          ; select R7 (used as a swappable code bank)
    sta MMC3_BNKSEL ; bank select
    lda #1          ; set R7 to bank 1 (it doesn't really matter at this point)
    sta $8001
    
    ; CHR banking setup (1 kB banks)
    lda #0          ; select R0
    sta MMC3_BNKSEL ; bank select
    lda #0          ; R0 -> bank 0 (banks 0 + 1)
    sta MMC3_BNKVAL

    lda #1          ; select R1
    sta MMC3_BNKSEL ; bank select
    lda #2          ; R1 -> bank 2 (banks 2 + 3)
    sta MMC3_BNKVAL

    lda #2          ; select R2
    sta MMC3_BNKSEL ; bank select
    lda #4          ; R2 -> bank 4
    sta MMC3_BNKVAL

    lda #4          ; select R3
    sta MMC3_BNKSEL ; bank select
    lda #5          ; R3 -> bank 5
    sta MMC3_BNKVAL

    lda #4          ; select R4
    sta MMC3_BNKSEL ; bank select
    lda #6          ; R4 -> bank 6
    sta MMC3_BNKVAL

    lda #5          ; select R5
    sta MMC3_BNKSEL ; bank select
    lda #7          ; R5 -> bank 7
    sta MMC3_BNKVAL

initPPU:
    bit PPU_STATUS
@1:
    bit PPU_STATUS
    bpl @1
@2:
    bit PPU_STATUS
    bpl @2

clearPalette:
    lda #$3f
    sta PPU_ADDR
    stx PPU_ADDR
    lda #$0f
    ldx #$20
@1:
    sta PPU_DATA
    dex
    bne @1

clearVRAM:
    txa
    ldy #$20
    sty PPU_ADDR
    sta PPU_ADDR
    ldy #$10
@1:
    sta PPU_DATA
    inx
    bne @1
    dey
    bne @1

clearRAM:
    txa
@1:
    sta $000,x
    sta $100,x
    sta $200,x
    sta $300,x
    sta $400,x
    sta $500,x
    sta $600,x
    sta $700,x
    inx
    bne @1

    lda #4
    jsr _pal_bright
    jsr _pal_clear
    jsr _oam_clear

    jsr zerobss
    jsr copydata

    lda #<(__STACK_START__+__STACKSIZE__) ;changed
    sta sp
    lda #>(__STACK_START__+__STACKSIZE__)
    sta sp+1            ; Set argument stack ptr

    ; setup NMICallback trampoline to NOP
    ;lda #$4C    ;JMP xxxx
    ;sta NMICallback
    ;lda #<HandyRTS
    ;sta NMICallback+1
    ;lda #>HandyRTS
    ;sta NMICallback+2
    jsr _nmi_clear_callback

    ;         N  BS
    lda #%10001000      ;enable NMI, bg @ bank 0, sprites @ bank 1
    sta <PPU_CTRL_VAR
    sta PPU_CTRL
    lda #%00000110
    sta <PPU_MASK_VAR

waitSync3:
    lda <FRAME_CNT1
@1:
    cmp <FRAME_CNT1
    beq @1

detectNTSC:
    ldx #52             ;blargg's code
    ldy #24
@1:
    dex
    bne @1
    dey
    bne @1

    lda PPU_STATUS
    and #$80
    sta <NTSC_MODE

    jsr _ppu_off

    lda #0
    ldx #0
    jsr _set_vram_update

    ldx #<music_data
    ldy #>music_data
    lda <NTSC_MODE
    jsr FamiToneInit

    .if(FT_SFX_ENABLE)
    ldx #<sounds_data
    ldy #>sounds_data
    jsr FamiToneSfxInit
    .endif

    lda #$fd
    sta <RAND_SEED
    sta <RAND_SEED+1

    lda #0
    sta PPU_SCROLL
    sta PPU_SCROLL

    jmp _main           ;no parameters

    .include "neslib.s"
    .include "famitone2.s"


.segment "RODATA"

music_data:
    .include "music.s"

    .if(FT_SFX_ENABLE)
sounds_data:
    .include "sounds.s"
    .endif


.segment "SAMPLES"
;   .incbin "music_dpcm.bin"


.segment "VECTORS"
    .word nmi   ;$fffa vblank nmi
    .word start ;$fffc reset
    .word irq   ;$fffe irq / brk


.segment "CHARS"
    .include "chr_default.s"