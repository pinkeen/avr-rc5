# RC5 (36KHz Phillips protocol) Decoding library for AVR

Based on the idea presented by *Guy Carpenter* on [his site](http://deep.clearwater.com.au/rc5/).

## What does it do?

It decodes control codes produces by most of your household infrared remotes.

## What can run it?

Tested on __ATmega328P__ with __avr-gcc__ toolchain. Designed for 16MHz crystal.
Should work on the __ATmega{4/8/16/32}8__ (yes, that means Arduino too) family without modification.

Uses 16bit timer and an external interrupt.

I you use a different clock then adjust the timer prescaler and pulse lengths accordingly.

Should be trivial to adapt to other AVRs sporting a 16bit timer and an external interrupt.

## What do I need to run it?

The only additional component needed is an infrared receiver like __TSOP2236__ attached to PD2. Most of the 
standard receivers should work just fine.

## The docs

Check out the comments in headers/source. Example in `main.{c,h}` included.

## Does it work?

Yes, it does work flawlessly (at least for me). I built a project on it (*rlamp*) and never had any problems. The sensitivity achieved
with __TSOP2236__ was astounding. I could point the remote anywhere, metres from the receiver and it would pick up
the signal perfectly with every keypress.
 
Copyright &copy; 2011 Filip Sobalski <pinkeen@gmail.com>
