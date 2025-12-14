all: build

build:
	nasm -f elf64 write.asm -o write.o
	ld write.o -o write
	objcopy -O binary write -j .text write.bin
	xxd -p write.bin > write.hex
	gcc loader.c -o loader

clean:
	rm -f write write.o write.bin write.hex loader