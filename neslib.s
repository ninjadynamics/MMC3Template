;NES hardware-dependent functions by Shiru (shiru@mail.ru)
;with improvements by VEG
;Feel free to do anything you want with this code, consider it Public Domain

;nesdoug version, 2019-09
;minor change %%, added ldx #0 to functions returning char
;removed sprid from c functions to speed them up

;Ninja Dynamics
;added NMI callback functions
;added Convert to bool function

	.export _pal_all,_pal_bg,_pal_spr,_pal_col,_pal_clear
	.export _pal_bright,_pal_spr_bright,_pal_bg_bright
	.export _ppu_off,_ppu_on_all,_ppu_on_bg,_ppu_on_spr,_ppu_mask,_ppu_system
	.export _oam_clear,_oam_size,_oam_spr,_oam_meta_spr,_oam_hide_rest
	.export _ppu_wait_frame,_ppu_wait_nmi
	.export _scroll,_split
	.export _bank_spr,_bank_bg
	.export _vram_read,_vram_write
	.export _rand8,_rand16,_set_rand
	.export _vram_adr,_vram_put,_vram_fill,_vram_inc,_vram_unrle
	.export _set_vram_update,_flush_vram_update
	.export _memcpy,_memfill,_delay
	.export _get_ppu_ctrl_var,_set_ppu_ctrl_var
	.export _flush_vram_update_nmi, _oam_set, _oam_get
	.export _nmi_set_callback, _nmi_clear_callback
        ; .export _to_bool


; Quick macros to reserve a value and export it for usage in C
.macro RESERVE name, size
  .export .ident(.sprintf("_%s", .string(name))) = .ident(.string(name)) 
  .ident(.string(name)): .res size
.endmacro
.macro RESERVE_ZP name, size
  .exportzp .ident(.sprintf("_%s", .string(name))) = .ident(.string(name)) 
  .ident(.string(name)): .res size
.endmacro

; https://discord.com/channels/352252932953079811/352436568062951427/1252666807798595687
; unsigned char __fastcall__ to_bool(unsigned char x);

; _to_bool:
;         cmp #1       ; Compare A with 1, setting the carry flag if A != 0
;         lda #0       ; Clear A
;         rol a        ; Rotate left through carry, setting A to 1 if the carry flag is set
;         rts          ; Return from subroutine

;NMI handler

nmi:
	pha
	txa
	pha
	tya
	pha

	lda <PPU_MASK_VAR	;if rendering is disabled, do not access the VRAM at all
	and #%00011000
	bne @doUpdate
	jmp @skipAll

@doUpdate:
	lda <PAL_UPDATE		;update palette if needed
	bne @updPal
	jmp @updVRAM

@updPal:

	ldx #0
	stx <PAL_UPDATE

	lda #$3f
	sta PPU_ADDR
	stx PPU_ADDR

	ldy PAL_BUF			;background color, remember it in X
	lda (PAL_BG_PTR),y
	sta PPU_DATA
	tax
	
	.repeat 3,I
	ldy PAL_BUF+1+I
	lda (PAL_BG_PTR),y
	sta PPU_DATA
	.endrepeat

	.repeat 3,J		
	stx PPU_DATA			;background color
	.repeat 3,I
	ldy PAL_BUF+5+(J*4)+I
	lda (PAL_BG_PTR),y
	sta PPU_DATA
	.endrepeat
	.endrepeat

	.repeat 4,J		
	stx PPU_DATA			;background color
	.repeat 3,I
	ldy PAL_BUF+17+(J*4)+I
	lda (PAL_SPR_PTR),y
	sta PPU_DATA
	.endrepeat
	.endrepeat

@updVRAM:

	lda <VRAM_UPDATE
	beq @skipUpd
	lda #0
	sta <VRAM_UPDATE
	
	lda <NAME_UPD_ENABLE
	beq @skipUpd

	jsr _flush_vram_update_nmi

