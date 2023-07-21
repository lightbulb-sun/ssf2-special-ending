    org 0
    incbin "ssf2.md"

    ; skip checksum check
    org $3be6
            nop

    ; make the game think you're on difficulty 7
    ; for the decision tree that determines the type of ending
    org $c416
            moveq       #7, d1
            nop

    org $c44e
            jsr         my_code

    ; increment the real difficulty, not the difficulty 7 from above
    org $8c000
my_code:
            move.b      $fffce6, d1
            addq.b      #1, d1
            cmpi.b      #8, d1
            rts
