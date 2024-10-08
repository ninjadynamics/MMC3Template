_rain_music_data:
	.byte 1
	.word @instruments
	.word @samples-3
	.word @song0ch0,@song0ch1,@song0ch2,@song0ch3,@song0ch4,307,256

@instruments:
	.byte $30 ;instrument $00
	.word @env1,@env15,@env0
	.byte $00
	.byte $70 ;instrument $01
	.word @env2,@env0,@env16
	.byte $00
	.byte $70 ;instrument $02
	.word @env3,@env13,@env0
	.byte $00
	.byte $70 ;instrument $03
	.word @env3,@env14,@env0
	.byte $00
	.byte $30 ;instrument $04
	.word @env4,@env0,@env0
	.byte $00
	.byte $70 ;instrument $05
	.word @env5,@env13,@env0
	.byte $00
	.byte $70 ;instrument $06
	.word @env5,@env14,@env0
	.byte $00
	.byte $30 ;instrument $07
	.word @env6,@env0,@env0
	.byte $00
	.byte $30 ;instrument $08
	.word @env7,@env0,@env0
	.byte $00
	.byte $b0 ;instrument $09
	.word @env9,@env0,@env0
	.byte $00
	.byte $30 ;instrument $0a
	.word @env5,@env0,@env0
	.byte $00
	.byte $70 ;instrument $0b
	.word @env8,@env0,@env16
	.byte $00
	.byte $30 ;instrument $0c
	.word @env1,@env0,@env0
	.byte $00
	.byte $b0 ;instrument $0d
	.word @env2,@env0,@env16
	.byte $00
	.byte $b0 ;instrument $0e
	.word @env8,@env0,@env0
	.byte $00
	.byte $30 ;instrument $0f
	.word @env10,@env15,@env0
	.byte $00
	.byte $30 ;instrument $10
	.word @env11,@env0,@env16
	.byte $00
	.byte $30 ;instrument $11
	.word @env8,@env0,@env0
	.byte $00
	.byte $70 ;instrument $12
	.word @env12,@env0,@env16
	.byte $00

@samples:
	.byte $00+<(FT_DPCM_PTR),$00,$00	;1
	.byte $00+<(FT_DPCM_PTR),$00,$00	;2
	.byte $00+<(FT_DPCM_PTR),$00,$00	;3
	.byte $00+<(FT_DPCM_PTR),$00,$00	;4
	.byte $00+<(FT_DPCM_PTR),$00,$00	;5
	.byte $00+<(FT_DPCM_PTR),$00,$00	;6
	.byte $00+<(FT_DPCM_PTR),$00,$00	;7
	.byte $00+<(FT_DPCM_PTR),$00,$00	;8
	.byte $00+<(FT_DPCM_PTR),$00,$00	;9
	.byte $00+<(FT_DPCM_PTR),$00,$00	;10
	.byte $00+<(FT_DPCM_PTR),$00,$00	;11
	.byte $00+<(FT_DPCM_PTR),$00,$00	;12
	.byte $00+<(FT_DPCM_PTR),$00,$00	;13
	.byte $00+<(FT_DPCM_PTR),$00,$00	;14
	.byte $00+<(FT_DPCM_PTR),$00,$00	;15
	.byte $00+<(FT_DPCM_PTR),$00,$00	;16
	.byte $00+<(FT_DPCM_PTR),$00,$00	;17
	.byte $00+<(FT_DPCM_PTR),$00,$00	;18
	.byte $00+<(FT_DPCM_PTR),$00,$00	;19
	.byte $00+<(FT_DPCM_PTR),$00,$00	;20
	.byte $00+<(FT_DPCM_PTR),$00,$00	;21
	.byte $00+<(FT_DPCM_PTR),$00,$00	;22
	.byte $00+<(FT_DPCM_PTR),$00,$00	;23
	.byte $00+<(FT_DPCM_PTR),$00,$00	;24
	.byte $00+<(FT_DPCM_PTR),$0c,$0f	;25
	.byte $00+<(FT_DPCM_PTR),$00,$00	;26
	.byte $04+<(FT_DPCM_PTR),$1b,$0f	;27
	.byte $00+<(FT_DPCM_PTR),$00,$00	;28
	.byte $0b+<(FT_DPCM_PTR),$22,$0f	;29
	.byte $14+<(FT_DPCM_PTR),$0d,$0f	;30
	.byte $00+<(FT_DPCM_PTR),$00,$00	;31
	.byte $18+<(FT_DPCM_PTR),$0a,$0f	;32
	.byte $00+<(FT_DPCM_PTR),$00,$00	;33
	.byte $00+<(FT_DPCM_PTR),$00,$00	;34
	.byte $00+<(FT_DPCM_PTR),$00,$00	;35
	.byte $1b+<(FT_DPCM_PTR),$36,$0f	;36
	.byte $00+<(FT_DPCM_PTR),$00,$00	;37
	.byte $00+<(FT_DPCM_PTR),$00,$00	;38
	.byte $00+<(FT_DPCM_PTR),$00,$00	;39
	.byte $00+<(FT_DPCM_PTR),$00,$00	;40
	.byte $00+<(FT_DPCM_PTR),$00,$00	;41
	.byte $00+<(FT_DPCM_PTR),$00,$00	;42
	.byte $00+<(FT_DPCM_PTR),$00,$00	;43
	.byte $00+<(FT_DPCM_PTR),$00,$00	;44
	.byte $00+<(FT_DPCM_PTR),$00,$00	;45
	.byte $00+<(FT_DPCM_PTR),$00,$00	;46
	.byte $00+<(FT_DPCM_PTR),$00,$00	;47
	.byte $00+<(FT_DPCM_PTR),$00,$00	;48
	.byte $00+<(FT_DPCM_PTR),$00,$00	;49
	.byte $00+<(FT_DPCM_PTR),$00,$00	;50
	.byte $00+<(FT_DPCM_PTR),$00,$00	;51
	.byte $00+<(FT_DPCM_PTR),$00,$00	;52
	.byte $00+<(FT_DPCM_PTR),$00,$00	;53
	.byte $00+<(FT_DPCM_PTR),$00,$00	;54
	.byte $00+<(FT_DPCM_PTR),$00,$00	;55
	.byte $00+<(FT_DPCM_PTR),$00,$00	;56
	.byte $00+<(FT_DPCM_PTR),$00,$00	;57
	.byte $00+<(FT_DPCM_PTR),$00,$00	;58
	.byte $00+<(FT_DPCM_PTR),$00,$00	;59
	.byte $00+<(FT_DPCM_PTR),$00,$00	;60
	.byte $00+<(FT_DPCM_PTR),$00,$00	;61
	.byte $00+<(FT_DPCM_PTR),$00,$00	;62
	.byte $00+<(FT_DPCM_PTR),$00,$00	;63

