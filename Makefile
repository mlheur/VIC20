all: p.prg
	hexdump -C p.prg
	hexdump -C p.o

p.prg: p.o
	cat sys-1200-prg.bin p.o > p.prg

p.o: pixel.as vic20.h Makefile sys-1200-prg.bin
	xa -bt `printf %d 0x120e` -o p.o pixel.as