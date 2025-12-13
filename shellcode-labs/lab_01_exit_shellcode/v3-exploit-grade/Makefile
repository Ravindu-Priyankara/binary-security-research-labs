all: build

build:
	nasm -f elf64 exit.asm -o exit.o
	ld exit.o -o exit
	objcopy -O binary exit -j .text exit.bin
	xxd -p exit.bin > exit.hex
	gcc loader.c -o loader

clean:
	rm -f exit exit.o exit.bin exit.hex loader