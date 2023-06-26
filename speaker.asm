;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module speaker
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _tlengh
	.globl _tone
	.globl _sheetl
	.globl _sheet
	.globl _main
	.globl _timerlengh
	.globl _timertone
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _F1
	.globl _P
	.globl _PS
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _RD
	.globl _WR
	.globl _T1
	.globl _T0
	.globl _INT1
	.globl _INT0
	.globl _TXD
	.globl _RXD
	.globl _P3_7
	.globl _P3_6
	.globl _P3_5
	.globl _P3_4
	.globl _P3_3
	.globl _P3_2
	.globl _P3_1
	.globl _P3_0
	.globl _EA
	.globl _ES
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _P2_7
	.globl _P2_6
	.globl _P2_5
	.globl _P2_4
	.globl _P2_3
	.globl _P2_2
	.globl _P2_1
	.globl _P2_0
	.globl _SM0
	.globl _SM1
	.globl _SM2
	.globl _REN
	.globl _TB8
	.globl _RB8
	.globl _TI
	.globl _RI
	.globl _P1_7
	.globl _P1_6
	.globl _P1_5
	.globl _P1_4
	.globl _P1_3
	.globl _P1_2
	.globl _P1_1
	.globl _P1_0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _P0_7
	.globl _P0_6
	.globl _P0_5
	.globl _P0_4
	.globl _P0_3
	.globl _P0_2
	.globl _P0_1
	.globl _P0_0
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _IP
	.globl _P3
	.globl _IE
	.globl _P2
	.globl _SBUF
	.globl _SCON
	.globl _P1
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
	.globl _musiclengh
	.globl _interrupt_count
	.globl _playcount
	.globl _nowl
	.globl _nowtone
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_P1	=	0x0090
_SCON	=	0x0098
_SBUF	=	0x0099
_P2	=	0x00a0
_IE	=	0x00a8
_P3	=	0x00b0
_IP	=	0x00b8
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0_0	=	0x0080
_P0_1	=	0x0081
_P0_2	=	0x0082
_P0_3	=	0x0083
_P0_4	=	0x0084
_P0_5	=	0x0085
_P0_6	=	0x0086
_P0_7	=	0x0087
_IT0	=	0x0088
_IE0	=	0x0089
_IT1	=	0x008a
_IE1	=	0x008b
_TR0	=	0x008c
_TF0	=	0x008d
_TR1	=	0x008e
_TF1	=	0x008f
_P1_0	=	0x0090
_P1_1	=	0x0091
_P1_2	=	0x0092
_P1_3	=	0x0093
_P1_4	=	0x0094
_P1_5	=	0x0095
_P1_6	=	0x0096
_P1_7	=	0x0097
_RI	=	0x0098
_TI	=	0x0099
_RB8	=	0x009a
_TB8	=	0x009b
_REN	=	0x009c
_SM2	=	0x009d
_SM1	=	0x009e
_SM0	=	0x009f
_P2_0	=	0x00a0
_P2_1	=	0x00a1
_P2_2	=	0x00a2
_P2_3	=	0x00a3
_P2_4	=	0x00a4
_P2_5	=	0x00a5
_P2_6	=	0x00a6
_P2_7	=	0x00a7
_EX0	=	0x00a8
_ET0	=	0x00a9
_EX1	=	0x00aa
_ET1	=	0x00ab
_ES	=	0x00ac
_EA	=	0x00af
_P3_0	=	0x00b0
_P3_1	=	0x00b1
_P3_2	=	0x00b2
_P3_3	=	0x00b3
_P3_4	=	0x00b4
_P3_5	=	0x00b5
_P3_6	=	0x00b6
_P3_7	=	0x00b7
_RXD	=	0x00b0
_TXD	=	0x00b1
_INT0	=	0x00b2
_INT1	=	0x00b3
_T0	=	0x00b4
_T1	=	0x00b5
_WR	=	0x00b6
_RD	=	0x00b7
_PX0	=	0x00b8
_PT0	=	0x00b9
_PX1	=	0x00ba
_PT1	=	0x00bb
_PS	=	0x00bc
_P	=	0x00d0
_F1	=	0x00d1
_OV	=	0x00d2
_RS0	=	0x00d3
_RS1	=	0x00d4
_F0	=	0x00d5
_AC	=	0x00d6
_CY	=	0x00d7
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
	.area REG_BANK_1	(REL,OVR,DATA)
	.ds 8
	.area REG_BANK_2	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; overlayable bit register bank
;--------------------------------------------------------
	.area BIT_BANK	(REL,OVR,DATA)
