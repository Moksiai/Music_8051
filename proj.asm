;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module proj
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _timer__index_65537_11
	.globl _read_Keyboard_Inputchar_65536_1
	.globl _decode
	.globl _tone
	.globl _main
	.globl _timer_
	.globl _timer_PLAY_tone
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
	.globl _change
	.globl _silence
	.globl _play_tone
	.globl _replay_lengh
	.globl _replay_point
	.globl _show
	.globl _mode
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
_mode::
	.ds 1
_show::
	.ds 4
_replay_point::
	.ds 1
_replay_lengh::
	.ds 2
_play_tone::
	.ds 2
_timer__count_65537_11:
	.ds 1
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
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
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
_record_tone::
	.ds 200
_record_lengh::
	.ds 400
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
_record_ntone::
	.ds 1
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
	ljmp	_timer_PLAY_tone
	.ds	5
	reti
	.ds	7
	ljmp	_timer_
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
;count                     Allocated with name '_timer__count_65537_11'
;------------------------------------------------------------
;	proj.c:74: static unsigned char count = 0;
	mov	_timer__count_65537_11,#0x00
;	proj.c:31: unsigned char key = KP_NULL;
	mov	_key,#0x11
;	proj.c:32: unsigned char mode = MODE_RECORD;
	mov	_mode,#0x00
