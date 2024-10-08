;this file for FamiTone2 library generated by FamiStudio

_journey_to_silius_music_data:
	.byte 1
	.word @instruments
	.word @samples-3
	.word @song0ch0,@song0ch1,@song0ch2,@song0ch3,@song0ch4,307,256

@instruments:
	.byte $70 ;instrument 00 (BackingLead)
	.word @env13, @env0, @env0
	.byte $00
	.byte $30 ;instrument 01 (Lead0)
	.word @env10, @env0, @env21
	.byte $00
	.byte $30 ;instrument 02 (Lead0Alt)
	.word @env6, @env0, @env22
	.byte $00
	.byte $30 ;instrument 03 (Lead0End1)
	.word @env1, @env0, @env0
	.byte $00
	.byte $30 ;instrument 04 (Lead0End2)
	.word @env8, @env0, @env3
	.byte $00
	.byte $30 ;instrument 05 (Lead0Plain)
	.word @env12, @env0, @env0
	.byte $00
	.byte $30 ;instrument 06 (Lead0Release)
	.word @env19, @env0, @env21
	.byte $00
	.byte $30 ;instrument 07 (Lead0Sweep)
	.word @env8, @env23, @env9
	.byte $00
	.byte $30 ;instrument 08 (Lead0SweepLow)
	.word @env12, @env23, @env9
	.byte $00
	.byte $70 ;instrument 09 (Lead1)
	.word @env10, @env0, @env21
	.byte $00
	.byte $70 ;instrument 0a (Lead1Alt)
	.word @env2, @env0, @env22
	.byte $00
	.byte $70 ;instrument 0b (Lead1Release)
	.word @env19, @env0, @env0
	.byte $00
	.byte $70 ;instrument 0c (Lead1TremoloAlt)
	.word @env10, @env0, @env20
	.byte $00
	.byte $b0 ;instrument 0d (Lead2)
	.word @env24, @env0, @env4
	.byte $00
	.byte $b0 ;instrument 0e (Lead2Plain)
	.word @env12, @env0, @env0
	.byte $00
	.byte $b0 ;instrument 0f (Lead2Release)
	.word @env7, @env0, @env15
	.byte $00
	.byte $30 ;instrument 10 (TomNoise1)
	.word @env11, @env17, @env0
	.byte $00
	.byte $30 ;instrument 11 (TomNoise2)
	.word @env14, @env18, @env0
	.byte $00
	.byte $30 ;instrument 12 (TomNoise3)
	.word @env11, @env18, @env0
	.byte $00
	.byte $30 ;instrument 13 (TomTriangle)
	.word @env5, @env16, @env0
	.byte $00
	.byte $30 ;instrument 14 (TomTrianglePlain)
	.word @env5, @env0, @env0
	.byte $00

@samples:
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;1 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;2 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;3 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;4 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;5 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;6 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;7 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;8 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;9 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;10 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;11 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;12 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;13 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;14 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;15 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;16 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;17 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;18 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;19 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;20 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;21 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;22 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;23 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;24 
	.byte $00+.lobyte(FT_DPCM_PTR),$3f,$0c	;25 (ripped00)
	.byte $00+.lobyte(FT_DPCM_PTR),$3f,$0a	;26 (ripped00)
	.byte $00+.lobyte(FT_DPCM_PTR),$3f,$0e	;27 (ripped00)
	.byte $00+.lobyte(FT_DPCM_PTR),$3f,$09	;28 (ripped00)
	.byte $10+.lobyte(FT_DPCM_PTR),$3e,$0d	;29 (ripped01)
	.byte $10+.lobyte(FT_DPCM_PTR),$3e,$08	;30 (ripped01)
	.byte $20+.lobyte(FT_DPCM_PTR),$3f,$0d	;31 (ripped02)
	.byte $00+.lobyte(FT_DPCM_PTR),$3f,$0f	;32 (ripped00)
	.byte $30+.lobyte(FT_DPCM_PTR),$3e,$0c	;33 (ripped03)
	.byte $30+.lobyte(FT_DPCM_PTR),$3e,$0f	;34 (ripped03)
	.byte $10+.lobyte(FT_DPCM_PTR),$3e,$0a	;35 (ripped01)
	.byte $10+.lobyte(FT_DPCM_PTR),$3e,$0e	;36 (ripped01)
	.byte $40+.lobyte(FT_DPCM_PTR),$3f,$0a	;37 (ripped04)
	.byte $40+.lobyte(FT_DPCM_PTR),$3f,$0e	;38 (ripped04)
	.byte $20+.lobyte(FT_DPCM_PTR),$3f,$0e	;39 (ripped02)
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;40 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;41 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;42 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;43 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;44 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;45 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;46 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;47 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;48 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;49 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;50 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;51 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;52 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;53 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;54 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;55 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;56 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;57 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;58 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;59 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;60 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;61 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;62 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;63 

