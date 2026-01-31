ASM=dasm

.PHONY: 
all: cartridge.bin

cartridge.bin: cartridge.s
	$(ASM) $^ -f3 -ocartridge.bin

.PHONY:
clean:
	-rm -f *.bin

.PHONY:
run: cartridge.bin
	atari800 -ntsc -cart cartridge.bin -cart-type 2
