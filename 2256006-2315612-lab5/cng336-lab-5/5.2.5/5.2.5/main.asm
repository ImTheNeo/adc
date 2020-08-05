

.include "m128def.inc"
.equ ones = 0xFF
.equ zeros = 0
.org 0x00
.cseg
.macro initstack
ldi r16,low(ramend)
out spl,r16
ldi r16,high(ramend)
out sph,r16
.endmacro
initstack

main:
ldi r16,zeros
sts ddrf,r16 ;portf is input for ADC
ldi r16,ones
out ddra,r16;
out ddrb,r16;A an B ports are now output

ldi r16, 0xA7;converter set up
out ADCSRA,r16;enabling adc in free running mode with clock 128

ldi r16, 0x00 
out ADMUX,r16;Vref set externally
a_d_c:			
sbi ADCSRA, ADSC;start conversion
cont:;polling here untill ADIF bit is set
sbis ADCSRA, ADIF;If ADIF set then conversion completed 
rjmp cont
sbi ADCSRA, ADIF;Clear ADIF flag
in r16,ADCL;load our value
out porta,r16;send to output port
in r16,ADCH;load higher bit
out portb,r16;send to output port
rjmp a_d_c;do it again

