int main (void)
{
DDRA = 0xFF;
DDRB = 0xFF;
DDRF = 0;
ADCSRA = 0xA7;
ADMUX = 0x00;
while (1){
ADCSRA |= (1<<ADSC);
while((ADCSRA&(1<<ADIF))==0);
PORTA = ADCL;
PORTB = ADCH;
}
 return 0;
}