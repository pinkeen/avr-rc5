AVRDUDE_MCU = m328p
AVRDUDE_PROGRAMMER = stk500v1
AVRDUDE_PORT = /dev/ttyACM0
AVRDUDE_BAUDRATE = 115200

AVRDUDE = avrdude
AVRDUDEOPTS =   -p $(AVRDUDE_MCU) \
        -c $(AVRDUDE_PROGRAMMER) \
        -P $(AVRDUDE_PORT) \
        -b $(AVRDUDE_BAUDRATE) \
        -F -D

FREQUENCY = 16000000
MCU = atmega328p
CC = avr-gcc
CFLAGS = -mmcu=$(MCU) -O2 -DF_CPU=$(FREQUENCY)L -Wall
OBJCOPY = avr-objcopy
OBJCOPYFLAGS = -j .text -j .data -O ihex 
PROJNAME = rc5
OBJECTS = main.o rc5.o
LD = avr-gcc
LDFLAGS = -mmcu=$(MCU)

all: $(PROJNAME).hex

$(PROJNAME).elf: $(OBJECTS) 
    $(LD) $(LDFLAGS) $(OBJECTS) -o $@

$(PROJNAME).hex: $(PROJNAME).elf
    $(OBJCOPY)  $(OBJCOPYFLAGS) $< $@

%.o: %.c %.h
    $(CC) $(CFLAGS) -c $< -o $@

upload: $(PROJNAME).hex
    $(AVRDUDE) $(AVRDUDEOPTS) -U flash:w:$<

rebuild: clean all

clean:
    $(RM) $(PROJNAME) *.o *.elf *.hex *~

.PHONY: clean rebuild