@env0:
	.byte $c0,$7f,$00,$00
@env1:
	.byte $c5,$c9,$c9,$c8,$00,$03
@env2:
	.byte $ce,$cb,$ca,$c9,$00,$03
@env3:
	.byte $c0,$bf,$bd,$bb,$bd,$c0,$c1,$c3,$c5,$c3,$c1,$00,$00
@env4:
	.byte $c0,$07,$c1,$c3,$c6,$c3,$c1,$bf,$bd,$ba,$bd,$bf,$00,$02
@env5:
	.byte $cf,$7d,$cf,$00,$02
@env6:
	.byte $c4,$c6,$c9,$c8,$00,$03
@env7:
	.byte $c1,$c5,$c4,$c3,$c2,$00,$04
@env8:
	.byte $c8,$00,$00
@env9:
	.byte $c0,$c2,$bd,$bf,$c1,$bd,$bf,$c1,$c3,$bd,$bf,$c1,$bd,$c1,$bd,$c1,$bc,$c0,$c4,$bf,$c3,$be,$c2,$bc,$c0,$c4,$bd,$c1,$bb,$c1,$bb,$c1,$ba,$c0,$c6,$bf,$c5,$bc,$c2,$ba,$00,$27
@env10:
	.byte $c4,$c6,$c9,$c8,$0f,$c7,$0e,$c6,$0e,$c5,$00,$09
@env11:
	.byte $cc,$cc,$c9,$c5,$c2,$c0,$00,$05
@env12:
	.byte $c4,$00,$00
@env13:
	.byte $c3,$00,$00
@env14:
	.byte $cd,$ce,$cc,$c8,$c9,$c7,$c6,$c4,$c3,$c1,$c0,$00,$0a
@env15:
	.byte $bf,$bd,$ba,$bd,$bf,$c1,$c3,$c6,$c3,$c1,$00,$00
@env16:
	.byte $c0,$bf,$be,$bd,$bc,$bb,$ba,$b9,$b8,$b7,$00,$09
@env17:
	.byte $c0,$c3,$00,$01
@env18:
	.byte $c0,$c6,$00,$01
@env19:
	.byte $c1,$c5,$c4,$c2,$00,$03
@env20:
	.byte $c0,$08,$c0,$02,$bf,$bd,$ba,$bd,$bf,$00,$02
@env21:
	.byte $c0,$07,$bf,$bd,$b9,$bd,$bf,$c1,$c3,$c7,$c3,$c1,$c0,$00,$02
@env22:
	.byte $c0,$07,$c2,$c4,$c7,$c4,$c1,$bf,$bd,$bb,$bd,$bf,$00,$02
@env23:
	.byte $c0,$c0,$bf,$02,$be,$03,$bd,$02,$bc,$bc,$bb,$bb,$ba,$02,$b9,$b9,$b8,$b8,$b7,$02,$b6,$b6,$b5,$b5,$b4,$b4,$b3,$02,$b2,$b2,$b1,$b1,$b0,$00,$20
@env24:
	.byte $c5,$c6,$c6,$ca,$cb,$cc,$cb,$ca,$c9,$c8,$c7,$00,$0a

@song0ch0:
	.byte $fb, $01
@ref0:
	.byte $d1
@song0ch0loop:
@ref1:
	.byte $a7,$80,$32,$91,$38,$91,$32,$91,$3c,$3f,$40,$9f,$3c,$91
@ref2:
	.byte $92,$28,$af,$96,$28,$87,$92,$2c,$d7,$96,$2c,$87
	.byte $ff,$0d
	.word @ref1
@ref3:
	.byte $92,$40,$af,$96,$40,$87,$92,$3c,$d7,$96,$3c,$87
	.byte $ff,$0d
	.word @ref1
	.byte $ff,$08
	.word @ref2
	.byte $ff,$0d
	.word @ref1
	.byte $ff,$08
	.word @ref3
@ref4:
	.byte $a7,$82,$2e,$91,$8c,$2e,$91,$82,$2c,$87,$8c,$2c,$87,$82,$2e,$91,$8c,$2e,$91,$82,$2e,$91
@ref5:
	.byte $93,$8c,$2e,$91,$82,$2c,$91,$8c,$2c,$91,$82,$2c,$91,$2e,$87,$8c,$2e,$af
	.byte $ff,$0f
	.word @ref4
	.byte $ff,$0d
	.word @ref5
	.byte $ff,$0f
	.word @ref4
	.byte $ff,$0d
	.word @ref5
