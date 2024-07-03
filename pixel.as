#include vic20.h

; Save A
pha
; Save X
phx
; Save USER vector
ldx ptr_hi_USER
phx
ldx ptr_lo_USER
phx

; Set up USER pointer to VRAM
ldx page_VRAM
stx ptr_hi_USER
ldx #$00
stx ptr_lo_USER

; Print each character in the top-left corner
ldx #$00
nextchar:
txa
sta (ptr_lo_USER)
inx
bne nextchar

; Restore USER vector
plx
stx ptr_lo_USER
plx
stx ptr_hi_USER
; Restore X
plx
; Restore A
pla