@skipUpd:

	lda #0
	sta PPU_ADDR
	sta PPU_ADDR

	lda <SCROLL_X
	sta PPU_SCROLL
	lda <SCROLL_Y
	sta PPU_SCROLL

	lda <PPU_CTRL_VAR
	sta PPU_CTRL

	jsr oam_and_readjoypad

@skipAll:

	lda <PPU_MASK_VAR
	sta PPU_MASK

	inc <FRAME_CNT1
	inc <FRAME_CNT2
	lda <FRAME_CNT2
	cmp #6
	bne skipNtsc
	lda #0
	sta <FRAME_CNT2

skipNtsc:

	jsr NMICallback        
;	jsr FamiToneUpdate

	pla
	tay
	pla
	tax
	pla
	rti

; IRQ: jumps to NMICallback, passing -1 as argument
irq:
	pha
	txa
	pha
	tya
	pha
	lda #$ff
	jmp skipNtsc

;void __fastcall__ nmi_set_callback(void (*callback)());

_nmi_set_callback:
	sta NMICallback+1
	stx NMICallback+2
HandyRTS:
	rts
        
; void __fastcall__ nmi_clear_callback(void);

_nmi_clear_callback:
        lda #$4C    ;JMP xxxx
        sta NMICallback
        lda #<HandyRTS
        sta NMICallback+1
        lda #>HandyRTS
        sta NMICallback+2
        rts        

;void __fastcall__ pal_all(const char *data);

_pal_all:

	sta <PTR
	stx <PTR+1
	ldx #$00
	lda #$20

pal_copy:

	sta <LEN

	ldy #$00

@0:

	lda (PTR),y
	sta PAL_BUF,x
	inx
	iny
	dec <LEN
	bne @0

	inc <PAL_UPDATE

	rts



;void __fastcall__ pal_bg(const char *data);

_pal_bg:

	sta <PTR
	stx <PTR+1
	ldx #$00
	lda #$10
	bne pal_copy ;bra



;void __fastcall__ pal_spr(const char *data);

_pal_spr:

	sta <PTR
	stx <PTR+1
	ldx #$10
	txa
	bne pal_copy ;bra



;void __fastcall__ pal_col(unsigned char index,unsigned char color);

_pal_col:

	sta <PTR
	jsr popa
	and #$1f
	tax
	lda <PTR
	sta PAL_BUF,x
	inc <PAL_UPDATE
	rts



;void __fastcall__ pal_clear(void);

_pal_clear:

	lda #$0f
	ldx #0

@1:

	sta PAL_BUF,x
	inx
	cpx #$20
	bne @1
	stx <PAL_UPDATE
	rts



;void __fastcall__ pal_spr_bright(unsigned char bright);

_pal_spr_bright:

	tax
	lda palBrightTableL,x
	sta <PAL_SPR_PTR
	lda palBrightTableH,x	;MSB is never zero
	sta <PAL_SPR_PTR+1
	sta <PAL_UPDATE
	rts



;void __fastcall__ pal_bg_bright(unsigned char bright);

_pal_bg_bright:

	tax
	lda palBrightTableL,x
	sta <PAL_BG_PTR
	lda palBrightTableH,x	;MSB is never zero
	sta <PAL_BG_PTR+1
	sta <PAL_UPDATE
	rts



;void __fastcall__ pal_bright(unsigned char bright);

_pal_bright:

	jsr _pal_spr_bright
	txa
	jmp _pal_bg_bright



;void __fastcall__ ppu_off(void);

_ppu_off:

	lda <PPU_MASK_VAR
	and #%11100111
	sta <PPU_MASK_VAR
	jmp _ppu_wait_nmi



;void __fastcall__ ppu_on_all(void);

_ppu_on_all:

	lda <PPU_MASK_VAR
	ora #%00011000

ppu_onoff:

	sta <PPU_MASK_VAR
	jmp _ppu_wait_nmi



;void __fastcall__ ppu_on_bg(void);

_ppu_on_bg:

	lda <PPU_MASK_VAR
	ora #%00001000
	bne ppu_onoff	;bra



