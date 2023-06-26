;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _tlengh
	.globl _tone
	.globl _main
	.globl _timer
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
	.globl _decode
	.globl _key
	.globl _a
	.globl _count
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
_count::
	.ds 1
_a::
	.ds 4
_key::
	.ds 1
_decode::
	.ds 16
_timer_index_65537_8:
	.ds 4
_timer_indexN_65537_8:
	.ds 4
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
	ljmp	_timer
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
;	main.c:10: unsigned char key = 0xf;
	mov	_key,#0x0f
;	main.c:12: unsigned char decode[16] = {0b00000011, 0b10011111, 0b00100101, 0b00001101,
	mov	_decode,#0x03
	mov	(_decode + 0x0001),#0x9f
	mov	(_decode + 0x0002),#0x25
	mov	(_decode + 0x0003),#0x0d
	mov	(_decode + 0x0004),#0x99
	mov	(_decode + 0x0005),#0x49
	mov	(_decode + 0x0006),#0x41
	mov	(_decode + 0x0007),#0x1f
	mov	(_decode + 0x0008),#0x01
	mov	(_decode + 0x0009),#0x09
	mov	(_decode + 0x000a),#0x41
	mov	(_decode + 0x000b),#0x1f
	mov	(_decode + 0x000c),#0x03
	mov	(_decode + 0x000d),#0x9f
	mov	(_decode + 0x000e),#0x25
	mov	(_decode + 0x000f),#0xff
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
;	main.c:20: char read_Keyboard()  // get keyboard value
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
;	main.c:24: for(char c=0; c<4; c++){ // scan keyboard and get value
	mov	r7,#0x00
	mov	r6,#0x00
00110$:
	cjne	r6,#0x04,00139$
00139$:
	jnc	00105$
;	main.c:25: KB_PORT = ~(0x10<<c);
	mov	ar5,r6
	mov	b,r5
	inc	b
	mov	a,#0x10
	sjmp	00143$
00141$:
	add	a,acc
00143$:
	djnz	b,00141$
	cpl	a
	mov	_P0,a
;	main.c:26: rv = ~(KB_PORT % 16); //input
	mov	a,#0x0f
	anl	a,_P0
	cpl	a
	mov	r5,a
;	main.c:27: for(char t=0; t<4;t++){
	mov	r4,#0x00
	mov	r3,#0x00
00107$:
	cjne	r3,#0x04,00144$
00144$:
	jnc	00111$
;	main.c:28: if(rv&1==1)return c * 4 + t;
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
;	main.c:30: rv = rv >> 1;
	mov	a,r5
	clr	c
	rrc	a
	mov	r5,a
;	main.c:27: for(char t=0; t<4;t++){
	inc	r3
	mov	ar4,r3
	sjmp	00107$
00111$:
;	main.c:24: for(char c=0; c<4; c++){ // scan keyboard and get value
	inc	r6
	mov	ar7,r6
	sjmp	00110$
00105$:
;	main.c:33: return 17;
	mov	dpl,#0x11
;	main.c:34: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'timer'
;------------------------------------------------------------
;index                     Allocated with name '_timer_index_65537_8'
;indexN                    Allocated with name '_timer_indexN_65537_8'
;------------------------------------------------------------
;	main.c:36: void timer(void) __interrupt (1) __using (1){
;	-----------------------------------------
;	 function timer
;	-----------------------------------------
_timer:
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
;	main.c:38: TH0 = (char)((65536-FQ)>>8);
	mov	_TH0,#0xea
;	main.c:39: TL0 = (char)(65536-FQ);
	mov	_TL0,#0x84
;	main.c:42: unsigned char index[4] = {0xE,0xD,0xB,0x7};
	mov	_timer_index_65537_8,#0x0e
	mov	(_timer_index_65537_8 + 0x0001),#0x0d
	mov	(_timer_index_65537_8 + 0x0002),#0x0b
	mov	(_timer_index_65537_8 + 0x0003),#0x07
;	main.c:43: unsigned char indexN[4] = {0xE,0xD,0xB,0x7};
	mov	_timer_indexN_65537_8,#0x0e
	mov	(_timer_indexN_65537_8 + 0x0001),#0x0d
	mov	(_timer_indexN_65537_8 + 0x0002),#0x0b
	mov	(_timer_indexN_65537_8 + 0x0003),#0x07
;	main.c:44: LED_PORT_P = index[count];
	mov	a,_count
	add	a,#_timer_index_65537_8
	mov	r1,a
	mov	_P1,@r1
;	main.c:45: LED_PORT_N = decode[a[count]];
	mov	a,_count
	add	a,#_a
	mov	r1,a
	mov	a,@r1
	add	a,#_decode
	mov	r1,a
	mov	_P2,@r1
;	main.c:48: count = (count+1)%4;
	mov	r6,_count
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
;	main.c:49: if(!count)
	mov	a,r6
	mov	_count,a
;	main.c:50: key = read_Keyboard(); 
	jnz	00103$
	mov	psw,a
	lcall	_read_Keyboard
	mov	psw,#0x08
	mov	_key,dpl
00103$:
;	main.c:53: }
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
;------------------------------------------------------------
;	main.c:55: void main(){
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
;	main.c:56: a[0] = a[1] = a[2] = a[3] = 0xf; //燈號初始化
	mov	(_a + 0x0003),#0x0f
	mov	(_a + 0x0002),#0x0f
	mov	(_a + 0x0001),#0x0f
	mov	_a,#0x0f
;	main.c:59: TMOD = 0x81;
	mov	_TMOD,#0x81
;	main.c:60: TH0 = (char)((65536-FQ)>>8);
	mov	_TH0,#0xea
;	main.c:61: TL0 = (char)(65536-FQ);
	mov	_TL0,#0x84
;	main.c:62: EA = 1;
;	assignBit
	setb	_EA
;	main.c:63: ET0 = 1;
;	assignBit
	setb	_ET0
;	main.c:64: TR0 = 1;
;	assignBit
	setb	_TR0
;	main.c:67: unsigned char oldkey = 17;
	mov	r7,#0x11
;	main.c:68: while(1){
00106$:
;	main.c:69: if(key != oldkey){
	mov	a,r7
	cjne	a,_key,00122$
	sjmp	00106$
00122$:
;	main.c:70: oldkey = key;
	mov	r7,_key
;	main.c:71: if(key != 17){
	mov	a,#0x11
	cjne	a,_key,00123$
	sjmp	00106$
00123$:
;	main.c:72: a[3] = a[2];
	mov	r6,(_a + 0x0002)
	mov	(_a + 0x0003),r6
;	main.c:73: a[2] = a[1];
	mov	r6,(_a + 0x0001)
	mov	(_a + 0x0002),r6
;	main.c:74: a[1] = a[0];
	mov	r6,_a
	mov	(_a + 0x0001),r6
;	main.c:75: a[0] = key;
	mov	_a,_key
;	main.c:79: }
	sjmp	00106$
	.area CSEG    (CODE)
	.area CONST   (CODE)
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
