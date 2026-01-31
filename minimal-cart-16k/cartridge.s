;****************************************************************************
; Minimal Cartridge Demo (16KiB)                                            *
; Author: Tom Dial                                                          *
; Date: 2025-10-11                                                          *
;****************************************************************************

        ; What follows is the simplest possible program that will boot as a
        ; a cartridge on the Atari 400/800. The main thing to understand is
        ; that cartridges have a "header" section (which is actually stored
        ; at the end of the address range for the ROM cartridge) that tells
        ; the computer that a ROM cartridge is present, and where to jump to
        ; start. 
        ;
        ; There apparently were 8KiB cartridges and 16KiB cartridges
        ; that were standard for the Atari. This example demonstrates the
        ; setup for a 16KiB cartridge, which starts executing at address
        ; $8000. See the related example for the 8KiB cartridge, which is
        ; identical except that the starting address is $A000.
        ;
        ; This example assumes that you are using the DASM assmembler. If
        ; so, the command to build the cartridge binary is simply:
        ;
        ;     dasm cartridge.s -f3 -ocartridge.bin

        PROCESSOR 6502       ; DASM directive to generate 6502 code.

        ; Include Atari 400/800 hardware macros.
        .include "hardware.s"

        ORG $8000            ; Start address for 16KiB cartridges

main                    
        jmp main             ; Loop forever



;****************************************************************************
; Cartridge Header                                                          *
;****************************************************************************
 
        ; Atari 8-bit computers had either one or two slots for 8 KiB ROM
        ; cartridges: the RIGHT and LEFT slots, respectively. The RIGHT slot
        ; apparently maps into the range $8000-$9FFF, and the LEFT slot maps
        ; into the range $A000-$BFFF. However, these machines also supported
        ; 16KiB cartridges. In this case, the 16KiB cartridge would map into
        ; the range $8000-$BFFF.
        ;
        ; In either case, the last six bytes of the address range are used to
        ; specify information related to cartridge initialization. The first
        ; two bytes contain the LOW and the HIGH byte of the "cartridge start
        ; address". The third byte should be set to zero to indicate that a
        ; cartridge is present. Any non-zero value indicates: "no cartridge
        ; present." The fourth byte (the "option byte") is a bit field that
        ; enables boot options:
        ;   Bit 0: If 1, boot disk, 0 otherwise.
        ;   Bit 2: If 1, initialize+start cart, else initialize only.
        ;   Bit 7: If 1, cartridge is a special diagnostic cart.
        ;
        ; Bytes 5, 6 are the "cartridge initialization address." At the time
        ; of this writing, I do not quite understand the difference between 
        ; the "start address" and "initialization adddress".
 
 
        ORG $BFFA
        .byte $00           ; $BFFA - Cartridge start address (LOW)
        .byte $80           ; $BFFB - Cartrdige start address (HIGH)
        .byte $00           ; $BFFC - Zero for "cartridge present".
        .byte $02           ; $BFFD - Option byte
        .byte $00           ; $BFFE - Cartridge init address (LOW)
        .byte $80           ; $BFFF - Cartridge init address (HIGH)

