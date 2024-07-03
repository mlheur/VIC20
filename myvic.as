#define ptr_pixelbase $FB
#define ptr_pixelhi   $FC
#define mem_colour    $FD
#define ptr_scratch   $FE

; VRAM starts at 7680 -> 0x1E00
;        ends at 8185 -> 0x1F99
prep_pixelbase_ptr:
lda #$00
sta ptr_pixelbase
lda #$1E
sta ptr_pixelhi

firstcolor:
lda #$00
sta mem_colour

firstpixel:
ldy #$00

nextcolor:
inc mem_colour
lda mem_colour

fillpixel:
sta (ptr_pixelbase),Y

; Test if we just filled 0x1F99
; We'll know this by ptr_pixelhi == 0x1F
; and Y == 0x99
test_was_last_pixel:
cpy #$99
bne nextpixel
lda #$1f
cmp ptr_pixelhi
beq nextcolor
lda mem_colour

nextpixel:
iny
bne fillpixel

wrappedY_inc_pixelhi:
inc ptr_pixelhi