;void __fastcall__ ppu_on_spr(void);

_ppu_on_spr:

	lda <PPU_MASK_VAR
	ora #%00010000
	bne ppu_onoff	;bra



;void __fastcall__ ppu_mask(unsigned char mask);

_ppu_mask:

	sta <PPU_MASK_VAR
	rts



;unsigned char __fastcall__ ppu_system(void);

_ppu_system:

	lda <NTSC_MODE
	ldx #0
	rts



;unsigned char __fastcall__ get_ppu_ctrl_var(void);

_get_ppu_ctrl_var:

	lda <PPU_CTRL_VAR
	ldx #$00
	rts



;void __fastcall__ set_ppu_ctrl_var(unsigned char var);

_set_ppu_ctrl_var:

	sta <PPU_CTRL_VAR
	rts



;void __fastcall__ oam_clear(void);

_oam_clear:

	ldx #0
	stx SPRID ; automatically sets sprid to zero
	lda #$ff
@1:
	sta OAM_BUF,x
	inx
	inx
	inx
	inx
	bne @1
	rts
	
	
;void __fastcall__ oam_set(unsigned char index);	
;to manually set the position
;a = sprid

_oam_set:
	and #$fc ;strip those low 2 bits, just in case
	sta SPRID
	rts
	
	
;unsigned char __fastcall__ oam_get(void);	
;returns the sprid

_oam_get:
	lda SPRID
	ldx #0
	rts
	



;void __fastcall__ oam_size(unsigned char size);

_oam_size:

	asl a
	asl a
	asl a
	asl a
	asl a
	and #$20
	sta <TEMP
	lda <PPU_CTRL_VAR
	and #$df
	ora <TEMP
	sta <PPU_CTRL_VAR

	rts



;void __fastcall__ oam_spr(unsigned char x,unsigned char y,unsigned char chrnum,unsigned char attr);
;sprid removed

_oam_spr:

	ldx SPRID
	;a = chrnum
	sta OAM_BUF+2,x

	ldy #0		;3 popa calls replacement
	lda (sp),y
	iny
	sta OAM_BUF+1,x
	lda (sp),y
	iny
	sta OAM_BUF+0,x
	lda (sp),y
	sta OAM_BUF+3,x

	lda <sp
	clc
	adc #3 ;4
	sta <sp
	bcc @1
	inc <sp+1

@1:

	txa
	clc
	adc #4
	sta SPRID
	rts



;void __fastcall__ oam_meta_spr(unsigned char x,unsigned char y,const unsigned char *data);
;sprid removed

_oam_meta_spr:

	sta <PTR
	stx <PTR+1

	ldy #1		;2 popa calls replacement, performed in reversed order
	lda (sp),y
	dey
	sta <SCRX
	lda (sp),y
	sta <SCRY
	
	ldx SPRID

@1:

	lda (PTR),y		;x offset
	cmp #$80
	beq @2
	iny
	clc
	adc <SCRX
	sta OAM_BUF+3,x
	lda (PTR),y		;y offset
	iny
	clc
	adc <SCRY
	sta OAM_BUF+0,x
	lda (PTR),y		;tile
	iny
	sta OAM_BUF+1,x
	lda (PTR),y		;attribute
	iny
	sta OAM_BUF+2,x
	inx
	inx
	inx
	inx
	jmp @1

@2:

	lda <sp
	adc #1 ;2			;carry is always set here, so it adds 3
	sta <sp
	bcc @3
	inc <sp+1

@3:

	stx SPRID
	rts



;void __fastcall__ oam_hide_rest(void);
;sprid removed

_oam_hide_rest:

	ldx SPRID
	lda #240

@1:

	sta OAM_BUF,x
	inx
	inx
	inx
	inx
	bne @1
	;x is zero
	stx SPRID
	rts



;void __fastcall__ ppu_wait_frame(void);

_ppu_wait_frame:

	lda #1
	sta <VRAM_UPDATE
	lda <FRAME_CNT1