@env0:
	.byte $c0,$00,$00
@env1:
	.byte $cf,$00,$00
@env2:
	.byte $c5,$c6,$c7,$05,$c6,$0b,$c5,$0f,$c4,$11,$c3,$14,$c2,$15,$c1,$1d
	.byte $c0,$00,$10
@env3:
	.byte $c5,$c5,$c4,$c4,$c3,$c3,$c2,$c2,$c1,$c1,$c0,$00,$0a
@env4:
	.byte $c8,$c4,$c3,$c2,$c2,$c1,$c1,$c0,$00,$07
@env5:
	.byte $c3,$02,$c2,$02,$c1,$02,$c0,$00,$06
@env6:
	.byte $ca,$c8,$c6,$c5,$c4,$c3,$c3,$c2,$c2,$c1,$03,$c0,$00,$0b
@env7:
	.byte $c6,$c6,$c3,$03,$c2,$03,$c1,$c1,$c0,$00,$08
@env8:
	.byte $c4,$03,$c3,$03,$c2,$30,$c1,$45,$c0,$00,$08
@env9:
	.byte $c8,$c5,$c5,$c4,$c4,$c3,$00,$05
@env10:
	.byte $cf,$cf,$c0,$00,$02
@env11:
	.byte $c9,$06,$c8,$08,$c7,$08,$c6,$09,$c5,$0a,$c4,$0e,$c3,$11,$c2,$16
	.byte $c1,$18,$c0,$00,$12
@env12:
	.byte $c5,$03,$c4,$06,$c3,$09,$c2,$23,$c3,$0a,$c4,$11,$c3,$0d,$c2,$0a
	.byte $c1,$0f,$c0,$00,$12
@env13:
	.byte $c0,$c0,$c3,$c3,$c7,$c7,$00,$00
@env14:
	.byte $c0,$c0,$c4,$c4,$c7,$c7,$00,$00
@env15:
	.byte $cc,$c0,$00,$01
@env16:
	.byte $c0,$0f,$c1,$c1,$c2,$c2,$c1,$c1,$c0,$c0,$00,$02


@song0ch0:
@song0ch0loop:
@ref0:
	.byte $84,$41,$41,$41,$8a,$41,$84,$41,$8a,$41,$41,$84,$41,$41,$41,$41
	.byte $8a,$41,$84,$41,$8a,$41,$84,$41,$40,$81
@ref1:
	.byte $86,$47,$47,$47,$8c,$47,$86,$47,$8c,$47,$47,$86,$47,$47,$47,$47
	.byte $8c,$47,$86,$47,$8c,$47,$86,$47,$46,$81
@ref2:
	.byte $39,$39,$39,$8c,$39,$86,$39,$8c,$39,$39,$86,$39,$39,$39,$39,$8c
	.byte $39,$86,$39,$8c,$39,$86,$39,$38,$81
@ref3:
	.byte $3d,$3d,$3d,$8c,$3d,$86,$3d,$8c,$3d,$3d,$86,$3d,$3d,$3d,$3d,$8c
	.byte $3d,$86,$3d,$8c,$3d,$3c,$85
	.byte $ff,$11
	.word @ref0
	.byte $ff,$11
	.word @ref1
	.byte $ff,$11
	.word @ref2
@ref7:
	.byte $3d,$3d,$3d,$8c,$3d,$86,$3d,$8c,$3d,$86,$3d,$3d,$3d,$3d,$8c,$3d
	.byte $3c,$91
@ref8:
	.byte $87,$84,$41,$41,$8a,$40,$85,$84,$41,$8a,$41,$96,$24,$28,$83,$84
	.byte $41,$41,$8a,$41,$96,$2f,$84,$41,$8a,$40,$81
@ref9:
	.byte $96,$2c,$2e,$83,$86,$47,$47,$8c,$47,$96,$2f,$86,$47,$8c,$47,$96
	.byte $2c,$85,$86,$47,$47,$8c,$46,$85,$96,$1e,$85
@ref10:
	.byte $20,$85,$86,$39,$39,$8c,$39,$96,$21,$86,$39,$8c,$38,$89,$86,$39
	.byte $39,$8c,$38,$85,$86,$39,$8c,$38,$81
@ref11:
	.byte $96,$36,$85,$86,$3d,$3d,$8c,$3c,$85,$86,$3d,$8c,$3d,$96,$32,$85
	.byte $86,$3d,$3d,$8c,$3c,$8d
	.byte $ff,$11
	.word @ref8
@ref13:
	.byte $96,$2c,$2e,$83,$86,$47,$47,$8c,$47,$96,$2f,$86,$47,$8c,$47,$96
	.byte $32,$85,$86,$47,$47,$8c,$46,$85,$96,$36,$85
@ref14:
	.byte $38,$85,$86,$39,$39,$8c,$38,$85,$86,$39,$8c,$38,$89,$86,$39,$39
	.byte $8c,$38,$85,$86,$39,$8c,$38,$81
@ref15:
	.byte $96,$3c,$85,$86,$3d,$3d,$8c,$3c,$85,$86,$3d,$8c,$3c,$89,$86,$3d
	.byte $3d,$8c,$3c,$85,$86,$3d,$8c,$3c,$81
@ref16:
	.byte $96,$21,$86,$39,$39,$8c,$39,$86,$39,$8c,$39,$86,$39,$39,$9c,$3d
	.byte $86,$39,$9c,$38,$85,$86,$39,$39,$9c,$36,$85
@ref17:
	.byte $96,$33,$86,$3d,$3d,$9c,$25,$86,$3d,$8c,$3d,$86,$3d,$3d,$8c,$3d
	.byte $86,$3d,$9c,$32,$85,$86,$3d,$3d,$9c,$2c,$85
@ref18:
	.byte $83,$86,$2f,$2f,$9c,$37,$86,$2f,$9c,$37,$86,$2f,$2f,$9c,$37,$86
	.byte $2f,$8c,$2e,$85,$86,$2f,$2f,$9c,$2c,$2e,$83
@ref19:
	.byte $33,$84,$29,$29,$9c,$33,$84,$29,$8a,$29,$84,$29,$29,$9c,$2f,$84
	.byte $29,$9c,$2e,$85,$84,$29,$29,$8a,$28,$85
