;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module proj2
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
_timer__count_65537_11:
	.ds 1
_main_oldkey_65537_16:
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
;count                     Allocated with name '_timer__count_65537_11'
;------------------------------------------------------------
;	proj2.c:93: static unsigned char count = 0;
	mov	_timer__count_65537_11,#0x00
;	proj2.c:50: unsigned char key = 0x0c;      
	mov	_key,#0x0c
;	proj2.c:51: unsigned degree = 48;               
	mov	_degree,#0x30
	mov	(_degree + 1),#0x00
;	proj2.c:60: unsigned short replay_point = 0;
	clr	a
	mov	_replay_point,a
	mov	(_replay_point + 1),a
;	proj2.c:61: unsigned short replay_lengh = 0;
	mov	_replay_lengh,a
	mov	(_replay_lengh + 1),a
;	proj2.c:63: unsigned short play_tone = 0;
	mov	_play_tone,a
	mov	(_play_tone + 1),a
;	proj2.c:44: __bit silence = 1; //When silence == 1, disable speaker
;	assignBit
	setb	_silence
;	proj2.c:46: __bit mode = MODE_RECORD;         //replay or record
;	assignBit
	clr	_mode
;	proj2.c:47: __bit play_mode = PLAYMOD_common; //common or reverse
;	assignBit
	clr	_play_mode
