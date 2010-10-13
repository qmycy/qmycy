# This is a mcu drive a 74HC595 chip program

CC = sdcc
CFLAGS = -c
LDFLAGS = 
main.hex : main.ihx
	packihx $< >$@
main.ihx : main.rel 74xx595.rel
	$(CC) $(LDFLAGS) -o $@ $^

74xx595.rel : 74xx595.c
	$(CC) $(CFLAGS) $<

main.rel : main.c
	$(CC) $(CFLAGS) $<

clean :
	del *.rel
	del *.ihx
	del *.hex
	del *.lnk
	del *.lst
	del *.map
	del *.mem
	del *.rst
	del *.sym
	del *.asm