@ref20:
	.byte $83,$86,$39,$39,$8c,$39,$86,$39,$8c,$39,$86,$39,$38,$85,$39,$9c
	.byte $2c,$85,$86,$39,$39,$9c,$32,$85
@ref21:
	.byte $2c,$2e,$86,$3d,$3d,$9c,$2f,$86,$3d,$8c,$3d,$86,$3d,$3d,$9c,$2d
	.byte $86,$3d,$9c,$2c,$85,$86,$3d,$3d,$8c,$3c,$85
@ref22:
	.byte $83,$86,$2f,$2f,$9c,$3d,$86,$2f,$9c,$3d,$86,$2f,$2f,$8c,$2f,$86
	.byte $2f,$8c,$2e,$85,$86,$2f,$2f,$9c,$46,$85
@ref23:
	.byte $4b,$86,$2f,$2f,$9c,$4b,$86,$2f,$8c,$2f,$86,$2f,$2f,$9c,$46,$8d
	.byte $96,$2c,$2e,$83,$32,$85
@ref24:
	.byte $21,$86,$39,$39,$8c,$39,$86,$39,$8c,$39,$86,$39,$39,$9c,$3d,$86
	.byte $39,$9c,$38,$85,$86,$39,$39,$9c,$36,$85
	.byte $ff,$10
	.word @ref17
	.byte $ff,$11
	.word @ref18
	.byte $ff,$10
	.word @ref19
@ref28:
	.byte $83,$86,$39,$39,$9c,$21,$86,$39,$9c,$25,$86,$39,$39,$8c,$39,$86
	.byte $39,$8c,$38,$85,$86,$39,$38,$9c,$26,$28,$85
@ref29:
	.byte $2d,$86,$3d,$3d,$9c,$29,$86,$3d,$9c,$2d,$86,$3d,$3d,$8c,$3d,$86
	.byte $3d,$8c,$3c,$85,$86,$3d,$3c,$9c,$2c,$2e,$85
@ref30:
	.byte $33,$86,$2f,$2f,$9c,$2f,$86,$2f,$9c,$2f,$86,$2f,$2f,$9c,$2f,$86
	.byte $2f,$8c,$2e,$85,$86,$2f,$2f,$8c,$2e,$85
@ref31:
	.byte $83,$86,$2f,$2f,$8c,$2f,$86,$2f,$8c,$2f,$86,$2f,$2f,$8c,$2e,$9d
	.byte $ff,$11
	.word @ref0
	.byte $ff,$11
	.word @ref1
	.byte $ff,$11
	.word @ref2
	.byte $ff,$10
	.word @ref3
	.byte $ff,$11
	.word @ref0
	.byte $ff,$11
	.word @ref1
	.byte $ff,$11
	.word @ref2
	.byte $ff,$0d
	.word @ref7
@ref40:
	.byte $8f,$9a,$36,$85,$3a,$3c,$8b,$3a,$85,$36,$85,$28,$85
@ref41:
	.byte $9f,$44,$85,$46,$95
@ref42:
	.byte $8f,$36,$85,$3a,$3c,$8b,$3a,$85,$28,$85,$2c,$85
@ref43:
	.byte $8f,$2d,$2f,$2c,$a5
@ref44:
	.byte $8f,$36,$85,$3a,$3c,$8b,$3a,$85,$32,$85,$36,$85
	.byte $ff,$05
	.word @ref41
@ref46:
	.byte $8f,$4e,$85,$4a,$8d,$46,$85,$44,$85,$40,$44,$83
@ref47:
	.byte $8f,$45,$47,$4a,$8d,$46,$85,$44,$8d
@ref48:
	.byte $8f,$a0,$10,$14,$83,$16,$8d,$16,$85,$14,$85,$16,$85
@ref49:
	.byte $9f,$14,$16,$83,$1a,$85,$1e,$8d
@ref50:
	.byte $16,$a5,$10,$14,$83,$16,$85,$14,$85
@ref51:
	.byte $87,$28,$2c,$83,$2e,$85,$2c,$8d,$82,$28,$2c,$83,$2e,$85,$2c,$85
@ref52:
	.byte $8f,$a0,$28,$2c,$83,$2e,$8d,$2c,$85,$28,$85,$2e,$85
@ref53:
	.byte $8f,$82,$2c,$2e,$83,$32,$85,$a0,$2c,$2e,$83,$32,$85,$36,$8d
@ref54:
	.byte $38,$ad,$36,$38,$83,$3c,$85
@ref55:
	.byte $87,$3a,$3c,$87,$3a,$3c,$83,$a2,$3d,$a0,$3c,$9d
	.byte $ff,$10
	.word @ref16
	.byte $ff,$10
	.word @ref17
	.byte $ff,$11
	.word @ref18
	.byte $ff,$10
	.word @ref19
	.byte $ff,$10
	.word @ref20
	.byte $ff,$11
	.word @ref21
	.byte $ff,$10
	.word @ref22
	.byte $ff,$0f
	.word @ref23
	.byte $ff,$10
	.word @ref24
	.byte $ff,$10
	.word @ref17
	.byte $ff,$11
	.word @ref18
	.byte $ff,$10
	.word @ref19
	.byte $ff,$11
	.word @ref28
	.byte $ff,$11
	.word @ref29
	.byte $ff,$10
	.word @ref30
	.byte $ff,$0a
	.word @ref31
	.byte $fd
	.word @song0ch0loop

@song0ch1:
@song0ch1loop:
@ref72:
	.byte $92,$11,$11,$11,$94,$11,$92,$29,$11,$94,$29,$92,$0d,$11,$11,$11
	.byte $94,$11,$92,$29,$2d,$94,$29,$92,$2e,$81
@ref73:
	.byte $94,$2f,$92,$17,$17,$94,$17,$92,$2f,$17,$94,$2f,$92,$11,$17,$17
	.byte $17,$94,$17,$92,$2f,$94,$2f,$92,$2c,$2e,$2c,$81
@ref74:
	.byte $09,$09,$09,$94,$09,$92,$21,$09,$94,$21,$92,$07,$09,$09,$09,$94
	.byte $09,$92,$21,$23,$94,$21,$92,$24,$81
@ref75:
	.byte $94,$25,$92,$0d,$0d,$94,$0d,$92,$25,$0d,$94,$25,$92,$0b,$0d,$94
	.byte $0b,$92,$25,$2d,$2f,$94,$2d,$92,$2c,$2e,$2c,$81