@ref6:
	.byte $a7,$82,$2e,$91,$8c,$2e,$91,$82,$2c,$87,$8c,$2c,$87,$82,$2e,$91,$8c,$2e,$91,$82,$28,$91
@ref7:
	.byte $f9,$9b,$9a,$32,$87
@ref8:
	.byte $89,$9e,$32,$87,$9a,$32,$87,$9e,$32,$87,$9a,$38,$87,$9e,$38,$87,$9a,$32,$87,$9e,$32,$87,$9a,$3c,$87,$9e,$3c,$87,$9a,$32,$9b,$9e,$32,$87,$9a,$40,$91
@ref9:
	.byte $89,$9e,$40,$87,$9a,$32,$87,$9e,$32,$87,$9a,$3c,$87,$9e,$3c,$87,$9a,$32,$87,$9e,$32,$87,$9a,$38,$87,$9e,$38,$87,$9a,$32,$9b,$9e,$32,$87,$9a,$28,$91
@ref10:
	.byte $89,$9e,$28,$87,$9a,$28,$87,$9e,$28,$87,$9a,$2e,$87,$9e,$2e,$87,$9a,$28,$87,$9e,$28,$87,$9a,$2e,$87,$9e,$2e,$87,$9a,$34,$37,$38,$8b,$36,$87,$9e,$36,$87,$9a,$32,$91
@ref11:
	.byte $f9,$87,$9e,$32,$87,$9a,$32,$91
@ref12:
	.byte $89,$9e,$32,$87,$9a,$32,$87,$9e,$32,$87,$9a,$38,$87,$9e,$38,$87,$9a,$32,$87,$9e,$32,$87,$9a,$3c,$87,$9e,$3c,$87,$9a,$32,$91,$9e,$32,$91,$9a,$3c,$3f,$40,$8b
@ref13:
	.byte $93,$32,$87,$9e,$32,$87,$9a,$3c,$87,$9e,$3c,$87,$9a,$32,$87,$9e,$32,$87,$9a,$38,$87,$9e,$38,$87,$9a,$32,$91,$9e,$32,$91,$9a,$28,$91
@ref14:
	.byte $89,$9e,$28,$87,$9a,$28,$87,$9e,$28,$87,$9a,$2e,$87,$9e,$2e,$87,$9a,$32,$87,$9e,$32,$87,$9a,$34,$37,$38,$8b,$36,$87,$9e,$36,$87,$9a,$2e,$87,$9e,$2e,$87,$9a,$32,$91
@ref15:
	.byte $f9,$9b,$9e,$32,$87
@ref16:
	.byte $9a,$3d,$3f,$40,$d9,$3c,$87,$9e,$3c,$87,$9a,$38,$87,$9e,$38,$87,$9a,$36,$91
@ref17:
	.byte $c5,$9e,$36,$87,$9a,$38,$91,$9e,$38,$87,$9a,$3c,$91,$9e,$3c,$87,$9a,$3f,$40,$8d
@ref18:
	.byte $f9,$91,$84,$3c,$3f,$40,$8b
@ref19:
	.byte $93,$3c,$3f,$41,$8c,$40,$87,$84,$44,$91,$8c,$44,$91,$84,$46,$91,$44,$46,$85,$8c,$46,$af
	.byte $ff,$0e
	.word @ref16
@ref20:
	.byte $c5,$9e,$36,$87,$9a,$38,$91,$9e,$38,$87,$9a,$3c,$91,$9e,$3c,$87,$9a,$32,$91
@ref21:
	.byte $f9,$91,$94,$32,$87,$96,$32,$87
@ref22:
	.byte $94,$32,$87,$96,$32,$87,$94,$32,$87,$96,$32,$87,$94,$32,$87,$96,$32,$eb
@ref23:
	.byte $82,$32,$c3,$8c,$32,$87,$82,$32,$c3,$8c,$32,$87
@ref24:
	.byte $82,$32,$af,$8c,$32,$87,$82,$32,$cd,$8c,$32,$91
	.byte $ff,$08
	.word @ref23
	.byte $ff,$08
	.word @ref24
	.byte $ff,$08
	.word @ref23
	.byte $ff,$08
	.word @ref24
@ref25:
	.byte $82,$36,$c3,$8c,$36,$87,$82,$36,$c3,$8c,$36,$87
@ref26:
	.byte $82,$36,$af,$8c,$36,$87,$82,$36,$cd,$8c,$36,$91
@ref27:
	.byte $9d,$32,$87,$84,$32,$9b,$8c,$32,$87,$84,$32,$91,$8c,$32,$87,$84,$32,$91,$8c,$32,$87,$84,$32,$91