@1:

	cmp <FRAME_CNT1
	beq @1
	lda <NTSC_MODE
	beq @3

@2:

	lda <FRAME_CNT2
	cmp #5
	beq @2

@3:

	rts



;void __fastcall__ ppu_wait_nmi(void);

_ppu_wait_nmi:

	lda #1
	sta <VRAM_UPDATE
	lda <FRAME_CNT1
@1:

	cmp <FRAME_CNT1
	beq @1
	rts



;void __fastcall__ vram_unrle(const unsigned char *data);

_vram_unrle:

	tay
	stx <RLE_HIGH
	lda #0
	sta <RLE_LOW

	lda (RLE_LOW),y
	sta <RLE_TAG
	iny
	bne @1
	inc <RLE_HIGH

@1:

	lda (RLE_LOW),y
	iny
	bne @11
	inc <RLE_HIGH

@11:

	cmp <RLE_TAG
	beq @2
	sta PPU_DATA
	sta <RLE_BYTE
	bne @1

@2:

	lda (RLE_LOW),y
	beq @4
	iny
	bne @21
	inc <RLE_HIGH

@21:

	tax
	lda <RLE_BYTE

@3:

	sta PPU_DATA
	dex
	bne @3
	beq @1

@4:

	rts



;void __fastcall__ scroll(unsigned int x,unsigned int y);

_scroll:

	sta <TEMP

	txa
	bne @1
	lda <TEMP
	cmp #240
	bcs @1
	sta <SCROLL_Y
	lda #0
	sta <TEMP
	beq @2	;bra

@1:

	sec
	lda <TEMP
	sbc #240
	sta <SCROLL_Y
	lda #2
	sta <TEMP

@2:

	jsr popax
	sta <SCROLL_X
	txa
	and #$01
	ora <TEMP
	sta <TEMP
	lda <PPU_CTRL_VAR
	and #$fc
	ora <TEMP
	sta <PPU_CTRL_VAR
	rts



;;void __fastcall__ split(unsigned int x);
;minor changes %%
_split:

;	jsr popax
	sta <SCROLL_X1
	txa
	and #$01
	sta <TEMP
	lda <PPU_CTRL_VAR
	and #$fc
	ora <TEMP
	sta <PPU_CTRL_VAR1

@3:

	bit PPU_STATUS
	bvs @3

@4:

	bit PPU_STATUS
	bvc @4

	lda <SCROLL_X1
	sta PPU_SCROLL
	lda #0
	sta PPU_SCROLL
	lda <PPU_CTRL_VAR1
	sta PPU_CTRL

	rts



;void __fastcall__ bank_spr(unsigned char n);

_bank_spr:

	and #$01
	asl a
	asl a
	asl a
	sta <TEMP
	lda <PPU_CTRL_VAR
	and #%11110111
	ora <TEMP
	sta <PPU_CTRL_VAR

	rts



;void __fastcall__ bank_bg(unsigned char n);

_bank_bg:

	and #$01
	asl a
	asl a
	asl a
	asl a
	sta <TEMP
	lda <PPU_CTRL_VAR
	and #%11101111
	ora <TEMP
	sta <PPU_CTRL_VAR

	rts



;void __fastcall__ vram_read(unsigned char *dst,unsigned int size);

_vram_read:

	sta <TEMP
	stx <TEMP+1

	jsr popax
	sta <TEMP+2
	stx <TEMP+3

	lda PPU_DATA

	ldy #0

@1:

	lda PPU_DATA
	sta (TEMP+2),y
	inc <TEMP+2
	bne @2
	inc <TEMP+3

@2:

	lda <TEMP
	bne @3
	dec <TEMP+1

@3:

	dec <TEMP
	lda <TEMP
	ora <TEMP+1
	bne @1

	rts



;void __fastcall__ vram_write(unsigned char *src,unsigned int size);

_vram_write:

	sta <TEMP
	stx <TEMP+1

	jsr popax
	sta <TEMP+2
	stx <TEMP+3

	ldy #0