@ref76:
	.byte $11,$11,$11,$94,$11,$92,$29,$11,$94,$29,$92,$0d,$11,$11,$11,$94
	.byte $11,$92,$29,$2d,$94,$29,$92,$2e,$81
	.byte $ff,$12
	.word @ref73
	.byte $ff,$11
	.word @ref74
@ref79:
	.byte $94,$25,$92,$0d,$0d,$94,$0d,$92,$22,$24,$0d,$2c,$2e,$2d,$24,$85
	.byte $94,$24,$85,$92,$0d,$94,$0d,$92,$25,$24,$81
@ref80:
	.byte $11,$94,$10,$91,$82,$24,$28,$83,$2c,$85,$2e,$85,$32,$85,$2c,$2e
	.byte $83
@ref81:
	.byte $97,$2c,$95,$1e,$85,$20,$85
@ref82:
	.byte $af,$36,$38,$83,$36,$85
@ref83:
	.byte $97,$32,$a5
@ref84:
	.byte $97,$24,$28,$83,$2c,$85,$2e,$85,$32,$85,$2c,$2e,$83
@ref85:
	.byte $97,$32,$95,$36,$85,$38,$85
@ref86:
	.byte $af,$36,$38,$83,$3c,$85
@ref87:
	.byte $bf
@ref88:
	.byte $8f,$9a,$38,$9c,$39,$9a,$38,$3d,$38,$91,$36,$85,$32,$85
@ref89:
	.byte $24,$95,$2d,$9c,$2d,$9a,$2e,$32,$83,$2e,$85,$2c,$8d
@ref90:
	.byte $36,$a5,$33,$9c,$33,$9a,$2c,$2e,$83,$32,$85
@ref91:
	.byte $97,$2e,$a5
@ref92:
	.byte $97,$28,$9c,$29,$9a,$28,$2c,$85,$2e,$85,$32,$83,$2c,$2e,$85
@ref93:
	.byte $97,$2c,$a5
@ref94:
	.byte $3c,$a5,$3c,$85,$46,$85,$4a,$85
@ref95:
	.byte $97,$46,$a5
@ref96:
	.byte $8f,$38,$9c,$39,$9a,$38,$3d,$38,$91,$36,$85,$32,$85
	.byte $ff,$0b
	.word @ref89
	.byte $ff,$09
	.word @ref90
@ref99:
	.byte $97,$2e,$a5
@ref100:
	.byte $1e,$20,$87,$24,$89,$29,$9c,$29,$9a,$24,$8b,$26,$28,$85,$2c,$85
@ref101:
	.byte $28,$89,$2c,$89,$2f,$9c,$2f,$9a,$2c,$8b,$2c,$2e,$85,$32,$85
@ref102:
	.byte $2e,$bd
@ref103:
	.byte $a4,$14,$16,$bb
	.byte $ff,$11
	.word @ref72
	.byte $ff,$12
	.word @ref73
	.byte $ff,$11
	.word @ref74
	.byte $ff,$12
	.word @ref75
	.byte $ff,$11
	.word @ref76
	.byte $ff,$12
	.word @ref73
	.byte $ff,$11
	.word @ref74
	.byte $ff,$13
	.word @ref79
@ref112:
	.byte $11,$94,$11,$84,$29,$29,$8a,$28,$85,$84,$29,$8a,$29,$9c,$3a,$3c
	.byte $83,$84,$29,$29,$8a,$29,$9c,$3b,$92,$29,$94,$28,$81
@ref113:
	.byte $92,$11,$94,$11,$84,$29,$29,$8a,$28,$85,$84,$29,$8a,$28,$89,$92
	.byte $11,$94,$11,$92,$29,$94,$29,$92,$2f,$94,$2e,$81
@ref114:
	.byte $92,$17,$94,$17,$86,$2f,$2f,$8c,$2e,$85,$86,$2f,$8c,$2f,$9c,$3a
	.byte $3c,$83,$86,$2f,$2f,$8c,$2f,$9c,$3b,$92,$2f,$94,$2e,$81
@ref115:
	.byte $92,$0d,$94,$0d,$86,$25,$25,$8c,$24,$85,$86,$25,$8c,$25,$9c,$2c
	.byte $85,$92,$0d,$94,$0d,$92,$25,$94,$25,$92,$2b,$94,$2a,$81
@ref116:
	.byte $92,$11,$94,$11,$84,$29,$29,$8a,$28,$85,$84,$29,$8a,$29,$9c,$3a
	.byte $3c,$83,$84,$29,$29,$8a,$29,$9c,$3b,$92,$29,$94,$28,$81
	.byte $ff,$10
	.word @ref113
@ref118:
	.byte $92,$09,$94,$09,$86,$21,$21,$8c,$20,$85,$86,$21,$8c,$21,$9c,$4a
	.byte $85,$86,$21,$21,$8c,$21,$9c,$47,$92,$21,$94,$20,$81
@ref119:
	.byte $92,$0d,$94,$0d,$86,$25,$25,$8c,$24,$85,$86,$25,$8c,$25,$9c,$4a
	.byte $85,$92,$0d,$94,$0d,$92,$25,$94,$25,$92,$2b,$94,$2a,$81
@ref120:
	.byte $83,$84,$29,$29,$8a,$29,$84,$29,$8a,$29,$84,$29,$29,$a2,$17,$84
	.byte $29,$8a,$28,$85,$84,$29,$29,$a2,$14,$85
@ref121:
	.byte $17,$86,$2f,$2f,$a2,$17,$86,$2f,$8c,$2f,$86,$2f,$2f,$8c,$2e,$85
	.byte $86,$2f,$2f,$a2,$1a,$85,$1e,$85
@ref122:
	.byte $83,$86,$21,$21,$a2,$17,$86,$21,$a2,$17,$86,$21,$21,$8c,$21,$86
	.byte $21,$8c,$20,$85,$86,$21,$21,$a2,$16,$85
@ref123:
	.byte $15,$86,$25,$25,$8c,$25,$86,$25,$a2,$15,$86,$25,$25,$a2,$14,$85
	.byte $86,$25,$25,$96,$28,$2c,$83,$2e,$85
@ref124:
	.byte $2d,$84,$29,$29,$8a,$29,$84,$29,$8a,$29,$84,$29,$29,$a2,$2f,$84
	.byte $29,$8a,$28,$85,$84,$29,$29,$a2,$28,$85
