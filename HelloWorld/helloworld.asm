;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11525 (Linux)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"helloworld.c"
	list	p=16f690
	radix dec
	include "p16f690.inc"
;--------------------------------------------------------
; config word(s)
;--------------------------------------------------------
	__config 0x3ff4
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_TRISCbits
	extern	_PORTCbits
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_main
	global	_delay

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0070
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_helloworld_0	udata
r0x1001	res	1
r0x1000	res	1
r0x1002	res	1
r0x1003	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; initialized absolute data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_helloworld	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _delay
;   _delay
;   _delay
;   _delay
;1 compiler assigned register :
;   STK00
;; Starting pCode block
S_helloworld__main	code
_main:
; 2 exit points
;	.line	23; "helloworld.c"	LED_TRIS = 0; // pin as output
	BANKSEL	_TRISCbits
	BCF	_TRISCbits,0
;	.line	24; "helloworld.c"	LED_PORT = 0; // LED off
	BANKSEL	_PORTCbits
	BCF	_PORTCbits,0
_00126_DS_:
;	.line	27; "helloworld.c"	LED_PORT = 1; // pull up
	BANKSEL	_PORTCbits
	BSF	_PORTCbits,0
;	.line	28; "helloworld.c"	delay(30000); // ~500ms @ 4Mhz
	MOVLW	0x30
	MOVWF	STK00
	MOVLW	0x75
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	29; "helloworld.c"	LED_PORT = 0; // pull down
	BANKSEL	_PORTCbits
	BCF	_PORTCbits,0
;	.line	30; "helloworld.c"	delay(30000);
	MOVLW	0x30
	MOVWF	STK00
	MOVLW	0x75
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
	GOTO	_00126_DS_
;	.line	32; "helloworld.c"	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;5 compiler assigned registers:
;   r0x1000
;   STK00
;   r0x1001
;   r0x1002
;   r0x1003
;; Starting pCode block
S_helloworld__delay	code
_delay:
; 2 exit points
;	.line	12; "helloworld.c"	void delay(uint16_t iterations)
	BANKSEL	r0x1000
	MOVWF	r0x1000
	MOVF	STK00,W
	MOVWF	r0x1001
;	.line	15; "helloworld.c"	for (i = 0; i < iterations; i++) {
	CLRF	r0x1002
	CLRF	r0x1003
_00107_DS_:
	BANKSEL	r0x1000
	MOVF	r0x1000,W
	SUBWF	r0x1003,W
	BTFSS	STATUS,2
	GOTO	_00120_DS_
	MOVF	r0x1001,W
	SUBWF	r0x1002,W
_00120_DS_:
	BTFSC	STATUS,0
	GOTO	_00109_DS_
;;genSkipc:3307: created from rifx:0x7ffc0bc0a720
	nop	
;	.line	15; "helloworld.c"	for (i = 0; i < iterations; i++) {
	BANKSEL	r0x1002
	INCF	r0x1002,F
	BTFSC	STATUS,2
	INCF	r0x1003,F
	GOTO	_00107_DS_
_00109_DS_:
;	.line	19; "helloworld.c"	}
	RETURN	
; exit point of _delay


;	code size estimation:
;	   32+   11 =    43 instructions (  108 byte)

	end