bits:
	.ds 1
	b0 = bits[0]
	b1 = bits[1]
	b2 = bits[2]
	b3 = bits[3]
	b4 = bits[4]
	b5 = bits[5]
	b6 = bits[6]
	b7 = bits[7]
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_nowtone::
	.ds 2
_nowl::
	.ds 2
_playcount::
	.ds 1
_interrupt_count::
	.ds 1
_musiclengh::
	.ds 2
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
;--------------------------------------------------------
; Stack segment in internal ram
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; interrupt vector
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
	reti
	.ds	7
	ljmp	_timertone
	.ds	5
	reti
	.ds	7
	ljmp	_timerlengh
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
;	speaker.c:4: unsigned short nowtone = 0; //發出的音調
	clr	a
	mov	_nowtone,a
	mov	(_nowtone + 1),a
;	speaker.c:5: unsigned short nowl = 65525; //發出的音長
	mov	_nowl,#0xf5
	mov	(_nowl + 1),#0xff
;	speaker.c:11: unsigned short musiclengh = 340;
	mov	_musiclengh,#0x54
	mov	(_musiclengh + 1),#0x01
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	ljmp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'timertone'
;------------------------------------------------------------
;	speaker.c:24: void timertone(void) __interrupt (1) __using (1) //設定音階
;	-----------------------------------------
;	 function timertone
;	-----------------------------------------
_timertone:
	ar7 = 0x0f
	ar6 = 0x0e
	ar5 = 0x0d
	ar4 = 0x0c
	ar3 = 0x0b
	ar2 = 0x0a
	ar1 = 0x09
	ar0 = 0x08
	push	acc
;	speaker.c:26: TH0 = (char)(nowtone>>8);
	mov	_TH0,(_nowtone + 1)
;	speaker.c:27: TL0 = (char)(nowtone);
	mov	_TL0,_nowtone
;	speaker.c:28: P1 = ~P1;
	mov	a,_P1
	cpl	a
	mov	_P1,a
;	speaker.c:29: }
	pop	acc
	reti
;	eliminated unneeded mov psw,# (no regs used in bank)
;	eliminated unneeded push/pop not_psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'timerlengh'
;------------------------------------------------------------
;	speaker.c:31: void timerlengh(void) __interrupt (3) __using (2) //控制節拍的頻率
;	-----------------------------------------
;	 function timerlengh
;	-----------------------------------------
_timerlengh:
	ar7 = 0x17
	ar6 = 0x16
	ar5 = 0x15
	ar4 = 0x14
	ar3 = 0x13
	ar2 = 0x12
	ar1 = 0x11
	ar0 = 0x10
	push	bits
	push	acc
	push	b
	push	dpl
	push	dph
	push	(0+7)
	push	(0+6)
	push	(0+5)
	push	(0+4)
	push	(0+3)
	push	(0+2)
	push	(0+1)
	push	(0+0)
	push	psw
	mov	psw,#0x10
;	speaker.c:33: TH1 = (char)((65536-nowl)>>8);
	mov	r4,_nowl
	mov	r5,(_nowl + 1)
	clr	a
	mov	r6,a
	mov	r7,a
	clr	c
	subb	a,r4
	clr	a
	subb	a,r5
	mov	r5,a
	mov	a,#0x01
	subb	a,r6
	clr	a
	subb	a,r7
	mov	_TH1,r5
;	speaker.c:34: TL1 = (char)(65536-nowl);
	mov	r7,_nowl
	clr	c
	clr	a
	subb	a,r7
	mov	r7,a
	mov	_TL1,r7
;	speaker.c:35: interrupt_count++;
	inc	_interrupt_count
;	speaker.c:36: if(interrupt_count == 99) //音符之間的中斷點
	mov	a,#0x63
	cjne	a,_interrupt_count,00102$
;	speaker.c:37: nowtone = 0;
	clr	a
	mov	_nowtone,a
	mov	(_nowtone + 1),a