@ref125:
	.byte $2f,$86,$2f,$2f,$8c,$2f,$86,$2f,$8c,$2f,$86,$2f,$2f,$96,$32,$85
	.byte $86,$2f,$2f,$a2,$32,$85,$36,$85
@ref126:
	.byte $83,$86,$21,$21,$a2,$39,$86,$21,$a2,$39,$86,$21,$21,$8c,$21,$86
	.byte $21,$8c,$20,$85,$86,$21,$21,$a2,$36,$38,$83
@ref127:
	.byte $3d,$86,$25,$25,$8c,$25,$86,$25,$a2,$3d,$86,$25,$25,$8c,$24,$85
	.byte $a2,$3c,$95
	.byte $ff,$0b
	.word @ref88
	.byte $ff,$0b
	.word @ref89
	.byte $ff,$09
	.word @ref90
@ref131:
	.byte $97,$2e,$a5
	.byte $ff,$0d
	.word @ref92
@ref133:
	.byte $97,$2c,$a5
	.byte $ff,$08
	.word @ref94
@ref135:
	.byte $97,$46,$a5
	.byte $ff,$0b
	.word @ref96
	.byte $ff,$0b
	.word @ref89
	.byte $ff,$09
	.word @ref90
@ref139:
	.byte $97,$2e,$a5
	.byte $ff,$0e
	.word @ref100
	.byte $ff,$0d
	.word @ref101
@ref142:
	.byte $2e,$bd
@ref143:
	.byte $a4,$14,$16,$bb
	.byte $fd
	.word @song0ch1loop

@song0ch2:
@song0ch2loop:
@ref144:
	.byte $80,$28,$00,$28,$00,$29,$01,$41,$29,$01,$24,$00,$28,$00,$28,$00
	.byte $29,$01,$41,$98,$44,$85,$46,$81
@ref145:
	.byte $80,$2e,$00,$2e,$00,$2f,$01,$47,$2f,$01,$28,$00,$2e,$00,$2e,$00
	.byte $2e,$00,$83,$98,$46,$85,$44,$46,$44,$81
@ref146:
	.byte $80,$20,$00,$20,$00,$21,$01,$39,$21,$01,$1e,$00,$20,$00,$20,$00
	.byte $21,$01,$98,$39,$3a,$85,$3c,$81
@ref147:
	.byte $80,$24,$00,$24,$00,$25,$01,$3d,$25,$01,$22,$00,$25,$01,$98,$3d
	.byte $45,$46,$85,$44,$46,$44,$81
	.byte $ff,$16
	.word @ref144
	.byte $ff,$18
	.word @ref145
@ref150:
	.byte $80,$20,$00,$20,$00,$21,$01,$39,$21,$01,$1e,$00,$20,$00,$20,$00
	.byte $21,$01,$39,$98,$3a,$85,$3c,$81
@ref151:
	.byte $80,$24,$00,$24,$00,$25,$01,$98,$3a,$3c,$83,$44,$46,$45,$3c,$89
	.byte $3a,$36,$80,$25,$01,$3c,$00,$3c,$00
@ref152:
	.byte $28,$00,$28,$00,$29,$01,$41,$00,$85,$24,$00,$28,$00,$28,$00,$29
	.byte $01,$41,$41,$29,$00,$81
@ref153:
	.byte $2e,$00,$2e,$00,$2f,$01,$47,$00,$85,$28,$00,$2e,$00,$2e,$00,$2e
	.byte $00,$83,$47,$01,$46,$00,$46,$00
@ref154:
	.byte $20,$00,$20,$00,$21,$01,$39,$00,$85,$20,$00,$20,$00,$20,$00,$21
	.byte $01,$39,$39,$21,$00,$81
@ref155:
	.byte $24,$00,$24,$00,$25,$01,$3d,$00,$85,$22,$00,$24,$00,$24,$00,$24
	.byte $00,$83,$3c,$83,$00,$25,$3c,$81
	.byte $ff,$16
	.word @ref152
	.byte $ff,$18
	.word @ref153
	.byte $ff,$16
	.word @ref154
@ref159:
	.byte $24,$00,$24,$00,$25,$01,$3d,$00,$85,$23,$24,$85,$3d,$3d,$24,$85
	.byte $37,$36,$81
@ref160:
	.byte $20,$83,$00,$20,$00,$20,$83,$00,$20,$00,$39,$01,$20,$83,$00,$20
	.byte $00,$20,$83,$00,$21,$3a,$85
@ref161:
	.byte $24,$83,$00,$24,$00,$24,$83,$00,$24,$00,$3d,$01,$24,$83,$00,$24
	.byte $00,$24,$83,$00,$24,$00,$44,$85
@ref162:
	.byte $2e,$83,$00,$2e,$00,$2e,$83,$00,$2e,$00,$47,$01,$2e,$83,$00,$2e
	.byte $00,$2e,$83,$00,$2f,$2c,$85
@ref163:
	.byte $28,$83,$00,$28,$00,$28,$83,$00,$28,$00,$41,$01,$28,$83,$00,$28
	.byte $00,$28,$83,$00,$41,$3c,$85
	.byte $ff,$17
	.word @ref160
	.byte $ff,$18
	.word @ref161
	.byte $ff,$17
	.word @ref162
@ref167:
	.byte $2e,$83,$00,$2e,$00,$2e,$83,$00,$2e,$00,$47,$01,$2e,$85,$00,$85
	.byte $44,$98,$46,$83,$80,$4a,$85
	.byte $ff,$17
	.word @ref160
	.byte $ff,$18
	.word @ref161
	.byte $ff,$17
	.word @ref162
	.byte $ff,$17
	.word @ref163
	.byte $ff,$17
	.word @ref160
	.byte $ff,$18
	.word @ref161
	.byte $ff,$17
	.word @ref162
@ref175:
	.byte $2e,$83,$00,$2e,$00,$2e,$83,$00,$2e,$00,$47,$01,$2e,$85,$00,$95
@ref176:
	.byte $28,$00,$28,$00,$29,$01,$41,$29,$01,$24,$00,$28,$00,$28,$00,$29
	.byte $01,$41,$98,$44,$85,$46,$81
	.byte $ff,$18
	.word @ref145
	.byte $ff,$16
	.word @ref146
	.byte $ff,$15
	.word @ref147
	.byte $ff,$16
	.word @ref144
	.byte $ff,$18
	.word @ref145
	.byte $ff,$16
	.word @ref150
	.byte $ff,$16
	.word @ref151
@ref184:
	.byte $28,$00,$29,$9e,$41,$40,$89,$40,$8d,$41,$40,$89,$80,$41,$00,$81
