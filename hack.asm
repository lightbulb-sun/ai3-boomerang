.memorymap
defaultslot 0
slotsize $2000
slot 0 $8000
slot 1 $a000
slot 2 $c000
slot 3 $e000
.endme

.rombankmap
bankstotal 145
banksize $10
banks 1
banksize $2000
banks 16
banksize $400
banks 128
.endro

.background "adventureisland3.nes"

.equ    CUR_DIRECTION           $7b
.equ    DIRECTION_RIGHT         1
.equ    BOOMERANG_ANGLE_LEFT    $00
.equ    BOOMERANG_ANGLE_RIGHT   $80

.bank 14 slot 1
.orga $b23b
        jsr     my_code

.bank 16 slot 3
.orga $fe80
my_code:
.check_if_facing_right
        lda     CUR_DIRECTION
        and     #DIRECTION_RIGHT
        beq     .facing_left
.facing_right
        lda     #BOOMERANG_ANGLE_RIGHT
        jmp     .the_end
.facing_left
        lda     #BOOMERANG_ANGLE_LEFT
.the_end
        ; replace original instruction
        sta     $0692
        rts
