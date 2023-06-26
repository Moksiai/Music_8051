;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module LED_Display
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _LED_Display_PARM_3
	.globl _LED_Display_PARM_2
	.globl _led_0_to_f
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
	.globl _LED_Display
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
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
_LED_Display_PARM_2:
	.ds 1
_LED_Display_PARM_3:
	.ds 1
_LED_Display_LED_65536_2:
	.ds 3
_LED_Display_i_131072_10:
	.ds 2
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
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'LED_Display'
;------------------------------------------------------------
;oldKey                    Allocated with name '_LED_Display_PARM_2'
;key                       Allocated with name '_LED_Display_PARM_3'
;LED                       Allocated with name '_LED_Display_LED_65536_2'
;i                         Allocated to registers r3 r4 
;j                         Allocated to registers r1 r2 
;i                         Allocated to registers r3 r4 
;j                         Allocated to registers r1 r2 
;i                         Allocated to registers r3 r4 
;j                         Allocated to registers r1 r2 
;i                         Allocated with name '_LED_Display_i_131072_10'
;j                         Allocated to registers r0 r1 
;------------------------------------------------------------
;	LED_Display.c:21: void LED_Display(LED_Display_struct *LED,char oldKey,char key) {
;	-----------------------------------------
;	 function LED_Display
;	-----------------------------------------
_LED_Display:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	mov	_LED_Display_LED_65536_2,dpl
	mov	(_LED_Display_LED_65536_2 + 1),dph
	mov	(_LED_Display_LED_65536_2 + 2),b
;	LED_Display.c:24: LED_PORT = ~led_0_to_f[LED->_1];
	mov	r2,_LED_Display_LED_65536_2
	mov	r3,(_LED_Display_LED_65536_2 + 1)
	mov	r4,(_LED_Display_LED_65536_2 + 2)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	anl	a,#0x0f
	mov	r2,a
	mov	dptr,#_led_0_to_f
	movc	a,@a+dptr
	cpl	a
	mov	_P2,a
;	LED_Display.c:25: CONTROL_PORT = 0b0111;
	mov	_P1,#0x07
;	LED_Display.c:26: DELAY(10, 10);
	mov	r3,#0x00
	mov	r4,#0x00
00116$:
	clr	c
	mov	a,r3
	subb	a,#0x0a
	mov	a,r4
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00102$
	mov	r1,#0x00
	mov	r2,#0x00
00113$:
	clr	c
	mov	a,r1
	subb	a,#0x0a
	mov	a,r2
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00117$
	inc	r1
	cjne	r1,#0x00,00113$
	inc	r2
	sjmp	00113$
00117$:
	inc	r3
	cjne	r3,#0x00,00116$
	inc	r4
	sjmp	00116$
00102$:
;	LED_Display.c:27: LED_PORT = ~led_0_to_f[LED->_2];
	mov	r2,_LED_Display_LED_65536_2
	mov	r3,(_LED_Display_LED_65536_2 + 1)
	mov	r4,(_LED_Display_LED_65536_2 + 2)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	swap	a
	anl	a,#0x0f
	mov	r2,a
	mov	dptr,#_led_0_to_f
	movc	a,@a+dptr
	cpl	a
	mov	_P2,a
;	LED_Display.c:28: CONTROL_PORT = 0b1011;
	mov	_P1,#0x0b
;	LED_Display.c:29: DELAY(10, 10);
	mov	r3,#0x00
	mov	r4,#0x00
00122$:
	clr	c
	mov	a,r3
	subb	a,#0x0a
	mov	a,r4
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00104$
	mov	r1,#0x00
	mov	r2,#0x00
00119$:
	clr	c
	mov	a,r1
	subb	a,#0x0a
	mov	a,r2
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00123$
	inc	r1
	cjne	r1,#0x00,00119$
	inc	r2
	sjmp	00119$
00123$:
	inc	r3
	cjne	r3,#0x00,00122$
	inc	r4
	sjmp	00122$
00104$:
;	LED_Display.c:30: LED_PORT = ~led_0_to_f[LED->_3];
	mov	a,#0x01
	add	a,_LED_Display_LED_65536_2
	mov	r2,a
	clr	a
	addc	a,(_LED_Display_LED_65536_2 + 1)
	mov	r3,a
	mov	r4,(_LED_Display_LED_65536_2 + 2)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	anl	a,#0x0f
	mov	r2,a
	mov	dptr,#_led_0_to_f
	movc	a,@a+dptr
	cpl	a
	mov	_P2,a
;	LED_Display.c:31: CONTROL_PORT = 0b1101;
	mov	_P1,#0x0d
;	LED_Display.c:32: DELAY(10, 10);
	mov	r3,#0x00
	mov	r4,#0x00
00128$:
	clr	c
	mov	a,r3
	subb	a,#0x0a
	mov	a,r4
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00106$
	mov	r1,#0x00
	mov	r2,#0x00
00125$:
	clr	c
	mov	a,r1
	subb	a,#0x0a
	mov	a,r2
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00129$
	inc	r1
	cjne	r1,#0x00,00125$
	inc	r2
	sjmp	00125$
00129$:
	inc	r3
	cjne	r3,#0x00,00128$
	inc	r4
	sjmp	00128$
00106$:
;	LED_Display.c:33: LED_PORT = ~led_0_to_f[LED->_4];
	mov	a,#0x01
	add	a,_LED_Display_LED_65536_2
	mov	r2,a
	clr	a
	addc	a,(_LED_Display_LED_65536_2 + 1)
	mov	r3,a
	mov	r4,(_LED_Display_LED_65536_2 + 2)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	swap	a
	anl	a,#0x0f
	mov	dptr,#_led_0_to_f
	movc	a,@a+dptr
	mov	r1,a
	cpl	a
	mov	_P2,a
;	LED_Display.c:34: CONTROL_PORT = 0b1110;
	mov	_P1,#0x0e
;	LED_Display.c:35: DELAY(10, 10);
	clr	a
	mov	_LED_Display_i_131072_10,a
	mov	(_LED_Display_i_131072_10 + 1),a
00134$:
	clr	c
	mov	a,_LED_Display_i_131072_10
	subb	a,#0x0a
	mov	a,(_LED_Display_i_131072_10 + 1)
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00108$
	mov	r0,#0x00
	mov	r1,#0x00
00131$:
	clr	c
	mov	a,r0
	subb	a,#0x0a
	mov	a,r1
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00135$
	inc	r0
	cjne	r0,#0x00,00131$
	inc	r1
	sjmp	00131$
00135$:
	inc	_LED_Display_i_131072_10
	clr	a
	cjne	a,_LED_Display_i_131072_10,00134$
	inc	(_LED_Display_i_131072_10 + 1)
	sjmp	00134$
00108$:
;	LED_Display.c:37: if(key != oldKey && key != 17){// shift left
	mov	a,_LED_Display_PARM_2
	cjne	a,_LED_Display_PARM_3,00234$
	ret
00234$:
	mov	a,#0x11
	cjne	a,_LED_Display_PARM_3,00235$
	ret
00235$:
;	LED_Display.c:38: LED->_4 = LED->_3;
	mov	a,#0x01
	add	a,_LED_Display_LED_65536_2
	mov	r0,a
	clr	a
	addc	a,(_LED_Display_LED_65536_2 + 1)
	mov	r1,a
	mov	r7,(_LED_Display_LED_65536_2 + 2)
	mov	dpl,r0
	mov	dph,r1
	mov	b,r7
	lcall	__gptrget
	anl	a,#0x0f
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	swap	a
	anl	a,#(0xf0&0xf0)
	push	b
	push	acc
	lcall	__gptrget
	pop	b
	anl	a,#0x0f
	orl	a,b
	pop	b
	lcall	__gptrput
;	LED_Display.c:39: LED->_3 = LED->_2;
	mov	r4,_LED_Display_LED_65536_2
	mov	r5,(_LED_Display_LED_65536_2 + 1)
	mov	r6,(_LED_Display_LED_65536_2 + 2)
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	lcall	__gptrget
	swap	a
	anl	a,#0x0f
	mov	dpl,r0
	mov	dph,r1
	mov	b,r7
	anl	a,#0x0f
	push	b
	push	acc
	lcall	__gptrget
	pop	b
	anl	a,#0xf0
	orl	a,b
	pop	b
	lcall	__gptrput
;	LED_Display.c:40: LED->_2 = LED->_1;
	mov	r5,_LED_Display_LED_65536_2
	mov	r6,(_LED_Display_LED_65536_2 + 1)
	mov	r7,(_LED_Display_LED_65536_2 + 2)
	mov	r2,_LED_Display_LED_65536_2
	mov	r3,(_LED_Display_LED_65536_2 + 1)
	mov	r4,(_LED_Display_LED_65536_2 + 2)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	anl	a,#0x0f
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	swap	a
	anl	a,#(0xf0&0xf0)
	push	b
	push	acc
	lcall	__gptrget
	pop	b
	anl	a,#0x0f
	orl	a,b
	pop	b
	lcall	__gptrput
;	LED_Display.c:41: LED->_1 = key;
	mov	r5,_LED_Display_LED_65536_2
	mov	r6,(_LED_Display_LED_65536_2 + 1)
	mov	r7,(_LED_Display_LED_65536_2 + 2)
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,_LED_Display_PARM_3
	anl	a,#0x0f
	push	b
	push	acc
	lcall	__gptrget
	pop	b
	anl	a,#0xf0
	orl	a,b
	pop	b
;	LED_Display.c:46: }
	ljmp	__gptrput
	.area CSEG    (CODE)
	.area CONST   (CODE)
_led_0_to_f:
	.db #0xfc	; 252
	.db #0x0c	; 12
	.db #0xda	; 218
	.db #0xf2	; 242
	.db #0x66	; 102	'f'
	.db #0xb6	; 182
	.db #0x7a	; 122	'z'
	.db #0xe4	; 228
	.db #0xfe	; 254
	.db #0xf6	; 246
	.db #0xee	; 238
	.db #0x5a	; 90	'Z'
	.db #0x9c	; 156
	.db #0x5a	; 90	'Z'
	.db #0x9e	; 158
	.db #0x8e	; 142
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