@1:

	lda (TEMP+2),y
	sta PPU_DATA
	inc <TEMP+2
	bne @2
	inc <TEMP+3

@2:

	lda <TEMP
	bne @3
	dec <TEMP+1

@3:

	dec <TEMP
	lda <TEMP
	ora <TEMP+1
	bne @1

	rts


;unsigned char __fastcall__ pad_poll(unsigned char pad);

; _pad_poll:

; 	tay
; 	ldx #3

; @padPollPort:

; 	lda #1
; 	sta CTRL_PORT1
; 	sta <PAD_BUF-1,x
; 	lda #0
; 	sta CTRL_PORT1
; 	lda #8
; 	sta <TEMP

; @padPollLoop:

; 	lda CTRL_PORT1,y
; 	lsr a
; 	rol <PAD_BUF-1,x
; 	bcc @padPollLoop

; 	dex
; 	bne @padPollPort

; 	lda <PAD_BUF
; 	cmp <PAD_BUF+1
; 	beq @done
; 	cmp <PAD_BUF+2
; 	beq @done
; 	lda <PAD_BUF+1

; @done:

; 	sta <PAD_STATE,y
; 	tax
; 	eor <PAD_STATEP,y
; 	and <PAD_STATE ,y
; 	sta <PAD_STATET,y
; 	txa
; 	sta <PAD_STATEP,y
	
; 	ldx #0
; 	rts



;unsigned char __fastcall__ pad_trigger(unsigned char pad);

; _pad_trigger:

; 	pha
; 	jsr _pad_poll
; 	pla
; 	tax
; 	lda <PAD_STATET,x
; 	ldx #0
; 	rts



;unsigned char __fastcall__ pad_state(unsigned char pad);

; _pad_state:

; 	tax
; 	lda <PAD_STATE,x
; 	ldx #0
; 	rts



;unsigned char __fastcall__ rand8(void);
;Galois random generator, found somewhere
;out: A random number 0..255

rand1:

	lda <RAND_SEED
	asl a
	bcc @1
	eor #$cf

@1:

	sta <RAND_SEED
	rts

rand2:

	lda <RAND_SEED+1
	asl a
	bcc @1
	eor #$d7

@1:

	sta <RAND_SEED+1
	rts

_rand8:

	jsr rand1
	jsr rand2
	adc <RAND_SEED
	ldx #0
	rts



;unsigned int __fastcall__ rand16(void);

_rand16:

	jsr rand1
	tax
	jsr rand2

	rts


;void __fastcall__ set_rand(unsigned char seed);

_set_rand:

	sta <RAND_SEED
	stx <RAND_SEED+1

	rts



;void __fastcall__ set_vram_update(unsigned char *buf);

_set_vram_update:

	sta <NAME_UPD_ADR+0
	stx <NAME_UPD_ADR+1
	ora <NAME_UPD_ADR+1
	sta <NAME_UPD_ENABLE

	rts



;void __fastcall__ flush_vram_update(unsigned char *buf);

_flush_vram_update:

	sta <NAME_UPD_ADR+0
	stx <NAME_UPD_ADR+1

_flush_vram_update_nmi: ;minor changes %

	ldy #0

@updName:

	lda (NAME_UPD_ADR),y
	iny
	cmp #$40				;is it a non-sequental write?
	bcs @updNotSeq
	sta PPU_ADDR
	lda (NAME_UPD_ADR),y
	iny
	sta PPU_ADDR
	lda (NAME_UPD_ADR),y
	iny
	sta PPU_DATA
	jmp @updName

@updNotSeq:

	tax
	lda <PPU_CTRL_VAR
	cpx #$80				;is it a horizontal or vertical sequence?
	bcc @updHorzSeq
	cpx #$ff				;is it end of the update?
	beq @updDone

@updVertSeq:

	ora #$04
	bne @updNameSeq			;bra

@updHorzSeq:

	and #$fb

