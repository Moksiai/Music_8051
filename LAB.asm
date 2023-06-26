;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module LAB
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _timer__index_65537_15
	.globl _read_Keyboard_Inputchar_65536_1
	.globl _decode
	.globl _tone
	.globl _main
	.globl _timer_
	.globl _timer_PLAY_tone
	.globl _Keypad4x4
	.globl _read_Keyboard
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
	.globl _record_ntone
	.globl _record_lengh
	.globl _record_tone
	.globl _play_fast
	.globl _play_mode
	.globl _mode
	.globl _change
	.globl _silence
	.globl _play_tone
	.globl _replay_lengh
	.globl _replay_point
	.globl _show
	.globl _degree
	.globl _key
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
_key::
	.ds 1
_degree::
	.ds 2
_show::
	.ds 4
_replay_point::
	.ds 2
_replay_lengh::
	.ds 2
_play_tone::
	.ds 2
_timer__count_65537_15:
	.ds 1
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
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
_silence::
	.ds 1
_change::
	.ds 1
_mode::
	.ds 1
_play_mode::
	.ds 1
_play_fast::
	.ds 1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
_record_tone::
	.ds 510
_record_lengh::
	.ds 510
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
_record_ntone::
	.ds 2
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
	ljmp	_timer_
	.ds	5
	reti
	.ds	7
	ljmp	_timer_PLAY_tone
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
;------------------------------------------------------------
;Allocation info for local variables in function 'timer_'
;------------------------------------------------------------
;count                     Allocated with name '_timer__count_65537_15'
;------------------------------------------------------------
;	LAB.c:107: static unsigned char count = 0;
	mov	_timer__count_65537_15,#0x00
;	LAB.c:46: unsigned char key = KP_NULL;
	mov	_key,#0xc8
;	LAB.c:47: unsigned degree = 48;               
	mov	_degree,#0x30
	mov	(_degree + 1),#0x00
;	LAB.c:40: __bit silence = 1;
;	assignBit
	setb	_silence
;	LAB.c:42: __bit mode = MODE_RECORD;
;	assignBit
	clr	_mode
;	LAB.c:43: __bit play_mode = PLAYMOD_common;
;	assignBit
	clr	_play_mode