;	proj.c:28: __bit silence = 1;
;	assignBit
	setb	_silence
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
;	proj.c:45: char read_Keyboard()  // get keyboard value
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
;	proj.c:49: for(char c=0; c<4; c++){ // scan keyboard and get value
	mov	r7,#0x00
	mov	r6,#0x00
00110$:
	cjne	r6,#0x04,00139$
00139$:
	jnc	00105$
;	proj.c:50: KB_PORT = Inputchar[c];
	mov	a,r6
	mov	dptr,#_read_Keyboard_Inputchar_65536_1
	movc	a,@a+dptr
	mov	_P0,a
;	proj.c:51: rv = ~(KB_PORT % 16); //input
	mov	a,#0x0f
	anl	a,_P0
	cpl	a
	mov	r5,a
;	proj.c:52: for(char t=0; t<4;t++){
	mov	r4,#0x00
	mov	r3,#0x00
00107$:
	cjne	r3,#0x04,00141$
00141$:
	jnc	00111$
;	proj.c:53: if(rv&1)return c * 4 + t;
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
;	proj.c:55: rv >>= 1;
	mov	a,r5
	clr	c
	rrc	a
	mov	r5,a
;	proj.c:52: for(char t=0; t<4;t++){
	inc	r3
	mov	ar4,r3
	sjmp	00107$
00111$:
;	proj.c:49: for(char c=0; c<4; c++){ // scan keyboard and get value
	inc	r6
	mov	ar7,r6
	sjmp	00110$
00105$:
;	proj.c:58: return KP_NULL;
	mov	dpl,#0x11
;	proj.c:59: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'timer_PLAY_tone'
;------------------------------------------------------------
;	proj.c:61: void timer_PLAY_tone(void) __interrupt (1) __using (1){
;	-----------------------------------------
;	 function timer_PLAY_tone
;	-----------------------------------------
_timer_PLAY_tone:
	ar7 = 0x0f
	ar6 = 0x0e
	ar5 = 0x0d
	ar4 = 0x0c
	ar3 = 0x0b
	ar2 = 0x0a
	ar1 = 0x09
	ar0 = 0x08
;	proj.c:62: TH0 = (char)(play_tone>>8);
	mov	_TH0,(_play_tone + 1)
;	proj.c:63: TL0 = (char)(play_tone);
	mov	_TL0,_play_tone
;	proj.c:64: if(!silence){
	jb	_silence,00103$
;	proj.c:65: SPEKER = !SPEKER;
	cpl	_P1_7
00103$:
;	proj.c:67: }
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
;count                     Allocated with name '_timer__count_65537_11'
;------------------------------------------------------------
;	proj.c:69: void timer_(void) __interrupt (3) __using (2){ 
;	-----------------------------------------
;	 function timer_
;	-----------------------------------------
_timer_:
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
;	proj.c:71: Hz1(500);
	mov	_TH1,#0xf8
	mov	_TL1,#0x30
;	proj.c:77: LED_PORT_P = (LED_PORT_P & 0xF0)|index[count];
	mov	a,_P1
	anl	a,#0xf0
	mov	r7,a
	mov	a,_timer__count_65537_11
	mov	dptr,#_timer__index_65537_11
	movc	a,@a+dptr
	orl	a,r7
	mov	_P1,a
;	proj.c:78: LED_PORT_N = show[count];
	mov	a,_timer__count_65537_11
	add	a,#_show
	mov	r1,a
	mov	_P2,@r1
;	proj.c:82: count = (count+1)%4;
	mov	r6,_timer__count_65537_11
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
	inc	dptr
	mov	__modsint_PARM_2,#0x04
;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
	mov	(__modsint_PARM_2 + 1),r7
	mov	psw,#0x00
	lcall	__modsint
	mov	psw,#0x10
	mov	r6,dpl
	mov	r7,dph
;	proj.c:83: if(!count){
	mov	a,r6
	mov	_timer__count_65537_11,a
	jnz	00109$
;	proj.c:84: switch (mode)
	mov	a,_mode
	add	a,#0xff - 0x03
	jc	00106$
	mov	a,_mode
	mov	b,#0x03
	mul	ab
	mov	dptr,#00121$
	jmp	@a+dptr
00121$:
	ljmp	00101$
	ljmp	00103$
	ljmp	00104$
	ljmp	00102$
;	proj.c:86: case MODE_RECORD:
00101$:
;	proj.c:87: record_lengh[record_ntone]+=2;
	mov	dptr,#_record_ntone
	movx	a,@dptr
	mov	b,#0x02
	mul	ab
	add	a,#_record_lengh
	mov	r6,a
	mov	a,#(_record_lengh >> 8)
	addc	a,b
	mov	r7,a
	mov	dpl,r6
	mov	dph,r7
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	mov	a,#0x02
	add	a,r4
	mov	r4,a
	clr	a
	addc	a,r5
	mov	r5,a
	mov	dpl,r6
	mov	dph,r7
	mov	a,r4
	movx	@dptr,a
	mov	a,r5
	inc	dptr
	movx	@dptr,a
;	proj.c:88: break;
;	proj.c:89: case MODE_PLAYFAST:
	sjmp	00106$
00102$:
;	proj.c:90: replay_lengh+=2;
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
;	proj.c:91: case MODE_PLAY:
00103$:
;	proj.c:92: replay_lengh++;
	inc	_replay_lengh
	clr	a
	cjne	a,_replay_lengh,00122$
	inc	(_replay_lengh + 1)
00122$:
;	proj.c:93: case MODE_PLAYSLOW:
00104$:
;	proj.c:94: replay_lengh++;
	inc	_replay_lengh
	clr	a
	cjne	a,_replay_lengh,00123$
	inc	(_replay_lengh + 1)
00123$:
;	proj.c:98: }
00106$:
;	proj.c:100: key = read_Keyboard();
	mov	psw,#0x00
	lcall	_read_Keyboard
	mov	psw,#0x10
	mov	_key,dpl
00109$:
;	proj.c:103: }
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
;oldkey                    Allocated to registers r7 
;Segshow                   Allocated to registers r5 
;Segshow                   Allocated to registers r6 
;------------------------------------------------------------
;	proj.c:107: void main(){
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
;	proj.c:109: TMOD = 0x11;
	mov	_TMOD,#0x11
;	proj.c:110: EA = 1;
;	assignBit
	setb	_EA
;	proj.c:111: ET0 = 1;
;	assignBit
	setb	_ET0
;	proj.c:112: TR0 = 1;
;	assignBit
	setb	_TR0
;	proj.c:113: ET1 = 1;
;	assignBit
	setb	_ET1
;	proj.c:114: TR1 = 1;
;	assignBit
	setb	_TR1
;	proj.c:117: unsigned char oldkey = KP_NULL;
	mov	r7,#0x11
;	proj.c:118: while(1){
00131$:
;	proj.c:119: if(key != oldkey){
	mov	a,r7
	cjne	a,_key,00199$
	ljmp	00113$
00199$:
;	proj.c:120: oldkey = key;
	mov	r7,_key
;	proj.c:121: change = 1;
;	assignBit
	setb	_change
;	proj.c:122: switch (key)
	mov	a,#0x0c
	cjne	a,_key,00200$
	sjmp	00101$
00200$:
	mov	a,#0x0d
	cjne	a,_key,00201$
	sjmp	00102$
00201$:
	mov	a,#0x0e
	cjne	a,_key,00202$
	sjmp	00103$
00202$:
	mov	a,#0x0f
	cjne	a,_key,00203$
	sjmp	00104$
00203$:
	mov	a,#0x11
;	proj.c:124: case 0x0C:
	cjne	a,_key,00108$
	sjmp	00105$
00101$:
;	proj.c:125: change = 0;
;	assignBit
	clr	_change
;	proj.c:126: mode = MODE_RECORD;
	mov	_mode,#0x00
;	proj.c:127: record_ntone = 0;
	mov	dptr,#_record_ntone
	clr	a
	movx	@dptr,a
;	proj.c:128: silence = 1;
;	assignBit
	setb	_silence
;	proj.c:129: break;
;	proj.c:130: case 0x0D:
	sjmp	00113$
00102$:
;	proj.c:131: change = 0;
;	assignBit
	clr	_change
;	proj.c:132: record_lengh[0] = 0;
	mov	dptr,#_record_lengh
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	proj.c:133: mode = MODE_PLAYSLOW;
	mov	_mode,#0x02
;	proj.c:134: replay_point = 0;
;	1-genFromRTrack replaced	mov	_replay_point,#0x00
	mov	_replay_point,a
;	proj.c:135: replay_lengh = 0;
	mov	_replay_lengh,a
	mov	(_replay_lengh + 1),a
;	proj.c:136: break;
;	proj.c:137: case 0x0E:
	sjmp	00113$
00103$:
;	proj.c:138: change = 0;
;	assignBit
	clr	_change
;	proj.c:139: record_lengh[0] = 0;
	mov	dptr,#_record_lengh
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	proj.c:140: mode = MODE_PLAY;
	mov	_mode,#0x01
;	proj.c:141: replay_point = 0;
;	1-genFromRTrack replaced	mov	_replay_point,#0x00
	mov	_replay_point,a
;	proj.c:142: replay_lengh = 0;
	mov	_replay_lengh,a
	mov	(_replay_lengh + 1),a
;	proj.c:143: break;
;	proj.c:144: case 0x0F:
	sjmp	00113$
00104$:
;	proj.c:145: change = 0;
;	assignBit
	clr	_change
;	proj.c:146: record_lengh[0] = 0;
	mov	dptr,#_record_lengh
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	proj.c:147: mode = MODE_PLAYFAST;
	mov	_mode,#0x03
;	proj.c:148: replay_point = 0;
;	1-genFromRTrack replaced	mov	_replay_point,#0x00
	mov	_replay_point,a
;	proj.c:149: replay_lengh = 0;
	mov	_replay_lengh,a
	mov	(_replay_lengh + 1),a
;	proj.c:150: break;
;	proj.c:151: case KP_NULL:
	sjmp	00113$
00105$:
;	proj.c:152: if(mode == MODE_RECORD){
	mov	a,_mode
	jnz	00113$
;	proj.c:153: silence = 1;
;	assignBit
	setb	_silence
;	proj.c:155: break;
;	proj.c:156: default:
	sjmp	00113$
00108$:
;	proj.c:157: if(mode == MODE_RECORD){
	mov	a,_mode
	jnz	00113$
;	proj.c:158: silence = 0;
;	assignBit
	clr	_silence
;	proj.c:159: play_tone = tone[key];
	mov	a,_key
	mov	b,#0x02
	mul	ab
	add	a,#_tone
	mov	dpl,a
	mov	a,#(_tone >> 8)
	addc	a,b
	mov	dph,a
	clr	a
	movc	a,@a+dptr
	mov	_play_tone,a
	inc	dptr
	clr	a
	movc	a,@a+dptr
	mov	(_play_tone + 1),a
;	proj.c:162: }
00113$:
;	proj.c:164: if(mode == MODE_RECORD){
	mov	a,_mode
	jz	00207$
	ljmp	00128$
00207$:
;	proj.c:165: unsigned char Segshow = MAX_RECORD-record_ntone;
	mov	dptr,#_record_ntone
	movx	a,@dptr
	mov	r6,a
	mov	r5,a
	mov	a,#0xc8
	clr	c
	subb	a,r5
	mov	r5,a
;	proj.c:166: show[3] = decode[10];
	mov	dptr,#(_decode + 0x000a)
	clr	a
	movc	a,@a+dptr
	mov	r4,a
	mov	(_show + 0x0003),r4
;	proj.c:167: show[2] = decode[(Segshow/100)%10];
	mov	r4,#0x00
	mov	__divsint_PARM_2,#0x64
;	1-genFromRTrack replaced	mov	(__divsint_PARM_2 + 1),#0x00
	mov	(__divsint_PARM_2 + 1),r4
	mov	dpl,r5
	mov	dph,r4
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	lcall	__divsint
	mov	__modsint_PARM_2,#0x0a
	mov	(__modsint_PARM_2 + 1),#0x00
	lcall	__modsint
	mov	r2,dpl
	mov	r3,dph
	pop	ar4
	pop	ar5
	mov	a,r2
	add	a,#_decode
	mov	dpl,a
	mov	a,r3
	addc	a,#(_decode >> 8)
	mov	dph,a
	clr	a
	movc	a,@a+dptr
	mov	r3,a
	mov	(_show + 0x0002),r3
;	proj.c:168: show[1] = decode[(Segshow/10)%10];
	mov	__divsint_PARM_2,#0x0a
	mov	(__divsint_PARM_2 + 1),#0x00
	mov	dpl,r5
	mov	dph,r4
	push	ar5
	push	ar4
	lcall	__divsint
	mov	__modsint_PARM_2,#0x0a
	mov	(__modsint_PARM_2 + 1),#0x00
	lcall	__modsint
	mov	r2,dpl
	mov	r3,dph
	pop	ar4
	pop	ar5
	mov	a,r2
	add	a,#_decode
	mov	dpl,a
	mov	a,r3
	addc	a,#(_decode >> 8)
	mov	dph,a
	clr	a
	movc	a,@a+dptr
	mov	r3,a
	mov	(_show + 0x0001),r3
;	proj.c:169: show[0] = decode[Segshow%10];
	mov	__modsint_PARM_2,#0x0a
	mov	(__modsint_PARM_2 + 1),#0x00
	mov	dpl,r5
	mov	dph,r4
	lcall	__modsint
	mov	r4,dpl
	mov	r5,dph
	pop	ar6
	pop	ar7
	mov	a,r4
	add	a,#_decode
	mov	dpl,a
	mov	a,r5
	addc	a,#(_decode >> 8)
	mov	dph,a
	clr	a
	movc	a,@a+dptr
	mov	r5,a
	mov	_show,r5
;	proj.c:171: if(record_lengh[record_ntone] > 65500)change = 1;
	mov	a,r6
	mov	b,#0x02
	mul	ab
	add	a,#_record_lengh
	mov	dpl,a
	mov	a,#(_record_lengh >> 8)
	addc	a,b
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	clr	c
	mov	a,#0xdc
	subb	a,r5
	mov	a,#0xff
	subb	a,r6
	jnc	00115$
;	assignBit
	setb	_change
00115$:
;	proj.c:172: if(change){
	jb	_change,00209$
	ljmp	00131$
00209$:
;	proj.c:173: record_ntone++;
	mov	dptr,#_record_ntone
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
;	proj.c:174: if(record_ntone == MAX_RECORD){
	movx	a,@dptr
	mov	r6,a
	cjne	r6,#0xc8,00117$
;	proj.c:175: mode = MODE_PLAY;
	mov	_mode,#0x01
;	proj.c:176: continue;
	ljmp	00131$
00117$:
;	proj.c:178: record_tone[record_ntone] = key;
	mov	a,r6
	add	a,#_record_tone
	mov	dpl,a
	clr	a
	addc	a,#(_record_tone >> 8)
	mov	dph,a
	mov	a,_key
	movx	@dptr,a
;	proj.c:179: record_lengh[record_ntone] = 0;
	mov	dptr,#_record_ntone
	movx	a,@dptr
	mov	b,#0x02
	mul	ab
	add	a,#_record_lengh
	mov	dpl,a
	mov	a,#(_record_lengh >> 8)
	addc	a,b
	mov	dph,a
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	proj.c:180: change = 0;
;	assignBit
	clr	_change
	ljmp	00131$
00128$:
;	proj.c:184: if(replay_lengh >= record_lengh[replay_point]){
	mov	a,_replay_point
	mov	b,#0x02
	mul	ab
	add	a,#_record_lengh
	mov	dpl,a
	mov	a,#(_record_lengh >> 8)
	addc	a,b
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	clr	c
	mov	a,_replay_lengh
	subb	a,r5
	mov	a,(_replay_lengh + 1)
	subb	a,r6
	jc	00126$
;	proj.c:185: replay_lengh = 0;
	clr	a
	mov	_replay_lengh,a
	mov	(_replay_lengh + 1),a
;	proj.c:186: replay_point++;
	inc	_replay_point
;	proj.c:187: if(replay_point == record_ntone) replay_point = 0;
	mov	dptr,#_record_ntone
	movx	a,@dptr
	cjne	a,_replay_point,00121$
	mov	_replay_point,#0x00
00121$:
;	proj.c:188: play_tone = tone[record_tone[replay_point]];
	mov	a,_replay_point
	add	a,#_record_tone
	mov	dpl,a
	clr	a
	addc	a,#(_record_tone >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r6,a
	mov	b,#0x02
	mul	ab
	add	a,#_tone
	mov	dpl,a
	mov	a,#(_tone >> 8)
	addc	a,b
	mov	dph,a
	clr	a
	movc	a,@a+dptr
	mov	_play_tone,a
	inc	dptr
	clr	a
	movc	a,@a+dptr
	mov	(_play_tone + 1),a
;	proj.c:190: if(record_tone[replay_point] == KP_NULL)silence = 1;
	cjne	r6,#0x11,00123$
;	assignBit
	setb	_silence
	sjmp	00126$
00123$:
;	proj.c:191: else silence = 0;
;	assignBit
	clr	_silence
00126$:
;	proj.c:193: unsigned char Segshow = record_ntone - replay_point;
	mov	dptr,#_record_ntone
	movx	a,@dptr
	clr	c
	subb	a,_replay_point
	mov	r6,a
;	proj.c:194: show[3] = decode[10+mode];
	mov	r5,_mode
	mov	a,#0x0a
	add	a,r5
	mov	r5,a
	rlc	a
	subb	a,acc
	mov	r4,a
	mov	a,r5
	add	a,#_decode
	mov	dpl,a
	mov	a,r4
	addc	a,#(_decode >> 8)
	mov	dph,a
	clr	a
	movc	a,@a+dptr
	mov	r5,a
	mov	(_show + 0x0003),r5
;	proj.c:195: show[2] = decode[(Segshow/100)%10];
	mov	r5,#0x00
	mov	__divsint_PARM_2,#0x64
;	1-genFromRTrack replaced	mov	(__divsint_PARM_2 + 1),#0x00
	mov	(__divsint_PARM_2 + 1),r5
	mov	dpl,r6
	mov	dph,r5
	push	ar7
	push	ar6
	push	ar5
	lcall	__divsint
	mov	__modsint_PARM_2,#0x0a
	mov	(__modsint_PARM_2 + 1),#0x00
	lcall	__modsint
	mov	r3,dpl
	mov	r4,dph
	pop	ar5
	pop	ar6
	mov	a,r3
	add	a,#_decode
	mov	dpl,a
	mov	a,r4
	addc	a,#(_decode >> 8)
	mov	dph,a
	clr	a
	movc	a,@a+dptr
	mov	r4,a
	mov	(_show + 0x0002),r4
;	proj.c:196: show[1] = decode[(Segshow/10)%10];
	mov	__divsint_PARM_2,#0x0a
	mov	(__divsint_PARM_2 + 1),#0x00
	mov	dpl,r6
	mov	dph,r5
	push	ar6
	push	ar5
	lcall	__divsint
	mov	__modsint_PARM_2,#0x0a
	mov	(__modsint_PARM_2 + 1),#0x00
	lcall	__modsint
	mov	r3,dpl
	mov	r4,dph
	pop	ar5
	pop	ar6
	mov	a,r3
	add	a,#_decode
	mov	dpl,a
	mov	a,r4
	addc	a,#(_decode >> 8)
	mov	dph,a
	clr	a
	movc	a,@a+dptr
	mov	r4,a
	mov	(_show + 0x0001),r4
;	proj.c:197: show[0] = decode[Segshow%10];
	mov	__modsint_PARM_2,#0x0a
	mov	(__modsint_PARM_2 + 1),#0x00
	mov	dpl,r6
	mov	dph,r5
	lcall	__modsint
	mov	r5,dpl
	mov	r6,dph
	pop	ar7
	mov	a,r5
	add	a,#_decode
	mov	dpl,a
	mov	a,r6
	addc	a,#(_decode >> 8)
	mov	dph,a
	clr	a
	movc	a,@a+dptr
	mov	r6,a
	mov	_show,r6
;	proj.c:200: }
	ljmp	00131$
	.area CSEG    (CODE)
	.area CONST   (CODE)
_tone:
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
	.byte #0x00, #0x00	; 0
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
_timer__index_65537_11:
	.db #0x0e	; 14
	.db #0x0d	; 13
	.db #0x0b	; 11
	.db #0x07	; 7
	.area XINIT   (CODE)
__xinit__record_ntone:
	.db #0x00	; 0
	.area CABS    (ABS,CODE)