00102$:
;	speaker.c:39: if(interrupt_count > 99){
	mov	a,_interrupt_count
	add	a,#0xff - 0x63
	jnc	00105$
;	speaker.c:40: playcount++;
	inc	_playcount
;	speaker.c:41: playcount %= musiclengh;
	mov	r6,_playcount
	mov	r7,#0x00
	mov	__moduint_PARM_2,_musiclengh
	mov	(__moduint_PARM_2 + 1),(_musiclengh + 1)
	mov	dpl,r6
	mov	dph,r7
	mov	psw,#0x00
	lcall	__moduint
	mov	psw,#0x10
;	speaker.c:42: nowtone = tone[sheet[playcount]];
	mov	a,dpl
	mov	r6,a
	mov	_playcount,a
	mov	dptr,#_sheet
	movc	a,@a+dptr
	mov	b,#0x02
	mul	ab
	add	a,#_tone
	mov	dpl,a
	mov	a,#(_tone >> 8)
	addc	a,b
	mov	dph,a
	clr	a
	movc	a,@a+dptr
	mov	_nowtone,a
	inc	dptr
	clr	a
	movc	a,@a+dptr
	mov	(_nowtone + 1),a
;	speaker.c:43: nowl = tlengh[sheetl[playcount]];
	mov	a,_playcount
	mov	dptr,#_sheetl
	movc	a,@a+dptr
	mov	r7,a
	mov	b,#0x02
	mul	ab
	add	a,#_tlengh
	mov	dpl,a
	mov	a,#(_tlengh >> 8)
	addc	a,b
	mov	dph,a
	clr	a
	movc	a,@a+dptr
	mov	_nowl,a
	inc	dptr
	clr	a
	movc	a,@a+dptr
	mov	(_nowl + 1),a
;	speaker.c:44: interrupt_count = 0;
	mov	_interrupt_count,#0x00
00105$:
;	speaker.c:46: }
	pop	psw
	pop	(0+0)
	pop	(0+1)
	pop	(0+2)
	pop	(0+3)
	pop	(0+4)
	pop	(0+5)
	pop	(0+6)
	pop	(0+7)
	pop	dph
	pop	dpl
	pop	b
	pop	acc
	pop	bits
	reti
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	speaker.c:48: void main(){
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	speaker.c:50: TMOD = 0x11;
	mov	_TMOD,#0x11
;	speaker.c:51: TH0 = (char)(nowtone>>8);
	mov	_TH0,(_nowtone + 1)
;	speaker.c:52: TL0 = (char)(nowtone);
	mov	_TL0,_nowtone
;	speaker.c:53: TH1 = (char)((65536-FQ)>>8);
	mov	_TH1,#0x0b
;	speaker.c:54: TL1 = (char)(65536-FQ);
	mov	_TL1,#0xdc
;	speaker.c:56: EA = 1;
;	assignBit
	setb	_EA
;	speaker.c:57: ET0 = 1;
;	assignBit
	setb	_ET0
;	speaker.c:58: ET1 = 1;
;	assignBit
	setb	_ET1
;	speaker.c:59: TR0 = 1;
;	assignBit
	setb	_TR0
;	speaker.c:60: TR1 = 1;
;	assignBit
	setb	_TR1
;	speaker.c:61: P0 = 0x00;
	mov	_P0,#0x00
;	speaker.c:62: while (1);
00102$:
;	speaker.c:64: }
	sjmp	00102$
	.area CSEG    (CODE)
	.area CONST   (CODE)
_sheet:
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x09	; 9
	.db #0x0c	; 12
	.db #0x0a	; 10
	.db #0x09	; 9
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x09	; 9
	.db #0x0c	; 12
	.db #0x0a	; 10
	.db #0x09	; 9
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x10	; 16
	.db #0x0c	; 12
	.db #0x07	; 7
	.db #0x10	; 16
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x09	; 9
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x10	; 16
	.db #0x07	; 7
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x0c	; 12
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x07	; 7
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x10	; 16
	.db #0x07	; 7
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x0c	; 12
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x0c	; 12
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x0c	; 12
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x10	; 16
_sheetl:
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
_tone:
	.byte #0x90, #0xfb	; 64400
	.byte #0xd0, #0xfb	; 64464
	.byte #0x0a, #0xfc	; 64522
	.byte #0x44, #0xfc	; 64580
	.byte #0x7a, #0xfc	; 64634
	.byte #0xad, #0xfc	; 64685
	.byte #0xdd, #0xfc	; 64733
	.byte #0x0a, #0xfd	; 64778
	.byte #0x34, #0xfd	; 64820
	.byte #0x5c, #0xfd	; 64860
	.byte #0x82, #0xfd	; 64898
	.byte #0xa6, #0xfd	; 64934
	.byte #0xc8, #0xfd	; 64968
	.byte #0xe8, #0xfd	; 65000
	.byte #0x06, #0xfe	; 65030
	.byte #0x22, #0xfe	; 65058
	.byte #0x00, #0x00	; 0
_tlengh:
	.byte #0x80, #0x25	; 9600
	.byte #0xc0, #0x12	; 4800
	.byte #0x20, #0x1c	; 7200
	.byte #0x60, #0x09	; 2400
	.byte #0x10, #0x0e	; 3600
	.byte #0x08, #0x07	; 1800
	.byte #0xb0, #0x04	; 1200
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