@updNameSeq:

	sta PPU_CTRL

	txa
	and #$3f
	sta PPU_ADDR
	lda (NAME_UPD_ADR),y
	iny
	sta PPU_ADDR
	lda (NAME_UPD_ADR),y
	iny
	tax

@updNameLoop:

	lda (NAME_UPD_ADR),y
	iny
	sta PPU_DATA
	dex
	bne @updNameLoop

	lda <PPU_CTRL_VAR
	sta PPU_CTRL

	jmp @updName

@updDone:

	rts
	
	
	
;void __fastcall__ vram_adr(unsigned int adr);

_vram_adr:

	stx PPU_ADDR
	sta PPU_ADDR

	rts



;void __fastcall__ vram_put(unsigned char n);

_vram_put:

	sta PPU_DATA

	rts



;void __fastcall__ vram_fill(unsigned char n,unsigned int len);

_vram_fill:

	sta <LEN
	stx <LEN+1
	jsr popa
	ldx <LEN+1
	beq @2
	ldx #0

@1:

	sta PPU_DATA
	dex
	bne @1
	dec <LEN+1
	bne @1

@2:

	ldx <LEN
	beq @4

@3:

	sta PPU_DATA
	dex
	bne @3

@4:

	rts



;void __fastcall__ vram_inc(unsigned char n);

_vram_inc:

	ora #0
	beq @1
	lda #$04

@1:

	sta <TEMP
	lda <PPU_CTRL_VAR
	and #$fb
	ora <TEMP
	sta <PPU_CTRL_VAR
	sta PPU_CTRL

	rts



;void __fastcall__ memcpy(void *dst,void *src,unsigned int len);

_memcpy:

	sta <LEN
	stx <LEN+1
	jsr popax
	sta <SRC
	stx <SRC+1
	jsr popax
	sta <DST
	stx <DST+1

	ldx #0

@1:

	lda <LEN+1
	beq @2
	jsr @3
	dec <LEN+1
	inc <SRC+1
	inc <DST+1
	jmp @1

@2:

	ldx <LEN
	beq @5

@3:

	ldy #0

@4:

	lda (SRC),y
	sta (DST),y
	iny
	dex
	bne @4

@5:

	rts



;void __fastcall__ memfill(void *dst,unsigned char value,unsigned int len);

_memfill:

	sta <LEN
	stx <LEN+1
	jsr popa
	sta <TEMP
	jsr popax
	sta <DST
	stx <DST+1

	ldx #0

@1:

	lda <LEN+1
	beq @2
	jsr @3
	dec <LEN+1
	inc <DST+1
	jmp @1

@2:

	ldx <LEN
	beq @5

@3:

	ldy #0
	lda <TEMP

@4:

	sta (DST),y
	iny
	dex
	bne @4

@5:

	rts



;void __fastcall__ delay(unsigned char frames);

_delay:

	tax

@1:

	jsr _ppu_wait_nmi
	dex
	bne @1

	rts



palBrightTableL:

	.byte <palBrightTable0,<palBrightTable1,<palBrightTable2
	.byte <palBrightTable3,<palBrightTable4,<palBrightTable5
	.byte <palBrightTable6,<palBrightTable7,<palBrightTable8

palBrightTableH:

	.byte >palBrightTable0,>palBrightTable1,>palBrightTable2
	.byte >palBrightTable3,>palBrightTable4,>palBrightTable5
	.byte >palBrightTable6,>palBrightTable7,>palBrightTable8

palBrightTable0:
	.byte $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f	;black
palBrightTable1:
	.byte $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f
palBrightTable2:
	.byte $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f
palBrightTable3:
	.byte $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f
palBrightTable4:
	.byte $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0a,$0b,$0c,$0f,$0f,$0f	;normal colors
palBrightTable5:
	.byte $10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$1a,$1b,$1c,$00,$00,$00
palBrightTable6:
	.byte $10,$21,$22,$23,$24,$25,$26,$27,$28,$29,$2a,$2b,$2c,$10,$10,$10	;$10 because $20 is the same as $30