@ref28:
	.byte $9d,$8c,$32,$87,$84,$32,$9b,$8c,$32,$87,$84,$32,$91,$8c,$32,$87,$84,$32,$91,$8c,$32,$87,$84,$32,$91
	.byte $ff,$11
	.word @ref28
@ref29:
	.byte $b1,$8c,$32,$87,$84,$2e,$c3,$8c,$2e,$87,$84,$32,$91
	.byte $ff,$11
	.word @ref28
	.byte $ff,$11
	.word @ref28
@ref30:
	.byte $9d,$8c,$32,$87,$84,$32,$9b,$8c,$32,$87,$84,$36,$91,$8c,$36,$87,$84,$40,$91,$8c,$40,$87,$84,$40,$91
@ref31:
	.byte $f9,$9b,$8c,$40,$87
@ref32:
	.byte $a7,$8a,$32,$91,$36,$91,$38,$91,$3c,$91,$32,$91,$36,$91
@ref33:
	.byte $38,$91,$3c,$91,$32,$91,$36,$91,$38,$91,$3c,$91,$32,$91,$36,$91
	.byte $ff,$10
	.word @ref33
	.byte $ff,$10
	.word @ref33
	.byte $ff,$10
	.word @ref33
@ref34:
	.byte $38,$91,$3c,$91,$36,$91,$38,$91,$3c,$91,$40,$a5,$40,$91
@ref35:
	.byte $46,$91,$4a,$91,$4a,$91,$4e,$91,$50,$91,$54,$91,$4a,$91,$4e,$91
@ref36:
	.byte $50,$91,$54,$91,$54,$91,$58,$91,$5a,$91,$5e,$91,$54,$91,$58,$91
@ref37:
	.byte $5a,$91,$5e,$91,$62,$f5
@ref38:
	.byte $f7,$90,$62,$a5
	.byte $fd
	.word @song0ch0loop

@song0ch1:
@ref39:
	.byte $d1
@song0ch1loop:
@ref40:
	.byte $92,$32,$87,$96,$32,$87,$92,$38,$87,$96,$38,$87,$92,$32,$87,$96,$32,$87,$92,$3c,$3f,$40,$9f,$3c,$87,$96,$3c,$87,$92,$38,$9b,$96,$38,$87
@ref41:
	.byte $92,$2e,$af,$96,$2e,$87,$92,$32,$d7,$96,$32,$87
@ref42:
	.byte $93,$92,$38,$87,$96,$38,$87,$92,$32,$87,$96,$32,$87,$92,$3c,$3f,$40,$9f,$3c,$87,$96,$3c,$87,$92,$38,$9b,$96,$38,$87
@ref43:
	.byte $92,$46,$af,$96,$46,$87,$98,$44,$d7,$96,$44,$87
	.byte $ff,$18
	.word @ref40
	.byte $ff,$08
	.word @ref41
	.byte $ff,$15
	.word @ref42
	.byte $ff,$08
	.word @ref43
@ref44:
	.byte $a7,$82,$38,$91,$8c,$38,$91,$82,$36,$87,$8c,$36,$87,$82,$38,$91,$8c,$38,$91,$82,$38,$91
@ref45:
	.byte $93,$8c,$38,$91,$82,$36,$91,$8c,$36,$91,$82,$36,$91,$38,$87,$8c,$38,$af
	.byte $ff,$0f
	.word @ref44
	.byte $ff,$0d
	.word @ref45
	.byte $ff,$0f
	.word @ref44
	.byte $ff,$0d
	.word @ref45
@ref46:
	.byte $a7,$82,$38,$91,$8c,$38,$91,$82,$36,$87,$8c,$36,$87,$82,$38,$91,$8c,$38,$91,$82,$36,$91
@ref47:
	.byte $f9,$9b,$8c,$36,$87
@ref48:
	.byte $93,$9c,$32,$a5,$32,$91,$38,$91,$32,$91,$3c,$91,$32,$91
@ref49:
	.byte $93,$40,$a5,$32,$91,$3c,$91,$32,$91,$38,$91,$32,$91
@ref50:
	.byte $93,$28,$a5,$28,$91,$2e,$91,$28,$91,$2e,$91,$34,$37,$38,$8b
@ref51:
	.byte $36,$91,$32,$f9,$8f
@ref52:
	.byte $93,$32,$a5,$32,$91,$38,$91,$32,$91,$3c,$91,$32,$91
@ref53:
	.byte $93,$3c,$3f,$40,$9f,$32,$91,$3c,$91,$32,$91,$38,$91,$32,$91
