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
.equ    DIRECTION_LEFT          1
.equ    BOOMERANG_ANGLE_RIGHT   $80

.bank 14 slot 1
.orga $b23b
        jsr     my_code

.bank 16 slot 3
.orga $fe80
my_code:
.check_if_facing_left
        lda     CUR_DIRECTION
        and     #DIRECTION_LEFT
        beq     .the_end
.facing_right
        lda     #BOOMERANG_ANGLE_RIGHT
.the_end
        ; replace original instruction
        sta     $0692
        rts