palBrightTable7:
	.byte $30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$3a,$3b,$3c,$20,$20,$20
palBrightTable8:
	.byte $30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30	;white
	.byte $30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30
	.byte $30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30
	.byte $30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30

.pushseg

.if ::USE_MOUSE_SUPPORT
.segment "ZEROPAGE"

; NOTE: These must be zero page and adjacent; the code relies on joypad1_down following mouse.
RESERVE_ZP mouse, 4
  kMouseZero = 0
  kMouseButtons = 1
  kMouseY = 2
  kMouseX = 3
RESERVE_ZP joypad1, 3
; Bitmask indicating which $4016/7 bit the mouse is on.
RESERVE_ZP mouse_mask, 1

.segment "BSS"
; NOTE: These variables are not page-sensitive and can be absolute.
advance_sensitivity: .res 1  ; Bool.

.segment "OAMALIGN"

.if ::MOUSE_READ_FROM_PORT = 1

MOUSE_PORT = CTRL_PORT1
CONTROLLER_PORT = CTRL_PORT2

.elseif ::MOUSE_READ_FROM_PORT = 2

MOUSE_PORT = CTRL_PORT2
CONTROLLER_PORT = CTRL_PORT1

.else
.error "Cannot read the snes mouse from any ports other than 1 or 2"
.endif

.else ; Two regular NES controllers

.segment "ZEROPAGE"
RESERVE_ZP joypad1, 3
RESERVE_ZP joypad2, 3

.endif

.proc oam_and_readjoypad
  ; and do the same for the controller
  lda joypad1
  sta TEMP + 3

.if .not ::USE_MOUSE_SUPPORT
  ; save the second joypad state too
  lda joypad2
  sta TEMP + 4

  lda #>OAM_BUF
  sta PPU_OAM_DMA          ; ------ OAM DMA ------
  ldx #1             ; get put          <- strobe code must take an odd number of cycles total
  stx SavedJoypad1Bits ; get put get
  stx CTRL_PORT1   ; put get put get
  dex                ; put get
  stx CTRL_PORT1   ; put get put get
read_loop:
  lda CTRL_PORT2   ; put get put GET  <- loop code must take an even number of cycles total
  and #3             ; put get
  cmp #1             ; put get
  rol SavedJoypad2Bits, x ; put get put get put get (X = 0; waste 1 cycle and 0 bytes for alignment)
  lda CTRL_PORT1   ; put get put GET
  and #3             ; put get
  cmp #1             ; put get
  rol SavedJoypad1Bits ; put get put get put
  bcc read_loop      ; get put [get]    <- this branch must not be allowed to cross a page
.else

  ; Save the previous mouse state so we can calculate the next frames press/release
  lda mouse + kMouseY
  sta TEMP + 0
  lda mouse + kMouseX
  sta TEMP + 1
  lda mouse + kMouseButtons
  sta TEMP + 2

  ; Strobe the joypads.
  LDX #$00
  LDY #$01
  STY mouse
  STY CTRL_PORT1

 .if ::MOUSE_CONFIG_SENSITIVITY <> 0
  ; Clock official mouse sensitivity. NOTE: This can be removed if not needed.
  LDA advance_sensitivity
  BEQ :+
  LDA MOUSE_PORT
  STX advance_sensitivity
 :
 .endif

  STX CTRL_PORT1

  LDA #>OAM_BUF
  STA PPU_OAM_DMA
 
  ; Desync cycles: 432, 576, 672, 848, 432*2-4 (860)

  ; DMC DMA:         ; PUT GET PUT GET        ; Starts: 0

 :
  LDA mouse_mask     ; get put get*     *576  ; Starts: 4, 158, 312, 466, [620]
  AND MOUSE_PORT   ; put get put GET
  CMP #$01           ; put get
  ROL mouse,X        ; put get put get* PUT GET  *432
  BCC :-             ; put get (put)

  INX                ; put get
  CPX #$04           ; put get
  STY mouse,X        ; put get put GET
  BNE :-             ; put get (put)

 :
  LDA CONTROLLER_PORT ; put get put GET        ; Starts: 619
  AND #$03           ; put get*         *672
  CMP #$01           ; put get
  ROL joypad1 ; put get put get put    ; This can desync, but we finish before it matters.
  BCC :-             ; get put (get)

 .if 0 ; TODO support SNES extra buttons 
  STY joypad1+1 ; get put get
  NOP                ; put get
 :
  LDA CONTROLLER_PORT ; put get* put GET *848  ; Starts: 751, [879]
  AND #$03           ; put get
  CMP #$01           ; put get
  ROL joypad1+1 ; put get put get put    ; This can desync, but we finish before it matters.
  BCC :-             ; get* put (get)   *860

  ; NEXT: 878
 .endif ; CONTROLLER_SIZE = 2

