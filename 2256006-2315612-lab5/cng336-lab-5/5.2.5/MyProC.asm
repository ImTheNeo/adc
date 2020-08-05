
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;MyProC.c,1 :: 		int main (void)
;MyProC.c,3 :: 		DDRA = 0xFF;
	LDI        R27, 255
	OUT        DDRA+0, R27
;MyProC.c,4 :: 		DDRB = 0xFF;
	LDI        R27, 255
	OUT        DDRB+0, R27
;MyProC.c,5 :: 		DDRF = 0;
	LDI        R27, 0
	STS        DDRF+0, R27
;MyProC.c,6 :: 		ADCSRA = 0xA7;
	LDI        R27, 167
	OUT        ADCSRA+0, R27
;MyProC.c,7 :: 		ADMUX = 0x00;
	LDI        R27, 0
	OUT        ADMUX+0, R27
;MyProC.c,8 :: 		while (1){
L_main0:
;MyProC.c,9 :: 		ADCSRA |= (1<<ADSC);
	IN         R27, ADCSRA+0
	SBR        R27, 64
	OUT        ADCSRA+0, R27
;MyProC.c,10 :: 		while((ADCSRA&(1<<ADIF))==0);
L_main2:
	IN         R16, ADCSRA+0
	ANDI       R16, 16
	CPI        R16, 0
	BREQ       L__main5
	JMP        L_main3
L__main5:
	JMP        L_main2
L_main3:
;MyProC.c,11 :: 		PORTA = ADCL;
	IN         R16, ADCL+0
	OUT        PORTA+0, R16
;MyProC.c,12 :: 		PORTB = ADCH;
	IN         R16, ADCH+0
	OUT        PORTB+0, R16
;MyProC.c,13 :: 		}
	JMP        L_main0
;MyProC.c,15 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
