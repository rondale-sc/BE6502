  .org $8000

reset:
  lda #$FF
  sta $6002

loop:
  lda #$55
  sta $6000

  lda #$AA
  sta $6000

  jmp loop

  .org $FFFC
  .word reset
  .word $0000