.endif ; USE_MOUSE_SUPPORT
  jmp calculate_extra_fields
.endproc

.segment "STARTUP"
.proc calculate_extra_fields
  ; calculate the press/release state for the controller buttons

  ; Pressed
  lda TEMP+3
  eor #%11111111
  and joypad1
  sta joypad1 + 1

  ; Released
  lda joypad1
  eor #%11111111
  and TEMP+3
  sta joypad1 + 2

.if ::USE_MOUSE_SUPPORT = 0
  ; also calculate the press/release for player 2
  
  ; Pressed
  lda TEMP+4
  eor #%11111111
  and joypad2
  sta joypad2 + 1

  ; Released
  lda joypad2
  eor #%11111111
  and TEMP+4
  sta joypad2 + 2

.else

  ; Check the report to see if we have a snes mouse plugged in
  lda mouse + kMouseButtons
  and #$0f
  cmp #$01
  beq :+
    ; no snes mouse, so leave the first field empty
    lda #0
    sta mouse + kMouseZero
	; and keep the X/Y where it was
	lda TEMP + 0
	sta mouse + kMouseY
	lda TEMP + 1
	sta mouse + kMouseX
    rts
  :

  ; convert the X/Y displacement into X/Y positions on the screen
  ldx #1
loop:
    lda mouse + kMouseY,x
    bpl :+
      ; subtract the negative number instead
      and #$7f
      sta mouse + kMouseZero ; reuse this value as a temp value
      lda TEMP,x
      sec 
      sbc mouse + kMouseZero
      ; check if we underflowed
      bcc wrappednegative
      ; check the lower bounds
      cmp MouseBoundsMin,x
      bcs setvalue ; didn't wrap so set the value now
    wrappednegative:
      lda MouseBoundsMin,x
      jmp setvalue
    :
    ; add the positive number
    clc
    adc TEMP,x
    ; check if we wrapped, set to the max bounds if we did
    bcs wrapped
    ; check the upper bounds
    cmp MouseBoundsMax,x
    bcc setvalue ; didn't wrap so set the value
wrapped:
    lda MouseBoundsMax,x
setvalue:
    sta mouse + kMouseY,x
    dex
    bpl loop
  ; calculate newly pressed buttons and shift it into byte zero
  lda TEMP+2
  eor #%11000000
  and mouse + kMouseButtons
  rol
  ror mouse + kMouseZero
  rol
  ror mouse + kMouseZero
  
  ; calculate newly released buttons
  lda mouse + kMouseButtons
  eor #%11000000
  and TEMP+2
  rol
  ror mouse + kMouseZero
  rol
  ror mouse + kMouseZero

  ; Set the connected bit
  sec
  ror mouse + kMouseZero
.endif

  rts

MouseBoundsMin:
  .byte MOUSE_Y_MINIMUM, MOUSE_X_MINIMUM
MouseBoundsMax:
  .byte MOUSE_Y_MAXIMUM, MOUSE_X_MAXIMUM
.endproc

.popseg

;;	.include "famitone2.s"
; included in crt0.s