@ref185:
	.byte $28,$00,$29,$9e,$41,$40,$89,$40,$8d,$80,$28,$00,$9e,$29,$80,$40
	.byte $00,$9e,$41,$80,$46,$00,$9e,$46,$81
@ref186:
	.byte $80,$2e,$00,$2f,$9e,$47,$46,$89,$46,$8d,$47,$46,$89,$80,$47,$00
	.byte $81
@ref187:
	.byte $24,$00,$25,$9e,$3d,$3c,$89,$3c,$8d,$80,$24,$00,$9e,$25,$80,$3c
	.byte $00,$9e,$3d,$80,$42,$00,$9e,$42,$81
@ref188:
	.byte $80,$28,$00,$29,$9e,$41,$40,$89,$40,$8d,$41,$40,$89,$80,$41,$00
	.byte $81
	.byte $ff,$12
	.word @ref185
@ref190:
	.byte $80,$20,$00,$21,$9e,$39,$38,$89,$38,$8d,$39,$38,$89,$80,$39,$00
	.byte $81
@ref191:
	.byte $24,$00,$25,$9e,$3d,$3c,$89,$3c,$8d,$80,$24,$00,$24,$89,$00,$85
	.byte $ff,$16
	.word @ref152
	.byte $ff,$18
	.word @ref153
	.byte $ff,$16
	.word @ref154
	.byte $ff,$18
	.word @ref155
	.byte $ff,$16
	.word @ref152
	.byte $ff,$18
	.word @ref153
	.byte $ff,$16
	.word @ref154
	.byte $ff,$13
	.word @ref159
	.byte $ff,$17
	.word @ref160
	.byte $ff,$18
	.word @ref161
	.byte $ff,$17
	.word @ref162
	.byte $ff,$17
	.word @ref163
	.byte $ff,$17
	.word @ref160
	.byte $ff,$18
	.word @ref161
	.byte $ff,$17
	.word @ref162
	.byte $ff,$15
	.word @ref167
	.byte $ff,$17
	.word @ref160
	.byte $ff,$18
	.word @ref161
	.byte $ff,$17
	.word @ref162
	.byte $ff,$17
	.word @ref163
	.byte $ff,$17
	.word @ref160
	.byte $ff,$18
	.word @ref161
	.byte $ff,$17
	.word @ref162
	.byte $ff,$10
	.word @ref175
	.byte $fd
	.word @song0ch2loop

@song0ch3:
	.byte $fb,$06
@song0ch3loop:
@ref216:
	.byte $fb,$05,$88,$1f,$fb,$03,$1f,$fb,$05,$1f,$fb,$03,$90,$1f,$fb,$05
	.byte $8e,$1f,$fb,$03,$88,$1f,$fb,$05,$90,$1f,$fb,$03,$88,$1f,$fb,$05
	.byte $1f,$fb,$03,$1f,$fb,$05,$8e,$1f,$fb,$03,$90,$1f,$fb,$05,$8e,$1f
	.byte $fb,$03,$90,$1f,$fb,$05,$88,$1f,$fb,$03,$1e,$81
@ref217:
	.byte $fb,$05,$1f,$fb,$03,$1f,$fb,$05,$1f,$fb,$03,$90,$1f,$fb,$05,$8e
	.byte $1f,$fb,$03,$88,$1f,$fb,$05,$90,$1f,$fb,$03,$88,$1f,$fb,$05,$1f
	.byte $fb,$03,$1f,$fb,$05,$8e,$1f,$fb,$03,$90,$1f,$fb,$05,$8e,$1f,$fb
	.byte $03,$90,$1f,$fb,$05,$88,$1f,$fb,$03,$1e,$81
	.byte $ff,$11
	.word @ref217
@ref219:
	.byte $fb,$05,$1f,$fb,$03,$1f,$fb,$05,$1f,$fb,$03,$90,$1f,$fb,$05,$8e
	.byte $1f,$fb,$03,$88,$1f,$fb,$05,$90,$1f,$fb,$03,$88,$1f,$fb,$05,$1f
	.byte $fb,$03,$1f,$fb,$05,$8e,$1f,$fb,$03,$83,$fb,$05,$1f,$fb,$03,$83
	.byte $fb,$05,$1f,$fb,$03,$83
	.byte $ff,$11
	.word @ref216
	.byte $ff,$11
	.word @ref217
	.byte $ff,$11
	.word @ref217
	.byte $ff,$10
	.word @ref219
@ref224:
	.byte $fb,$05,$88,$1f,$fb,$03,$83,$fb,$05,$8e,$1f,$fb,$03,$88,$1f,$fb
	.byte $05,$90,$1f,$fb,$03,$83,$fb,$05,$8e,$1f,$fb,$03,$88,$1f,$fb,$05
	.byte $83,$fb,$03,$83,$fb,$05,$8e,$1f,$fb,$03,$83,$fb,$05,$90,$1f,$fb
	.byte $03,$83,$fb,$05,$8e,$1f,$fb,$03,$83
@ref225:
	.byte $fb,$05,$88,$1f,$fb,$03,$83,$fb,$05,$8e,$1f,$fb,$03,$88,$1f,$fb
	.byte $05,$90,$1f,$fb,$03,$83,$fb,$05,$8e,$1f,$fb,$03,$88,$1f,$fb,$05
	.byte $83,$fb,$03,$1f,$fb,$05,$8e,$1f,$fb,$03,$88,$1f,$fb,$05,$90,$1f
	.byte $fb,$03,$88,$1f,$fb,$05,$8e,$1f,$fb,$03,$88,$1e,$81
@ref226:
	.byte $fb,$05,$1f,$fb,$03,$83,$fb,$05,$8e,$1f,$fb,$03,$88,$1f,$fb,$05
	.byte $90,$1f,$fb,$03,$83,$fb,$05,$8e,$1f,$fb,$03,$88,$1f,$fb,$05,$83
	.byte $fb,$03,$83,$fb,$05,$8e,$1f,$fb,$03,$83,$fb,$05,$90,$1f,$fb,$03
	.byte $83,$fb,$05,$8e,$1f,$fb,$03,$83
	.byte $ff,$11
	.word @ref225
	.byte $ff,$10
	.word @ref226
	.byte $ff,$11
	.word @ref225
	.byte $ff,$10
	.word @ref226