;	proj2.c:48: __bit play_fast = 0;              //normal or 2*speed
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
;	proj2.c:65: char read_Keyboard()  // get keyboard value
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
;	proj2.c:69: for(char c=0; c<4; c++){ // scan keyboard and get value
	mov	r7,#0x00
	mov	r6,#0x00
00110$:
	cjne	r6,#0x04,00139$
00139$:
	jnc	00105$
;	proj2.c:70: KP_PORT = Inputchar[c];
	mov	a,r6
	mov	dptr,#_read_Keyboard_Inputchar_65536_1
	movc	a,@a+dptr
	mov	_P0,a
;	proj2.c:71: rv = ~(KP_PORT % 16); //input
	mov	a,#0x0f
	anl	a,_P0
	cpl	a
	mov	r5,a
;	proj2.c:72: for(char t=0; t<4;t++){
	mov	r4,#0x00
	mov	r3,#0x00
00107$:
	cjne	r3,#0x04,00141$
00141$:
	jnc	00111$
;	proj2.c:73: if(rv&1)return c * 4 + t;
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
;	proj2.c:75: rv >>= 1;
	mov	a,r5
	clr	c
	rrc	a
	mov	r5,a
;	proj2.c:72: for(char t=0; t<4;t++){
	inc	r3
	mov	ar4,r3
	sjmp	00107$
00111$:
;	proj2.c:69: for(char c=0; c<4; c++){ // scan keyboard and get value
	inc	r6
	mov	ar7,r6
	sjmp	00110$
00105$:
;	proj2.c:78: return KP_NULL;
	mov	dpl,#0x78
;	proj2.c:79: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'timer_PLAY_tone'
;------------------------------------------------------------
;	proj2.c:81: void timer_PLAY_tone(void) __interrupt (3) __using (2){
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
;	proj2.c:82: TH1 = (char)(play_tone>>8);
	mov	_TH1,(_play_tone + 1)
;	proj2.c:83: TL1 = (char)(play_tone);
	mov	_TL1,_play_tone
;	proj2.c:84: if(!silence){
	jb	_silence,00103$
;	proj2.c:85: SPEKER = !SPEKER;
	cpl	_P1_7
00103$:
;	proj2.c:87: }
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
;	proj2.c:89: void timer_(void) __interrupt (1) __using (1){ 
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
;	proj2.c:90: Hz0(500);
	mov	_TH0,#0xf8
	mov	_TL0,#0x30
;	proj2.c:96: ET1 = 0;
;	assignBit
	clr	_ET1
;	proj2.c:97: LED_PORT_N = show[count];
	mov	a,_timer__count_65537_11
	add	a,#_show
	mov	r1,a
	mov	_P2,@r1
;	proj2.c:98: LED_PORT_P = (LED_PORT_P & 0xF0)|index[count];
	mov	a,_P1
	anl	a,#0xf0
	mov	r7,a
	mov	a,_timer__count_65537_11
	mov	dptr,#_timer__index_65537_11
	movc	a,@a+dptr
	orl	a,r7
	mov	_P1,a
;	proj2.c:99: ET1 = 1;
;	assignBit
	setb	_ET1
;	proj2.c:103: count = (count+1)%4;
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
	mov	psw,#0x08
	mov	r6,dpl
	mov	r7,dph
;	proj2.c:104: if(!count){
	mov	a,r6
	mov	_timer__count_65537_11,a
	jnz	00109$
;	proj2.c:105: if(mode == MODE_PLAY){
	jnb	_mode,00105$
;	proj2.c:106: if(play_fast)
	jnb	_play_fast,00102$
;	proj2.c:107: replay_lengh += 2;
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
;	proj2.c:109: replay_lengh++;
	inc	_replay_lengh
	clr	a
	cjne	a,_replay_lengh,00106$
	inc	(_replay_lengh + 1)
	sjmp	00106$
00105$:
;	proj2.c:112: record_lengh[record_ntone]++;
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
;	proj2.c:115: key = read_Keyboard();
	mov	psw,#0x00
	lcall	_read_Keyboard
	mov	psw,#0x08
	mov	_key,dpl
00109$:
;	proj2.c:118: }
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
;Segshow                   Allocated to registers r6 r7 
;oldkey                    Allocated with name '_main_oldkey_65537_16'
;------------------------------------------------------------
;	proj2.c:122: void main(){
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
;	proj2.c:124: TMOD = 0x11;
	mov	_TMOD,#0x11
;	proj2.c:125: EA = 1;
;	assignBit
	setb	_EA
;	proj2.c:126: ET0 = 1;
;	assignBit
	setb	_ET0
;	proj2.c:127: TR0 = 1;
;	assignBit
	setb	_TR0
;	proj2.c:128: ET1 = 1;
;	assignBit
	setb	_ET1
;	proj2.c:129: TR1 = 1;
;	assignBit
	setb	_TR1
;	proj2.c:131: unsigned short Segshow = 0;
	mov	r6,#0x00
	mov	r7,#0x00
;	proj2.c:133: unsigned char oldkey = KP_NULL;
	mov	_main_oldkey_65537_16,#0x78
;	proj2.c:134: while(1){
00154$:
;	proj2.c:135: if(key != oldkey){
	mov	a,_main_oldkey_65537_16
	cjne	a,_key,00258$
	ljmp	00123$
00258$:
;	proj2.c:136: oldkey = key;
	mov	_main_oldkey_65537_16,_key
;	proj2.c:137: change = 1;
;	assignBit
	setb	_change
;	proj2.c:138: switch (key)
	mov	a,#0x0c
	cjne	a,_key,00259$
	sjmp	00101$
00259$:
	mov	a,#0x0d
	cjne	a,_key,00260$
	sjmp	00102$
00260$:
	mov	a,#0x0e
	cjne	a,_key,00261$
	sjmp	00103$
00261$:
	mov	a,#0x0f
	cjne	a,_key,00262$
	sjmp	00109$
00262$:
	mov	a,#0x78
	cjne	a,_key,00263$
	sjmp	00115$
00263$:
	ljmp	00118$
;	proj2.c:140: case 0x0C: //start record
00101$:
;	proj2.c:141: Segshow = MAX_RECORD;
	mov	r6,#0xfe
	mov	r7,#0x01
;	proj2.c:142: change = 0;
;	assignBit
	clr	_change
;	proj2.c:143: mode = MODE_RECORD;
;	assignBit
	clr	_mode
;	proj2.c:144: record_ntone = 0;
	mov	dptr,#_record_ntone
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	proj2.c:145: play_tone = 0;
	mov	_play_tone,a
	mov	(_play_tone + 1),a
;	proj2.c:146: silence = 1;
;	assignBit
	setb	_silence
;	proj2.c:147: record_tone[0] = KP_NULL;
	mov	dptr,#_record_tone
	mov	a,#0x78
	movx	@dptr,a
;	proj2.c:148: break;
	ljmp	00123$
;	proj2.c:149: case 0x0D: //start replay
00102$:
;	proj2.c:150: change = 0;
;	assignBit
	clr	_change
;	proj2.c:151: record_lengh[0] = 0;
	mov	dptr,#_record_lengh
	clr	a
	movx	@dptr,a
;	proj2.c:152: mode = MODE_PLAY;
;	assignBit
	setb	_mode
;	proj2.c:153: play_mode = PLAYMOD_common;
;	assignBit
	clr	_play_mode
;	proj2.c:154: play_fast = 0;
;	assignBit
	clr	_play_fast
;	proj2.c:155: replay_point = 0;
	clr	a
	mov	_replay_point,a
	mov	(_replay_point + 1),a
;	proj2.c:156: replay_lengh = 0;
	mov	_replay_lengh,a
	mov	(_replay_lengh + 1),a
;	proj2.c:157: break;
;	proj2.c:158: case 0x0E: //When replay: reverse on/off;  When record: octave down.
	sjmp	00123$
00103$:
;	proj2.c:159: change = 0;
;	assignBit
	clr	_change
;	proj2.c:160: if(mode == MODE_PLAY){
	jnb	_mode,00107$
;	proj2.c:161: play_mode = !play_mode;
	cpl	_play_mode
	sjmp	00123$
00107$:
;	proj2.c:166: if(degree >= 12)
	clr	c
	mov	a,_degree
	subb	a,#0x0c
	mov	a,(_degree + 1)
	subb	a,#0x00
	jc	00123$
;	proj2.c:167: degree -= 12;
	mov	a,_degree
	add	a,#0xf4
	mov	_degree,a
	mov	a,(_degree + 1)
	addc	a,#0xff
	mov	(_degree + 1),a
;	proj2.c:169: break;
;	proj2.c:170: case 0x0F: //When replay: change speed;  When record : octave up
	sjmp	00123$
00109$:
;	proj2.c:171: change = 0;
;	assignBit
	clr	_change
;	proj2.c:172: if(mode == MODE_PLAY){
	jnb	_mode,00113$
;	proj2.c:173: play_fast = !play_fast;
	cpl	_play_fast
	sjmp	00123$
00113$:
;	proj2.c:178: if(degree <= 96)
	clr	c
	mov	a,#0x60
	subb	a,_degree
	clr	a
	subb	a,(_degree + 1)
	jc	00123$
;	proj2.c:179: degree += 12;
	mov	a,#0x0c
	add	a,_degree
	mov	_degree,a
	clr	a
	addc	a,(_degree + 1)
	mov	(_degree + 1),a
;	proj2.c:181: break;
;	proj2.c:182: case KP_NULL:
	sjmp	00123$
00115$:
;	proj2.c:183: if(mode == MODE_RECORD){
	jb	_mode,00123$
;	proj2.c:184: silence = 1;
;	assignBit
	setb	_silence
;	proj2.c:186: break;
;	proj2.c:187: default: 
	sjmp	00123$
00118$:
;	proj2.c:188: if(mode == MODE_RECORD){
	jb	_mode,00123$
;	proj2.c:189: silence = 0;
;	assignBit
	clr	_silence
;	proj2.c:190: play_tone = tone[degree + key];
	mov	r3,_key
	mov	r4,#0x00
	mov	a,r3
	add	a,_degree
	mov	r3,a
	mov	a,r4
	addc	a,(_degree + 1)
	mov	r4,a
	mov	a,r3
	add	a,r3
	mov	r3,a
	mov	a,r4
	rlc	a
	mov	r4,a
	mov	a,r3
	add	a,#_tone
	mov	dpl,a
	mov	a,r4
	addc	a,#(_tone >> 8)
	mov	dph,a
	clr	a
	movc	a,@a+dptr
	mov	_play_tone,a
	inc	dptr
	clr	a
	movc	a,@a+dptr
	mov	(_play_tone + 1),a
;	proj2.c:193: }
00123$:
;	proj2.c:196: if(mode == MODE_RECORD){ 
	jnb	_mode,00270$
	ljmp	00151$
00270$:
;	proj2.c:197: show[3] = decode[degree/12]&0xFE; //display degree
	mov	__divuint_PARM_2,#0x0c
	mov	(__divuint_PARM_2 + 1),#0x00
	mov	dpl,_degree
	mov	dph,(_degree + 1)
	push	ar7
	push	ar6
	lcall	__divuint
	mov	r3,dpl
	mov	r4,dph
	pop	ar6
	pop	ar7
	mov	a,r3
	add	a,#_decode
	mov	dpl,a
	mov	a,r4
	addc	a,#(_decode >> 8)
	mov	dph,a
	clr	a
	movc	a,@a+dptr
	mov	r4,a
	mov	a,#0xfe
	anl	a,r4
	mov	(_show + 0x0003),a
;	proj2.c:199: if(record_lengh[record_ntone] > 250)change = 1; 
	mov	dptr,#_record_ntone
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	a,r3
	add	a,#_record_lengh
	mov	dpl,a
	mov	a,r4
	addc	a,#(_record_lengh >> 8)
	mov	dph,a
	movx	a,@dptr
	mov  r4,a
	add	a,#0xff - 0xfa
	jnc	00125$
;	assignBit
	setb	_change
00125$:
;	proj2.c:200: if(change){ //record current note
	jb	_change,00272$
	ljmp	00152$
00272$:
;	proj2.c:201: record_ntone++;
	mov	dptr,#_record_ntone
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	addc	a,#0x00
	movx	@dptr,a
;	proj2.c:202: Segshow--;
	dec	r6
	cjne	r6,#0xff,00273$
	dec	r7
00273$:
;	proj2.c:203: if(record_ntone == MAX_RECORD){
	mov	dptr,#_record_ntone
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	ar2,r3
	mov	ar5,r4
	cjne	r2,#0xfe,00127$
	cjne	r5,#0x01,00127$
;	proj2.c:204: mode = MODE_PLAY;
;	assignBit
	setb	_mode
;	proj2.c:205: continue;
	ljmp	00154$
00127$:
;	proj2.c:207: if(key == KP_NULL)
	mov	a,#0x78
	cjne	a,_key,00129$
;	proj2.c:208: record_tone[record_ntone] = KP_NULL;
	mov	a,r3
	add	a,#_record_tone
	mov	dpl,a
	mov	a,r4
	addc	a,#(_record_tone >> 8)
	mov	dph,a
	mov	a,#0x78
	movx	@dptr,a
	sjmp	00130$
00129$:
;	proj2.c:210: record_tone[record_ntone] = degree + key;
	mov	a,r3
	add	a,#_record_tone
	mov	dpl,a
	mov	a,r4
	addc	a,#(_record_tone >> 8)
	mov	dph,a
	mov	r5,_degree
	mov	a,_key
	add	a,r5
	mov	r5,a
	movx	@dptr,a
00130$:
;	proj2.c:211: record_lengh[record_ntone] = 0;
	mov	dptr,#_record_ntone
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	mov	a,r4
	add	a,#_record_lengh
	mov	dpl,a
	mov	a,r5
	addc	a,#(_record_lengh >> 8)
	mov	dph,a
	clr	a
	movx	@dptr,a
;	proj2.c:212: change = 0;
;	assignBit
	clr	_change
	ljmp	00152$
00151$:
;	proj2.c:216: if(play_mode == PLAYMOD_reverse){
	jnb	_play_mode,00148$
;	proj2.c:217: if(replay_lengh >= record_lengh[replay_point]){
	mov	a,_replay_point
	add	a,#_record_lengh
	mov	dpl,a
	mov	a,(_replay_point + 1)
	addc	a,#(_record_lengh >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
	mov	r4,#0x00
	clr	c
	mov	a,_replay_lengh
	subb	a,r5
	mov	a,(_replay_lengh + 1)
	subb	a,r4
	jc	00139$
;	proj2.c:218: replay_lengh = 0;
	clr	a
	mov	_replay_lengh,a
	mov	(_replay_lengh + 1),a
;	proj2.c:219: replay_point--;
	dec	_replay_point
	mov	a,#0xff
	cjne	a,_replay_point,00280$
	dec	(_replay_point + 1)
00280$:
;	proj2.c:220: Segshow = replay_point;
	mov	r6,_replay_point
	mov	r7,(_replay_point + 1)
;	proj2.c:221: if(replay_point == 0) replay_point = record_ntone;
	mov	a,_replay_point
	orl	a,(_replay_point + 1)
	jnz	00134$
	mov	dptr,#_record_ntone
	movx	a,@dptr
	mov	_replay_point,a
	inc	dptr
	movx	a,@dptr
	mov	(_replay_point + 1),a
00134$:
;	proj2.c:222: play_tone = tone[record_tone[replay_point]];
	mov	a,_replay_point
	add	a,#_record_tone
	mov	dpl,a
	mov	a,(_replay_point + 1)
	addc	a,#(_record_tone >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
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
;	proj2.c:224: if(record_tone[replay_point] == KP_NULL)silence = 1;
	cjne	r5,#0x78,00136$
;	assignBit
	setb	_silence
	sjmp	00139$
00136$:
;	proj2.c:225: else silence = 0;
;	assignBit
	clr	_silence
00139$:
;	proj2.c:228: show[3] = decode[12];
	mov	dptr,#(_decode + 0x000c)
	clr	a
	movc	a,@a+dptr
	mov	r5,a
	mov	(_show + 0x0003),r5
	ljmp	00152$
00148$:
;	proj2.c:231: if(replay_lengh >= record_lengh[replay_point]){
	mov	a,_replay_point
	add	a,#_record_lengh
	mov	dpl,a
	mov	a,(_replay_point + 1)
	addc	a,#(_record_lengh >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
	mov	r4,#0x00
	clr	c
	mov	a,_replay_lengh
	subb	a,r5
	mov	a,(_replay_lengh + 1)
	subb	a,r4
	jc	00146$
;	proj2.c:232: replay_lengh = 0;
	clr	a
	mov	_replay_lengh,a
	mov	(_replay_lengh + 1),a
;	proj2.c:233: replay_point++;
	inc	_replay_point
;	genFromRTrack removed	clr	a
	cjne	a,_replay_point,00285$
	inc	(_replay_point + 1)
00285$:
;	proj2.c:235: if(replay_point == record_ntone) replay_point = 0; //Loop play
	mov	dptr,#_record_ntone
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	mov	a,r4
	cjne	a,_replay_point,00141$
	mov	a,r5
	cjne	a,(_replay_point + 1),00141$
	clr	a
	mov	_replay_point,a
	mov	(_replay_point + 1),a
00141$:
;	proj2.c:237: play_tone = tone[record_tone[replay_point]];
	mov	a,_replay_point
	add	a,#_record_tone
	mov	dpl,a
	mov	a,(_replay_point + 1)
	addc	a,#(_record_tone >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
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
;	proj2.c:239: if(record_tone[replay_point] == KP_NULL)silence = 1;
	cjne	r5,#0x78,00143$
;	assignBit
	setb	_silence
	sjmp	00144$
00143$:
;	proj2.c:240: else silence = 0;
;	assignBit
	clr	_silence
00144$:
;	proj2.c:242: Segshow = record_ntone - replay_point;
	mov	dptr,#_record_ntone
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	mov	a,r4
	clr	c
	subb	a,_replay_point
	mov	r6,a
	mov	a,r5
	subb	a,(_replay_point + 1)
	mov	r7,a
00146$:
;	proj2.c:244: show[3] = decode[11];
	mov	dptr,#(_decode + 0x000b)
	clr	a
	movc	a,@a+dptr
	mov	r5,a
	mov	(_show + 0x0003),r5
00152$:
;	proj2.c:247: show[2] = decode[(Segshow/100)%10];
	mov	ar4,r6
	mov	ar5,r7
	mov	__divuint_PARM_2,#0x64
	mov	(__divuint_PARM_2 + 1),#0x00
	mov	dpl,r4
	mov	dph,r5
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	lcall	__divuint
	mov	__moduint_PARM_2,#0x0a
	mov	(__moduint_PARM_2 + 1),#0x00
	lcall	__moduint
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
;	proj2.c:248: show[1] = decode[(Segshow/10)%10];
	mov	__divuint_PARM_2,#0x0a
	mov	(__divuint_PARM_2 + 1),#0x00
	mov	dpl,r4
	mov	dph,r5
	push	ar5
	push	ar4
	lcall	__divuint
	mov	__moduint_PARM_2,#0x0a
	mov	(__moduint_PARM_2 + 1),#0x00
	lcall	__moduint
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
;	proj2.c:249: show[0] = decode[Segshow%10];
	mov	__moduint_PARM_2,#0x0a
	mov	(__moduint_PARM_2 + 1),#0x00
	mov	dpl,r4
	mov	dph,r5
	lcall	__moduint
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
;	proj2.c:251: }
	ljmp	00154$
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
	.db #0x10	; 16
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
	.byte #0x00, #0x00	; 0
	.area CABS    (ABS,CODE)
