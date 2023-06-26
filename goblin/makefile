all: main.hex clean

main.hex: main.ihx
	packihx main.ihx > main.hex

main.ihx: main.c myIO.lib
	sdranlib myIO.lib
	sdcc main.c myIO.lib

myIO.lib: Keypad4x4.rel LED_Display.rel
	sdar -rc $@ $^

%.rel: %.c %.h
	sdcc -c $<	

clean : 
	rm *.ihx
	rm *.lk
	rm *.map
	rm *.rel
	rm *.rst
	rm *.sym