;	LAB.c:44: __bit play_fast = 0;
;	assignBit
	clr	_play_fast
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
;Allocation info for local variables in function 'read_Keyboard'
;------------------------------------------------------------
;rv                        Allocated to registers r5 
;c                         Allocated to registers r7 
;t                         Allocated to registers r4 
;------------------------------------------------------------
;	LAB.c:61: char read_Keyboard()  // get keyboard value
;	-----------------------------------------
;	 function read_Keyboard
;	-----------------------------------------
_read_Keyboard:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	LAB.c:65: for(char c=0; c<4; c++){ // scan keyboard and get value
	mov	r7,#0x00
	mov	r6,#0x00
00110$:
	cjne	r6,#0x04,00139$
00139$:
	jnc	00105$
;	LAB.c:66: KB_PORT = Inputchar[c];
	mov	a,r6
	mov	dptr,#_read_Keyboard_Inputchar_65536_1
	movc	a,@a+dptr
	mov	_P0,a
;	LAB.c:67: rv = ~(KB_PORT % 16); //input
	mov	a,#0x0f
	anl	a,_P0
	cpl	a
	mov	r5,a
;	LAB.c:68: for(char t=0; t<4;t++){
	mov	r4,#0x00
	mov	r3,#0x00
00107$:
	cjne	r3,#0x04,00141$
00141$:
	jnc	00111$
;	LAB.c:69: if(rv&1)return c * 4 + t;
	mov	a,r5
	jnb	acc.0,00102$
	mov	ar2,r7
	mov	a,r2
	add	a,r2
	add	a,acc
	mov	r2,a
	mov	ar1,r4
	mov	a,r1
	add	a,r2
	mov	dpl,a
	ret
00102$:
;	LAB.c:71: rv >>= 1;
	mov	a,r5
	clr	c
	rrc	a
	mov	r5,a
;	LAB.c:68: for(char t=0; t<4;t++){
	inc	r3
	mov	ar4,r3
	sjmp	00107$
00111$:
;	LAB.c:65: for(char c=0; c<4; c++){ // scan keyboard and get value
	inc	r6
	mov	ar7,r6
	sjmp	00110$
00105$:
;	LAB.c:74: return KP_NULL;
	mov	dpl,#0xc8
;	LAB.c:75: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Keypad4x4'
;------------------------------------------------------------
;row                       Allocated with name '_Keypad4x4_row_65536_6'
;col                       Allocated to registers r7 
;------------------------------------------------------------
;	LAB.c:77: char Keypad4x4() {
;	-----------------------------------------
;	 function Keypad4x4
;	-----------------------------------------
_Keypad4x4:
;	LAB.c:80: for (col = 1; col < 16; col <<= 1) {
	mov	r7,#0x01
00106$:
;	LAB.c:81: KB_PORT = ~(col << 4);
	mov	ar6,r7
	mov	a,r6
	swap	a
	anl	a,#0xf0
	cpl	a
	mov	_P0,a
;	LAB.c:82: if (KB_PORT % 0x10 != 0x0f) {
	mov	a,#0x0f
	anl	a,_P0
	mov	r4,a
	clr	a
	mov	r5,#0x00
	cjne	r4,#0x0f,00123$
	cjne	r5,#0x00,00123$
	sjmp	00107$
00123$:
;	LAB.c:83: return col;	
	mov	dpl,r7
	ret
00107$:
;	LAB.c:80: for (col = 1; col < 16; col <<= 1) {
	mov	a,r6
	add	a,r6
	mov	r7,a
	cjne	r7,#0x10,00124$
00124$:
	jc	00106$
;	LAB.c:89: return 16;
	mov	dpl,#0x10
;	LAB.c:90: return col;
;	LAB.c:92: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'timer_PLAY_tone'
;------------------------------------------------------------
;	LAB.c:94: void timer_PLAY_tone(void) __interrupt (3) __using (2){
;	-----------------------------------------
;	 function timer_PLAY_tone
;	-----------------------------------------
_timer_PLAY_tone:
	ar7 = 0x17
	ar6 = 0x16
	ar5 = 0x15
	ar4 = 0x14
	ar3 = 0x13
	ar2 = 0x12
	ar1 = 0x11
	ar0 = 0x10
;	LAB.c:95: TH1 = (char)(play_tone>>8);
	mov	_TH1,(_play_tone + 1)
;	LAB.c:96: TL1 = (char)(play_tone);
	mov	_TL1,_play_tone
;	LAB.c:97: if(!silence){
	jb	_silence,00103$
;	LAB.c:98: SPEKER = !SPEKER;
	cpl	_P1_7
00103$:
;	LAB.c:100: }
	reti
;	eliminated unneeded mov psw,# (no regs used in bank)
;	eliminated unneeded push/pop not_psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
;------------------------------------------------------------
;Allocation info for local variables in function 'timer_'
;------------------------------------------------------------
;count                     Allocated with name '_timer__count_65537_15'
;------------------------------------------------------------
;	LAB.c:102: void timer_(void) __interrupt (1) __using (1){ 
;	-----------------------------------------
;	 function timer_
;	-----------------------------------------
_timer_:
	ar7 = 0x0f
	ar6 = 0x0e
	ar5 = 0x0d
	ar4 = 0x0c
	ar3 = 0x0b
	ar2 = 0x0a
	ar1 = 0x09
	ar0 = 0x08
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
	mov	psw,#0x08
;	LAB.c:104: Hz0(400);
	mov	_TH0,#0xf6
	mov	_TL0,#0x3c
;	LAB.c:110: ET1 = 0;
;	assignBit
	clr	_ET1
;	LAB.c:111: LED_PORT_N = show[count];
	mov	a,_timer__count_65537_15
	add	a,#_show
	mov	r1,a
	mov	_P2,@r1
;	LAB.c:112: LED_PORT_P = (LED_PORT_P & 0xF0)|index[count];
	mov	a,_P1
	anl	a,#0xf0
	mov	r7,a
	mov	a,_timer__count_65537_15
	mov	dptr,#_timer__index_65537_15
	movc	a,@a+dptr
	orl	a,r7
	mov	_P1,a
;	LAB.c:113: ET1 = 1;
;	assignBit
	setb	_ET1
;	LAB.c:117: count = (count+1)%4;
	mov	r6,_timer__count_65537_15
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
	inc	dptr
	mov	__modsint_PARM_2,#0x04
;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
	mov	(__modsint_PARM_2 + 1),r7
	mov	psw,#0x00
	lcall	__modsint
	mov	psw,#0x08
	mov	r6,dpl
	mov	r7,dph
;	LAB.c:118: if(!count){
	mov	a,r6
	mov	_timer__count_65537_15,a
	jnz	00109$
;	LAB.c:119: if(mode == MODE_PLAY){
	jnb	_mode,00105$
;	LAB.c:120: if(play_fast)
	jnb	_play_fast,00102$
;	LAB.c:121: replay_lengh += 2;
	mov	r6,_replay_lengh
	mov	r7,(_replay_lengh + 1)
	mov	a,#0x02
	add	a,r6
	mov	r6,a
	clr	a
	addc	a,r7
	mov	r7,a
	mov	_replay_lengh,r6
	mov	(_replay_lengh + 1),r7
	sjmp	00106$
00102$:
;	LAB.c:123: replay_lengh++;
	inc	_replay_lengh
	clr	a
	cjne	a,_replay_lengh,00106$
	inc	(_replay_lengh + 1)
	sjmp	00106$
00105$:
;	LAB.c:126: record_lengh[record_ntone]++;
	mov	dptr,#_record_ntone
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,r6
	add	a,#_record_lengh
	mov	r6,a
	mov	a,r7
	addc	a,#(_record_lengh >> 8)
	mov	r7,a
	mov	dpl,r6
	mov	dph,r7
	movx	a,@dptr
	mov	r5,a
	inc	r5
	mov	dpl,r6
	mov	dph,r7
	mov	a,r5
	movx	@dptr,a
00106$:
;	LAB.c:129: key = read_Keyboard();
	mov	psw,#0x00
	lcall	_read_Keyboard
	mov	psw,#0x08
	mov	_key,dpl
00109$:
;	LAB.c:132: }
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
;oldkey                    Allocated to registers 
;------------------------------------------------------------
;	LAB.c:136: void main(){
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
;	LAB.c:138: TMOD = 0x11;
	mov	_TMOD,#0x11
;	LAB.c:139: EA = 1;
;	assignBit
	setb	_EA
;	LAB.c:140: ET0 = 1;
;	assignBit
	setb	_ET0
;	LAB.c:141: TR0 = 1;
;	assignBit
	setb	_TR0
;	LAB.c:142: ET1 = 1;
;	assignBit
	setb	_ET1
;	LAB.c:143: TR1 = 1;
;	assignBit
	setb	_TR1
;	LAB.c:147: while(1){
00102$:
;	LAB.c:148: show[0] = decode[0xf];
	mov	dptr,#(_decode + 0x000f)
	clr	a
	movc	a,@a+dptr
	mov	r7,a
	mov	_show,r7
;	LAB.c:149: show[1] = decode[0xf];
	mov	dptr,#(_decode + 0x000f)
	clr	a
	movc	a,@a+dptr
	mov	r7,a
	mov	(_show + 0x0001),r7
;	LAB.c:150: show[2] = decode[0xf];
	mov	dptr,#(_decode + 0x000f)
	clr	a
	movc	a,@a+dptr
	mov	r7,a
	mov	(_show + 0x0002),r7
;	LAB.c:151: show[3] = decode[Keypad4x4()];
	lcall	_Keypad4x4
	mov	a,dpl
	mov	dptr,#_decode
	movc	a,@a+dptr
	mov	r7,a
	mov	(_show + 0x0003),r7
;	LAB.c:153: }
	sjmp	00102$
	.area CSEG    (CODE)
	.area CONST   (CODE)
_tone:
	.byte #0x1d, #0x11	; 4381
	.byte #0x84, #0x1e	; 7812
	.byte #0x2b, #0x2b	; 11051
	.byte #0x1c, #0x37	; 14108
	.byte #0x65, #0x42	; 16997
	.byte #0x09, #0x4d	; 19721
	.byte #0x14, #0x57	; 22292
	.byte #0x8f, #0x60	; 24719
	.byte #0x82, #0x69	; 27010
	.byte #0xf4, #0x71	; 29172
	.byte #0xed, #0x79	; 31213
	.byte #0x73, #0x81	; 33139
	.byte #0x8d, #0x88	; 34957
	.byte #0x42, #0x8f	; 36674
	.byte #0x95, #0x95	; 38293
	.byte #0x8f, #0x9b	; 39823
	.byte #0x31, #0xa1	; 41265
	.byte #0x84, #0xa6	; 42628
	.byte #0x89, #0xab	; 43913
	.byte #0x47, #0xb0	; 45127
	.byte #0xc1, #0xb4	; 46273
	.byte #0xfa, #0xb8	; 47354
	.byte #0xf6, #0xbc	; 48374
	.byte #0xb9, #0xc0	; 49337
	.byte #0x46, #0xc4	; 50246
	.byte #0xa1, #0xc7	; 51105
	.byte #0xca, #0xca	; 51914
	.byte #0xc7, #0xcd	; 52679
	.byte #0x99, #0xd0	; 53401
	.byte #0x42, #0xd3	; 54082
	.byte #0xc5, #0xd5	; 54725
	.byte #0x23, #0xd8	; 55331
	.byte #0x60, #0xda	; 55904
	.byte #0x7d, #0xdc	; 56445
	.byte #0x7b, #0xde	; 56955
	.byte #0x5c, #0xe0	; 57436
	.byte #0x23, #0xe2	; 57891
	.byte #0xd0, #0xe3	; 58320
	.byte #0x65, #0xe5	; 58725
	.byte #0xe3, #0xe6	; 59107
	.byte #0x4c, #0xe8	; 59468
	.byte #0xa0, #0xe9	; 59808
	.byte #0xe2, #0xea	; 60130
	.byte #0x11, #0xec	; 60433
	.byte #0x30, #0xed	; 60720
	.byte #0x3e, #0xee	; 60990
	.byte #0x3d, #0xef	; 61245
	.byte #0x2e, #0xf0	; 61486
	.byte #0x11, #0xf1	; 61713
	.byte #0xe8, #0xf1	; 61928
	.byte #0xb2, #0xf2	; 62130
	.byte #0x71, #0xf3	; 62321
	.byte #0x26, #0xf4	; 62502
	.byte #0xd0, #0xf4	; 62672
	.byte #0x71, #0xf5	; 62833
	.byte #0x08, #0xf6	; 62984
	.byte #0x98, #0xf6	; 63128
	.byte #0x1f, #0xf7	; 63263
	.byte #0x9e, #0xf7	; 63390
	.byte #0x17, #0xf8	; 63511
	.byte #0x88, #0xf8	; 63624
	.byte #0xf4, #0xf8	; 63732
	.byte #0x59, #0xf9	; 63833
	.byte #0xb8, #0xf9	; 63928
	.byte #0x13, #0xfa	; 64019
	.byte #0x68, #0xfa	; 64104
	.byte #0xb8, #0xfa	; 64184
	.byte #0x04, #0xfb	; 64260
	.byte #0x4c, #0xfb	; 64332
	.byte #0x8f, #0xfb	; 64399
	.byte #0xcf, #0xfb	; 64463
	.byte #0x0b, #0xfc	; 64523
	.byte #0x44, #0xfc	; 64580
	.byte #0x7a, #0xfc	; 64634
	.byte #0xac, #0xfc	; 64684
	.byte #0xdc, #0xfc	; 64732
	.byte #0x09, #0xfd	; 64777
	.byte #0x34, #0xfd	; 64820
	.byte #0x5c, #0xfd	; 64860
	.byte #0x82, #0xfd	; 64898
	.byte #0xa6, #0xfd	; 64934
	.byte #0xc7, #0xfd	; 64967
	.byte #0xe7, #0xfd	; 64999
	.byte #0x05, #0xfe	; 65029
	.byte #0x22, #0xfe	; 65058
	.byte #0x3d, #0xfe	; 65085
	.byte #0x56, #0xfe	; 65110
	.byte #0x6e, #0xfe	; 65134
	.byte #0x84, #0xfe	; 65156
	.byte #0x9a, #0xfe	; 65178
	.byte #0xae, #0xfe	; 65198
	.byte #0xc1, #0xfe	; 65217
	.byte #0xd3, #0xfe	; 65235
	.byte #0xe3, #0xfe	; 65251
	.byte #0xf3, #0xfe	; 65267
	.byte #0x02, #0xff	; 65282
	.byte #0x11, #0xff	; 65297
	.byte #0x1e, #0xff	; 65310
	.byte #0x2b, #0xff	; 65323
	.byte #0x37, #0xff	; 65335
	.byte #0x42, #0xff	; 65346
	.byte #0x4d, #0xff	; 65357
	.byte #0x57, #0xff	; 65367
	.byte #0x60, #0xff	; 65376
	.byte #0x69, #0xff	; 65385
	.byte #0x71, #0xff	; 65393
	.byte #0x79, #0xff	; 65401
	.byte #0x81, #0xff	; 65409
	.byte #0x88, #0xff	; 65416
	.byte #0x8f, #0xff	; 65423
	.byte #0x95, #0xff	; 65429
	.byte #0x9b, #0xff	; 65435
	.byte #0xa1, #0xff	; 65441
	.byte #0xa6, #0xff	; 65446
	.byte #0xab, #0xff	; 65451
	.byte #0xb0, #0xff	; 65456
	.byte #0xb4, #0xff	; 65460
	.byte #0xb8, #0xff	; 65464
	.byte #0xbc, #0xff	; 65468
	.byte #0xc0, #0xff	; 65472
_decode:
	.db #0x03	; 3
	.db #0x9f	; 159
	.db #0x25	; 37
	.db #0x0d	; 13
	.db #0x99	; 153
	.db #0x49	; 73	'I'
	.db #0x41	; 65	'A'
	.db #0x1f	; 31
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x6c	; 108	'l'
	.db #0x30	; 48	'0'
	.db #0xe2	; 226
	.db #0x90	; 144
	.db #0x25	; 37
	.db #0xff	; 255
_read_Keyboard_Inputchar_65536_1:
	.db #0xef	; 239
	.db #0xdf	; 223
	.db #0xbf	; 191
	.db #0x7f	; 127
_timer__index_65537_15:
	.db #0x0e	; 14
	.db #0x0d	; 13
	.db #0x0b	; 11
	.db #0x07	; 7
	.area XINIT   (CODE)
__xinit__record_ntone:
	.byte #0x00, #0x00	; 0
	.area CABS    (ABS,CODE)