@ref54:
	.byte $93,$28,$a5,$28,$91,$2e,$91,$32,$91,$34,$37,$38,$8b,$36,$91
@ref55:
	.byte $2e,$91,$32,$f9,$8f
@ref56:
	.byte $a7,$3d,$3f,$40,$d9,$3c,$91
@ref57:
	.byte $38,$91,$36,$e1,$38,$9b,$3c,$87
@ref58:
	.byte $93,$3c,$3f,$40,$ef,$84,$36,$91
@ref59:
	.byte $9d,$8c,$36,$87,$84,$3c,$91,$8c,$3c,$91,$84,$40,$9b,$8c,$40,$af
@ref60:
	.byte $a7,$9c,$3d,$3f,$40,$d9,$3c,$91
	.byte $ff,$08
	.word @ref57
@ref61:
	.byte $93,$32,$f9,$8f
@ref62:
	.byte $93,$84,$28,$87,$8c,$28,$87,$84,$28,$87,$8c,$28,$87,$84,$28,$87,$8c,$28,$87,$84,$28,$87,$8c,$28,$c3
@ref63:
	.byte $92,$40,$c3,$96,$40,$87,$92,$3c,$c3,$96,$3c,$87
@ref64:
	.byte $92,$38,$af,$96,$38,$87,$92,$3c,$cd,$96,$3c,$91
	.byte $ff,$08
	.word @ref63
	.byte $ff,$08
	.word @ref64
	.byte $ff,$08
	.word @ref63
	.byte $ff,$08
	.word @ref64
@ref65:
	.byte $92,$42,$c3,$96,$42,$87,$92,$40,$c3,$96,$40,$87
@ref66:
	.byte $92,$3c,$af,$96,$3c,$87,$92,$40,$cd,$96,$40,$91
@ref67:
	.byte $94,$40,$9b,$96,$40,$87,$94,$3c,$9b,$96,$3c,$87,$94,$38,$91,$96,$38,$87,$94,$3c,$91,$96,$3c,$87,$94,$40,$91
@ref68:
	.byte $9d,$96,$40,$87,$94,$3c,$9b,$96,$3c,$87,$94,$38,$91,$96,$38,$87,$94,$3c,$91,$96,$3c,$87,$94,$40,$91
@ref69:
	.byte $9d,$96,$40,$87,$94,$3c,$9b,$96,$3c,$87,$94,$38,$91,$96,$38,$87,$94,$3c,$91,$96,$3c,$87,$94,$38,$91
@ref70:
	.byte $b1,$96,$38,$87,$94,$36,$c3,$96,$36,$87,$94,$40,$91
@ref71:
	.byte $40,$9b,$96,$40,$87,$94,$3c,$9b,$96,$3c,$87,$94,$38,$91,$96,$38,$87,$94,$3c,$91,$96,$3c,$87,$94,$40,$91
	.byte $ff,$11
	.word @ref68
@ref72:
	.byte $9d,$96,$40,$87,$94,$3c,$9b,$96,$3c,$87,$94,$40,$91,$96,$40,$87,$94,$46,$91,$96,$46,$87,$94,$4a,$91
@ref73:
	.byte $f9,$9b,$96,$4a,$87
@ref74:
	.byte $86,$32,$91,$36,$91,$38,$91,$3c,$91,$32,$91,$36,$91,$38,$91,$3c,$91
@ref75:
	.byte $32,$91,$36,$91,$38,$91,$3c,$91,$32,$91,$36,$91,$38,$91,$3c,$91
	.byte $ff,$10
	.word @ref75
	.byte $ff,$10
	.word @ref75
	.byte $ff,$10
	.word @ref75
@ref76:
	.byte $36,$91,$38,$91,$3c,$91,$40,$b9,$46,$91,$4a,$91
@ref77:
	.byte $4a,$91,$4e,$91,$50,$91,$54,$91,$4a,$91,$4e,$91,$50,$91,$54,$91
@ref78:
	.byte $54,$91,$58,$91,$5a,$91,$5e,$91,$54,$91,$58,$91,$5a,$91,$5e,$91
@ref79:
	.byte $62,$cd,$88,$62,$cd
@ref80:
	.byte $cf,$8e,$62,$cd
	.byte $fd
	.word @song0ch1loop

@song0ch2:
@ref81:
	.byte $a6,$4d,$4c,$83,$4d,$4c,$83,$4c,$85,$00,$4c,$85,$00,$3c,$85,$00,$3c,$85,$00,$34,$8f,$00,$81
@song0ch2loop:
@ref82:
	.byte $a6,$38,$83,$00,$8b,$38,$83,$00,$8b,$44,$8f,$00,$38,$83,$00,$8b,$38,$83,$00,$8b,$38,$83,$00,$8b,$44,$8f,$00,$38,$83,$00,$8b
