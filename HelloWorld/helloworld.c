#define NO_BIT_DEFINES
#include <pic14regs.h>
#include <stdint.h>

__code uint16_t __at (_CONFIG) __configword = \
  _INTRC_OSC_NOCLKOUT & _WDTE_OFF;

#define LED_PORT PORTCbits.RC0
#define LED_TRIS TRISCbits.TRISC0

// uncalibrated delay, just waits a number of for-loop iterations
void delay(uint16_t iterations)
{
  uint16_t i;
  for (i = 0; i < iterations; i++) {
    // prevent this loop from being optimized away.
    __asm nop __endasm;
  }
}

void main(void)
{
  LED_TRIS = 0; // pin as output
  LED_PORT = 0; // LED off

  while (1) {
    LED_PORT = 1;
    delay(30000); // ~500ms @ 4Mhz
    LED_PORT = 0;
    delay(30000);
  }
}
