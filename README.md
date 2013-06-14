# RC5 Decoding library for AVR

*36KHz Phillips protocol*

Based on the idea presented by *Guy Carpenter* on [his site](http://www.clearwater.com.au/rc5).

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

Yes, it does work flawlessly (at least for me). I built a project on it ([rlamp](https://github.com/pinkeen/rlamp)) and never had any problems. The sensitivity achieved
with __TSOP2236__ was astounding. I could point the remote anywhere, metres from the receiver and it would pick up
the signal perfectly with every keypress.

## Some notes

I found an old e-mail that I sent to to Guy Carpenter concerning his very insightful article. He didn't update his website so I am attaching parts of it here
in case it might be helpful:

> In a highly-constrained 8bit environment the clever trick with transition table and bit shifting saves a lot of cpu time (which is even more important if code is executed in interrupts) so the snippet you kindly provided is very relevant. Unfortunately I found a minor problem with it:
> * The two middle values in the transition table should be 0x91, 0x9b respectively
> * I think that it would be helpful for future viewers if you included information about event "IDs" (0 - short space, 2 - short pulse, 4 - long space, 6 - long pulse)
>
> [...]
>
> PS I found it crucial to continue decoding until "start1" is reached. Mid0 is reached naturally, however, the algorithm stops (emits last digit) at mid1 which prevents the last edge change from being processed. In certain situations this can lead to a permanent deadlock.

## LICENSE

Copyright &copy; 2011 Filip Sobalski <pinkeen@gmail.com>
avr-rc5 - RC5 Decoding library for AVR 

This file is part of avr-rc5.

Avr-rc5 is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.



[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/pinkeen/avr-rc5/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