@ref83:
	.byte $38,$83,$00,$8b,$38,$83,$00,$8b,$44,$8f,$00,$38,$83,$00,$8b,$38,$83,$00,$8b,$38,$83,$00,$8b,$44,$8f,$00,$38,$83,$00,$8b
	.byte $ff,$1e
	.word @ref83
@ref84:
	.byte $4a,$8f,$00,$4a,$8f,$00,$3c,$8f,$00,$34,$8f,$00,$4c,$85,$00,$4c,$85,$00,$89,$4c,$85,$00,$3c,$85,$00,$3c,$85,$00,$38,$8f,$00
	.byte $ff,$1e
	.word @ref83
	.byte $ff,$1e
	.word @ref83
	.byte $ff,$1e
	.word @ref83
@ref85:
	.byte $4c,$85,$00,$4c,$85,$00,$3c,$85,$00,$34,$85,$00,$4c,$85,$00,$3c,$85,$00,$3c,$85,$00,$34,$85,$00,$4c,$85,$00,$4c,$85,$00,$4a,$85,$00,$4a,$85,$00,$3c,$85,$00,$3c,$85,$00,$34,$85,$00,$34,$85,$00
	.byte $ff,$1e
	.word @ref83
	.byte $ff,$1e
	.word @ref83
	.byte $ff,$1e
	.word @ref83
	.byte $ff,$1f
	.word @ref84
	.byte $ff,$1e
	.word @ref83
	.byte $ff,$1e
	.word @ref83
	.byte $ff,$1e
	.word @ref83
	.byte $ff,$30
	.word @ref85
	.byte $ff,$1e
	.word @ref83
	.byte $ff,$1e
	.word @ref83
	.byte $ff,$1e
	.word @ref83
	.byte $ff,$1f
	.word @ref84
	.byte $ff,$1e
	.word @ref83
	.byte $ff,$1e
	.word @ref83
	.byte $ff,$1e
	.word @ref83
	.byte $ff,$30
	.word @ref85
	.byte $ff,$1e
	.word @ref83
	.byte $ff,$1e
	.word @ref83
	.byte $ff,$1e
	.word @ref83
	.byte $ff,$1f
	.word @ref84
	.byte $ff,$1e
	.word @ref83
	.byte $ff,$1e
	.word @ref83
	.byte $ff,$1e
	.word @ref83
@ref86:
	.byte $38,$83,$00,$8b,$44,$8f,$00,$44,$8f,$00,$44,$8f,$00,$44,$8f,$00,$95,$a8,$44,$83,$00,$9d
@ref87:
	.byte $a6,$38,$83,$00,$c7,$38,$83,$00,$c7
@ref88:
	.byte $38,$83,$00,$b3,$38,$83,$00,$9f,$a8,$44,$83,$00,$8b,$a6,$38,$83,$00,$9f
@ref89:
	.byte $38,$83,$00,$c7,$38,$83,$00,$c7
	.byte $ff,$10
	.word @ref88
	.byte $ff,$08
	.word @ref89
	.byte $ff,$10
	.word @ref88
	.byte $ff,$08
	.word @ref89
@ref90:
	.byte $38,$83,$00,$b3,$38,$83,$00,$9f,$44,$8f,$00,$44,$8f,$00,$44,$8f,$00
	.byte $ff,$1e
	.word @ref83
	.byte $ff,$1e
	.word @ref83
	.byte $ff,$1e
	.word @ref83
	.byte $ff,$1f
	.word @ref84
	.byte $ff,$1e
	.word @ref83
	.byte $ff,$1e
	.word @ref83
	.byte $ff,$1e
	.word @ref83
	.byte $ff,$30
	.word @ref85
	.byte $ff,$1e
	.word @ref83
	.byte $ff,$1e
	.word @ref83
	.byte $ff,$1e
	.word @ref83
	.byte $ff,$1f
	.word @ref84
	.byte $ff,$1e
	.word @ref83
	.byte $ff,$1e
	.word @ref83
	.byte $ff,$1e
	.word @ref83
	.byte $ff,$30
	.word @ref85
	.byte $ff,$1e
	.word @ref83
@ref91:
	.byte $4c,$85,$00,$4c,$85,$00,$3e,$85,$00,$34,$85,$00,$4c,$85,$00,$3c,$85,$00,$3c,$85,$00,$34,$85,$00,$4d,$4c,$83,$4c,$83,$4d,$4c,$85,$00,$4c,$85,$00,$3c,$85,$00,$3c,$85,$00,$34,$85,$00,$34,$85,$00
	.byte $fd
	.word @song0ch2loop