@ref231:
	.byte $fb,$05,$88,$1f,$fb,$03,$83,$fb,$05,$8e,$1f,$fb,$03,$88,$1f,$fb
	.byte $05,$90,$1f,$fb,$03,$83,$fb,$05,$8e,$1f,$fb,$03,$88,$1f,$fb,$05
	.byte $8e,$1f,$fb,$03,$83,$fb,$05,$88,$1f,$fb,$03,$83,$fb,$05,$1f,$fb
	.byte $03,$83,$fb,$05,$1f,$fb,$03,$83
@ref232:
	.byte $fb,$05,$8e,$1d,$fb,$03,$90,$1f,$fb,$05,$88,$1f,$fb,$03,$90,$1f
	.byte $fb,$05,$88,$1f,$fb,$03,$1f,$fb,$05,$1f,$fb,$03,$8e,$1f,$fb,$05
	.byte $88,$1f,$fb,$03,$90,$1f,$fb,$05,$88,$1f,$fb,$03,$90,$1f,$fb,$05
	.byte $88,$1f,$fb,$03,$1f,$fb,$05,$1f,$fb,$03,$8e,$1e,$81
@ref233:
	.byte $fb,$05,$1d,$fb,$03,$90,$1f,$fb,$05,$88,$1f,$fb,$03,$90,$1f,$fb
	.byte $05,$88,$1f,$fb,$03,$1f,$fb,$05,$1f,$fb,$03,$8e,$1f,$fb,$05,$88
	.byte $1f,$fb,$03,$90,$1f,$fb,$05,$88,$1f,$fb,$03,$90,$1f,$fb,$05,$88
	.byte $1f,$fb,$03,$1f,$fb,$05,$1f,$fb,$03,$8e,$1e,$81
	.byte $ff,$11
	.word @ref233
	.byte $ff,$11
	.word @ref233
	.byte $ff,$11
	.word @ref233
	.byte $ff,$11
	.word @ref233
	.byte $ff,$11
	.word @ref233
@ref239:
	.byte $fb,$05,$1d,$fb,$03,$90,$1f,$fb,$05,$88,$1f,$fb,$03,$90,$1f,$fb
	.byte $05,$88,$1f,$fb,$03,$1f,$fb,$05,$1f,$fb,$03,$8e,$1f,$fb,$05,$90
	.byte $1f,$fb,$03,$83,$fb,$05,$1f,$fb,$03,$83,$fb,$05,$1b,$fb,$03,$83
	.byte $fb,$05,$83,$fb,$03,$83
	.byte $ff,$11
	.word @ref232
	.byte $ff,$11
	.word @ref233
	.byte $ff,$11
	.word @ref233
	.byte $ff,$11
	.word @ref233
	.byte $ff,$11
	.word @ref233
	.byte $ff,$11
	.word @ref233
	.byte $ff,$11
	.word @ref233
	.byte $ff,$10
	.word @ref239
	.byte $ff,$11
	.word @ref216
	.byte $ff,$11
	.word @ref217
	.byte $ff,$11
	.word @ref217
	.byte $ff,$10
	.word @ref219
	.byte $ff,$11
	.word @ref216
	.byte $ff,$11
	.word @ref217
	.byte $ff,$11
	.word @ref217
	.byte $ff,$10
	.word @ref219
@ref256:
	.byte $fb,$05,$90,$1f,$fb,$03,$83,$fb,$05,$83,$fb,$03,$83,$fb,$05,$1f
	.byte $fb,$03,$83,$fb,$05,$83,$fb,$03,$83,$fb,$05,$1f,$fb,$03,$83,$fb
	.byte $05,$83,$fb,$03,$83,$fb,$05,$1f,$fb,$03,$83,$fb,$05,$83,$fb,$03
	.byte $88,$1e,$81
@ref257:
	.byte $fb,$05,$90,$1f,$fb,$03,$83,$fb,$05,$83,$fb,$03,$83,$fb,$05,$1f
	.byte $fb,$03,$83,$fb,$05,$83,$fb,$03,$83,$fb,$05,$1f,$fb,$03,$83,$fb
	.byte $05,$88,$1f,$fb,$03,$1f,$fb,$05,$1f,$fb,$03,$1f,$fb,$05,$1f,$fb
	.byte $03,$1e,$81
	.byte $ff,$11
	.word @ref256
	.byte $ff,$11
	.word @ref257
	.byte $ff,$11
	.word @ref256
	.byte $ff,$11
	.word @ref257
	.byte $ff,$11
	.word @ref256
	.byte $ff,$11
	.word @ref257
@ref264:
	.byte $fb,$05,$1f,$fb,$03,$1f,$fb,$05,$90,$1f,$fb,$03,$88,$1f,$fb,$05
	.byte $1f,$fb,$03,$1f,$fb,$05,$90,$1f,$fb,$03,$88,$1f,$fb,$05,$1f,$fb
	.byte $03,$1f,$fb,$05,$90,$1f,$fb,$03,$88,$1f,$fb,$05,$1f,$fb,$03,$1f
	.byte $fb,$05,$90,$1f,$fb,$03,$8e,$1e,$81
@ref265:
	.byte $fb,$05,$88,$1f,$fb,$03,$1f,$fb,$05,$90,$1f,$fb,$03,$88,$1f,$fb
	.byte $05,$1f,$fb,$03,$1f,$fb,$05,$90,$1f,$fb,$03,$88,$1f,$fb,$05,$1f
	.byte $fb,$03,$1f,$fb,$05,$90,$1f,$fb,$03,$88,$1f,$fb,$05,$1f,$fb,$03
	.byte $1f,$fb,$05,$90,$1f,$fb,$03,$8e,$1e,$81
	.byte $ff,$11
	.word @ref265
	.byte $ff,$11
	.word @ref265
	.byte $ff,$11
	.word @ref265
	.byte $ff,$11
	.word @ref265
	.byte $ff,$11
	.word @ref265
@ref271:
	.byte $fb,$05,$88,$1f,$fb,$03,$1f,$fb,$05,$90,$1f,$fb,$03,$88,$1f,$fb
	.byte $05,$1f,$fb,$03,$1f,$fb,$05,$90,$1f,$fb,$03,$88,$1f,$fb,$05,$1f
	.byte $fb,$03,$83,$fb,$05,$83,$fb,$03,$83,$fb,$05,$1f,$fb,$03,$1f,$fb
	.byte $05,$90,$1f,$fb,$03,$8e,$1e,$81
	.byte $ff,$11
	.word @ref233
	.byte $ff,$11
	.word @ref233
	.byte $ff,$11
	.word @ref233
	.byte $ff,$11
	.word @ref233
	.byte $ff,$11
	.word @ref233
	.byte $ff,$11
	.word @ref233
	.byte $ff,$11
	.word @ref233
	.byte $ff,$10
	.word @ref239
	.byte $ff,$11
	.word @ref232
	.byte $ff,$11
	.word @ref233
	.byte $ff,$11
	.word @ref233
	.byte $ff,$11
	.word @ref233
	.byte $ff,$11
	.word @ref233
	.byte $ff,$11
	.word @ref233
	.byte $ff,$11
	.word @ref233
	.byte $ff,$10
	.word @ref239
	.byte $fd
	.word @song0ch3loop

