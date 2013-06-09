#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <stdint.h>
#include <stdlib.h>

#include "main.h"
#include "rc5.h"

/* RC5 lib test
 * Attach a LED to PB5 */
int main()
{
    RC5_Init();
    
    /* Set PB5 to output */
    DDRB |= _BV(PB5);
    
    /* Enable interrupts */
    sei();
    
    for(;;)
    {
        uint16_t command;
                
        /* Poll for new RC5 command */
        if(RC5_NewCommandReceived(&command))
        {
            /* Reset RC5 lib so the next command
             * can be decoded. This is a must! */
            RC5_Reset();
            
            /* Toggle the LED on PB5 */
            PORTB ^= _BV(PB5);
            
            /* Do something with the command 
             * Perhaps validate the start bits and output
             * it via UART... */
            if(RC5_GetStartBits(command) != 3)
            {
                /* ERROR */
            }
            
            uint8_t toggle = RC5_GetToggleBit(command);
            uint8_t address = RC5_GetAddressBits(command);
            uint8_t cmdnum = RC5_GetCommandBits(command);
        }
    }
    
    return 0;
}
