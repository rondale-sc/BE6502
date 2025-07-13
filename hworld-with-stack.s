PORTB = $6000
PORTA = $6001
DDRB = $6002
DDRA = $6003

E = %10000000
RW = %01000000
RS = %00100000

  .org $8000

reset:
  lda #%11111111 ; set all pins on PORTB to output
  sta DDRB

  lda #%11100000 ; set top 3 pins on PORTA to output
  sta DDRA

  lda #%00111000 ; Set 8-bit mode, 2 line display, and 5/8 font
  jsr lcd_instruction
  lda #%00001110 ; Display on, cursor on, blink off
  jsr lcd_instruction
  lda #%00000110 ; Increment and shift cursor each character (don't shift entire display)
  jsr lcd_instruction
  lda #%00000001 ; Clear screen
  jsr lcd_instruction

  lda #"H"
  jsr print_char

  lda #"e"
  jsr print_char

  lda #"l"
  jsr print_char

  lda #"l"
  jsr print_char

  lda #"o"
  jsr print_char

  lda #","
  jsr print_char

  lda #" "
  jsr print_char

  lda #"w"
  jsr print_char

  lda #"o"
  jsr print_char

  lda #"r"
  jsr print_char

  lda #"l"
  jsr print_char

  lda #"d"
  jsr print_char

  lda #"!"
  jsr print_char

loop:
  jmp loop

lcd_instruction:
  sta PORTB
  lda #0         ; Clear RS/RW/E bits
  sta PORTA
  lda #E
  sta PORTA      ; Set E bit to send instructions (enable pin)
  lda #0         ; Clear RS/RW/E bits
  sta PORTA
  rts

print_char:
  sta PORTB
  lda #RS         ; Clear RW/E but set RS - to send to data register
  sta PORTA
  lda #(RS | E)
  sta PORTA      ; Set Enable pin high, keep RS high
  lda #RS         ; Clear RW/E but set RS
  sta PORTA
  rts

  .org $FFFC
  .word reset
  .word $0000