@song0ch4:
@song0ch4loop:
@ref288:
	.byte $32,$85,$32,$85,$3b,$32,$85,$33,$33,$33,$32,$85,$3b,$33,$36,$85
@ref289:
	.byte $32,$85,$32,$85,$3b,$32,$85,$33,$33,$33,$32,$85,$3a,$83,$36,$37
	.byte $36,$81
@ref290:
	.byte $32,$85,$32,$85,$3b,$32,$85,$33,$33,$33,$32,$85,$3b,$33,$36,$83
	.byte $36
@ref291:
	.byte $32,$85,$32,$85,$3b,$32,$85,$3b,$32,$83,$36,$3b,$3b,$3a,$83,$36
	.byte $3b,$3a,$81
	.byte $ff,$10
	.word @ref288
	.byte $ff,$12
	.word @ref289
@ref294:
	.byte $32,$85,$32,$85,$3b,$32,$85,$33,$33,$33,$32,$85,$3b,$32,$85,$3a
	.byte $81
@ref295:
	.byte $32,$85,$32,$85,$3b,$32,$85,$33,$3a,$93,$36,$37,$36,$81
@ref296:
	.byte $32,$8d,$36,$89,$32,$89,$32,$85,$37,$32,$89
@ref297:
	.byte $32,$85,$32,$85,$36,$89,$32,$89,$32,$85,$36,$85,$33,$32,$81
@ref298:
	.byte $32,$8d,$36,$89,$32,$89,$32,$85,$37,$32,$85,$36,$81
@ref299:
	.byte $32,$85,$32,$85,$36,$85,$37,$32,$89,$32,$85,$36,$85,$37,$36,$81
	.byte $ff,$0b
	.word @ref296
	.byte $ff,$0f
	.word @ref297
	.byte $ff,$0d
	.word @ref298
@ref303:
	.byte $32,$85,$32,$85,$37,$32,$85,$37,$32,$8b,$36,$3a,$85,$3a,$85
@ref304:
	.byte $32,$89,$33,$36,$89,$32,$89,$32,$85,$3b,$32,$89
@ref305:
	.byte $32,$89,$33,$36,$89,$32,$85,$37,$32,$85,$3a,$85,$33,$32,$81
	.byte $ff,$0c
	.word @ref304
	.byte $ff,$0f
	.word @ref305
	.byte $ff,$0c
	.word @ref304
	.byte $ff,$0f
	.word @ref305
	.byte $ff,$0c
	.word @ref304
@ref311:
	.byte $32,$89,$33,$36,$89,$32,$85,$37,$32,$83,$3a,$3a,$85,$3a,$85
	.byte $ff,$0c
	.word @ref304
	.byte $ff,$0f
	.word @ref305
	.byte $ff,$0c
	.word @ref304
	.byte $ff,$0f
	.word @ref305
	.byte $ff,$0c
	.word @ref304
	.byte $ff,$0f
	.word @ref305
	.byte $ff,$0c
	.word @ref304
@ref319:
	.byte $32,$89,$33,$36,$89,$32,$85,$37,$32,$85,$3a,$8d
	.byte $ff,$10
	.word @ref288
	.byte $ff,$12
	.word @ref289
	.byte $ff,$11
	.word @ref290
	.byte $ff,$13
	.word @ref291
	.byte $ff,$10
	.word @ref288
	.byte $ff,$12
	.word @ref289
	.byte $ff,$11
	.word @ref294
	.byte $ff,$0e
	.word @ref295
@ref328:
	.byte $32,$8d,$3c,$89,$40,$89,$40,$85,$3c,$89,$40,$81
@ref329:
	.byte $32,$85,$40,$85,$3d,$40,$85,$40,$89,$32,$85,$3d,$32,$89
	.byte $ff,$0c
	.word @ref328
@ref331:
	.byte $32,$85,$40,$85,$3d,$40,$85,$40,$85,$3d,$40,$85,$3c,$85,$3d,$3c
	.byte $81
	.byte $ff,$0c
	.word @ref328
	.byte $ff,$11
	.word @ref331
	.byte $ff,$0c
	.word @ref328
@ref335:
	.byte $32,$85,$40,$85,$3d,$40,$85,$32,$8f,$36,$37,$37,$37,$36,$81
@ref336:
	.byte $32,$89,$33,$37,$32,$85,$36,$89,$32,$85,$3b,$32,$85,$32,$81
@ref337:
	.byte $32,$89,$33,$37,$32,$85,$37,$32,$85,$32,$85,$3b,$33,$32,$85
	.byte $ff,$0f
	.word @ref336
@ref339:
	.byte $32,$89,$33,$37,$32,$85,$37,$32,$85,$32,$85,$3b,$33,$3b,$3a,$81
	.byte $ff,$0f
	.word @ref336
	.byte $ff,$0f
	.word @ref337
	.byte $ff,$0f
	.word @ref336
@ref343:
	.byte $32,$89,$33,$3b,$33,$3b,$3b,$3a,$8d,$36,$83,$36,$37,$36,$81
	.byte $ff,$0c
	.word @ref304
	.byte $ff,$0f
	.word @ref305
	.byte $ff,$0c
	.word @ref304
	.byte $ff,$0f
	.word @ref305
	.byte $ff,$0c
	.word @ref304
	.byte $ff,$0f
	.word @ref305
	.byte $ff,$0c
	.word @ref304
	.byte $ff,$0f
	.word @ref311
	.byte $ff,$0c
	.word @ref304
	.byte $ff,$0f
	.word @ref305
	.byte $ff,$0c
	.word @ref304
	.byte $ff,$0f
	.word @ref305
	.byte $ff,$0c
	.word @ref304
	.byte $ff,$0f
	.word @ref305
	.byte $ff,$0c
	.word @ref304
	.byte $ff,$0c
	.word @ref319
	.byte $fd
	.word @song0ch4loop