@song0ch3:
@ref92:
	.byte $a2,$4c,$83,$4c,$85,$4c,$83,$4c,$87,$4c,$87,$4c,$87,$4c,$87,$4c,$87,$4c,$89
@song0ch3loop:
@ref93:
	.byte $a0,$38,$91,$38,$91,$a2,$4c,$91,$a0,$38,$91,$38,$91,$38,$91,$a2,$4c,$91,$a0,$38,$91
@ref94:
	.byte $38,$91,$38,$91,$a2,$4c,$91,$a0,$38,$91,$38,$91,$38,$91,$a2,$4c,$91,$a0,$38,$91
	.byte $ff,$10
	.word @ref94
@ref95:
	.byte $a4,$4c,$91,$4c,$91,$4c,$91,$4c,$91,$4c,$87,$4c,$91,$4c,$87,$4c,$87,$4c,$87,$4c,$91
	.byte $ff,$10
	.word @ref93
	.byte $ff,$10
	.word @ref94
	.byte $ff,$10
	.word @ref94
@ref96:
	.byte $a4,$4c,$87,$4c,$87,$4c,$87,$4c,$87,$4c,$87,$4c,$87,$4c,$87,$4c,$87,$4c,$87,$4c,$87,$4c,$87,$4c,$87,$4c,$87,$4c,$87,$4c,$87,$4c,$87
	.byte $ff,$10
	.word @ref93
	.byte $ff,$10
	.word @ref94
	.byte $ff,$10
	.word @ref94
	.byte $ff,$14
	.word @ref95
	.byte $ff,$10
	.word @ref93
	.byte $ff,$10
	.word @ref94
	.byte $ff,$10
	.word @ref94
	.byte $ff,$20
	.word @ref96
	.byte $ff,$10
	.word @ref93
	.byte $ff,$10
	.word @ref94
	.byte $ff,$10
	.word @ref94
	.byte $ff,$14
	.word @ref95
	.byte $ff,$10
	.word @ref93
	.byte $ff,$10
	.word @ref94
	.byte $ff,$10
	.word @ref94
	.byte $ff,$20
	.word @ref96
	.byte $ff,$10
	.word @ref93
	.byte $ff,$10
	.word @ref94
	.byte $ff,$10
	.word @ref94
	.byte $ff,$14
	.word @ref95
	.byte $ff,$10
	.word @ref93
	.byte $ff,$10
	.word @ref94
	.byte $ff,$10
	.word @ref94
@ref97:
	.byte $38,$91,$a2,$4c,$91,$4c,$91,$4c,$91,$4c,$a7,$4c,$a3
@ref98:
	.byte $a0,$38,$cd,$38,$cd
@ref99:
	.byte $38,$b9,$38,$a5,$a2,$4c,$91,$a0,$38,$a5
@ref100:
	.byte $38,$cd,$38,$cd
	.byte $ff,$08
	.word @ref99
@ref101:
	.byte $38,$cd,$38,$cd
	.byte $ff,$08
	.word @ref99
@ref102:
	.byte $38,$cd,$38,$cd
@ref103:
	.byte $38,$b9,$38,$a5,$a2,$4c,$91,$4c,$91,$4c,$91
	.byte $ff,$10
	.word @ref93
	.byte $ff,$10
	.word @ref94
	.byte $ff,$10
	.word @ref94
	.byte $ff,$14
	.word @ref95
	.byte $ff,$10
	.word @ref93
	.byte $ff,$10
	.word @ref94
	.byte $ff,$10
	.word @ref94
	.byte $ff,$20
	.word @ref96
	.byte $ff,$10
	.word @ref93
	.byte $ff,$10
	.word @ref94
	.byte $ff,$10
	.word @ref94
	.byte $ff,$14
	.word @ref95
	.byte $ff,$10
	.word @ref93
	.byte $ff,$10
	.word @ref94
	.byte $ff,$10
	.word @ref94
	.byte $ff,$20
	.word @ref96
	.byte $ff,$10
	.word @ref93
	.byte $ff,$20
	.word @ref96
	.byte $fd
	.word @song0ch3loop

@song0ch4:
@ref104:
	.byte $d1
@song0ch4loop:
@ref105:
	.byte $32,$91,$32,$91,$32,$91,$32,$91,$32,$91,$32,$91,$32,$91,$32,$91
@ref106:
	.byte $34,$91,$34,$91,$36,$91,$38,$91,$38,$91,$3a,$91,$38,$91,$3a,$91
	.byte $ff,$10
	.word @ref105
