# Atari 8-Bit Resources

## About

Projects for getting started with Atari 8-Bit machines. These should work
on the atari800 emulator (atari800 is a Debian package.) They should also
work on the Altirra emulator.

Each project is self-contained and has its own directory.

## Projects

* **minimal-cart-8k**

  Minimal, bootable skeleton for an 8KiB ROM cartridge.

* **minimal-cart-16k** 

  Minimal, bootable skeleton for a 16KiB ROM cartridge.

## Setup

This repo assumes Debian Linux. The following packages are required:

* build-essential (for Make, etc.)
* dasm (The assembler used in the tutorials.)
* atari800 (Atari 400/800 emulator.)

## Running Examples

The Makefiles in each directory have a **run** target, so to run, just type:

```bash
    make run
```

The **run** target runs the atari800 emulator with some options. The options
used in these examples are:

	atari800 -ntsc -cart cartridge.bin -cart-type 1

* -ntsc  This specifies running the emulator in NTSC (North American TV mode) and
         is necessary for display list interrupts to run, apparently (this may
         be a bug.)

* -cart  Specifies the cartridge binary to run.

* -cart-type (usually either 1 or 2.  1 for 8KiB carts, 2 for 16KiB carts)


 

## Author
dialtr@gmail.com