@ref107:
	.byte $3c,$91,$3c,$91,$3e,$91,$38,$91,$38,$91,$3a,$91,$38,$91,$3a,$91
	.byte $ff,$10
	.word @ref105
	.byte $ff,$10
	.word @ref106
	.byte $ff,$10
	.word @ref105
	.byte $ff,$10
	.word @ref107
	.byte $ff,$10
	.word @ref105
	.byte $ff,$10
	.word @ref105
	.byte $ff,$10
	.word @ref105
	.byte $ff,$10
	.word @ref105
	.byte $ff,$10
	.word @ref105
	.byte $ff,$10
	.word @ref105
@ref108:
	.byte $32,$91,$32,$91,$32,$91,$32,$91,$32,$91,$32,$91,$32,$91,$34,$91
@ref109:
	.byte $34,$91,$34,$91,$34,$91,$34,$91,$34,$91,$34,$91,$34,$91,$34,$91
@ref110:
	.byte $32,$91,$32,$91,$32,$91,$40,$91,$32,$91,$40,$91,$32,$91,$32,$91
@ref111:
	.byte $42,$91,$44,$91,$42,$91,$42,$91,$42,$91,$44,$91,$42,$91,$42,$91
@ref112:
	.byte $34,$91,$34,$91,$34,$91,$36,$91,$42,$91,$44,$91,$42,$91,$42,$91
@ref113:
	.byte $32,$91,$40,$91,$32,$91,$32,$91,$32,$91,$40,$91,$32,$91,$32,$91
	.byte $ff,$10
	.word @ref110
	.byte $ff,$10
	.word @ref111
	.byte $ff,$10
	.word @ref112
	.byte $ff,$10
	.word @ref113
@ref114:
	.byte $38,$91,$38,$91,$3a,$91,$38,$91,$38,$91,$38,$91,$3a,$91,$38,$91
@ref115:
	.byte $34,$91,$34,$91,$36,$91,$34,$91,$34,$91,$34,$91,$36,$91,$34,$91
@ref116:
	.byte $32,$91,$32,$91,$40,$91,$32,$91,$40,$91,$32,$91,$32,$91,$40,$91
@ref117:
	.byte $32,$91,$32,$91,$40,$91,$32,$91,$32,$91,$40,$91,$32,$91,$40,$91
	.byte $ff,$10
	.word @ref114
	.byte $ff,$10
	.word @ref115
	.byte $ff,$10
	.word @ref116
@ref118:
	.byte $32,$91,$32,$91,$32,$91,$32,$91,$32,$cd
@ref119:
	.byte $32,$cd,$32,$cd
@ref120:
	.byte $32,$b9,$32,$a5,$32,$91,$40,$91,$32,$91
@ref121:
	.byte $42,$cd,$42,$cd
@ref122:
	.byte $42,$b9,$42,$a5,$42,$91,$44,$91,$42,$91
@ref123:
	.byte $46,$cd,$46,$cd
@ref124:
	.byte $46,$b9,$46,$a5,$46,$91,$44,$91,$46,$91
@ref125:
	.byte $42,$cd,$42,$cd
@ref126:
	.byte $42,$b9,$42,$a5,$44,$91,$42,$91,$44,$91
	.byte $ff,$10
	.word @ref117
@ref127:
	.byte $42,$91,$42,$91,$44,$91,$42,$91,$42,$91,$44,$91,$42,$91,$44,$91
@ref128:
	.byte $46,$91,$46,$91,$48,$91,$46,$91,$46,$91,$48,$91,$46,$91,$48,$91
	.byte $ff,$10
	.word @ref127
	.byte $ff,$10
	.word @ref117
	.byte $ff,$10
	.word @ref127
	.byte $ff,$10
	.word @ref128
	.byte $ff,$10
	.word @ref117
@ref129:
	.byte $32,$91,$32,$91,$32,$91,$40,$91,$32,$91,$32,$91,$44,$91,$40,$91
@ref130:
	.byte $42,$91,$42,$91,$42,$91,$44,$91,$42,$91,$42,$91,$48,$91,$44,$91
@ref131:
	.byte $4a,$91,$4a,$91,$4a,$91,$4c,$91,$4a,$91,$4a,$91,$34,$91,$4c,$91
@ref132:
	.byte $46,$91,$46,$91,$46,$91,$48,$91,$46,$91,$46,$91,$4e,$91,$48,$91
	.byte $ff,$10
	.word @ref129
	.byte $ff,$10
	.word @ref130
	.byte $ff,$10
	.word @ref131
	.byte $ff,$10
	.word @ref132
	.byte $ff,$10
	.word @ref129
	.byte $ff,$10
	.word @ref117
	.byte $fd
	.word @song0ch4loop
