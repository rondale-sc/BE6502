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

; ---
  lda #%00111000 ; Set 8-bit mode, 2 line display, and 5/8 font
  sta PORTB

  lda #0         ; Clear RS/RW/E bits
  sta PORTA
  lda #E
  sta PORTA      ; Set E bit to send instructions (enable pin)
  lda #0         ; Clear RS/RW/E bits
  sta PORTA

; ---
  lda #%00001110 ; Display on, cursor on, blink off
  sta PORTB

  lda #0         ; Clear RS/RW/E bits
  sta PORTA
  lda #E
  sta PORTA      ; Set E bit to send instructions (enable pin)
  lda #0         ; Clear RS/RW/E bits
  sta PORTA

; ---
  lda #%00000110 ; Increment and shift cursor each character (don't shift entire display)
  sta PORTB

  lda #0         ; Clear RS/RW/E bits
  sta PORTA
  lda #E
  sta PORTA      ; Set E bit to send instructions (enable pin)
  lda #0         ; Clear RS/RW/E bits
  sta PORTA

loop:
; ---
  lda #"H"
  sta PORTB
  lda #RS         ; Clear RW/E but set RS - to send to data register
  sta PORTA
  lda #(RS | E)
  sta PORTA      ; Set Enable pin high, keep RS high
  lda #RS         ; Clear RW/E but set RS
  sta PORTA

; ---
  lda #"e"
  sta PORTB
  lda #RS         ; Clear RW/E but set RS - to send to data register
  sta PORTA
  lda #(RS | E)
  sta PORTA      ; Set Enable pin high, keep RS high
  lda #RS         ; Clear RW/E but set RS
  sta PORTA

; ---
  lda #"l"
  sta PORTB
  lda #RS         ; Clear RW/E but set RS - to send to data register
  sta PORTA
  lda #(RS | E)
  sta PORTA      ; Set Enable pin high, keep RS high
  lda #RS         ; Clear RW/E but set RS
  sta PORTA

; ---
  lda #"l"
  sta PORTB
  lda #RS         ; Clear RW/E but set RS - to send to data register
  sta PORTA
  lda #(RS | E)
  sta PORTA      ; Set Enable pin high, keep RS high
  lda #RS         ; Clear RW/E but set RS
  sta PORTA

; ---
  lda #"o"
  sta PORTB
  lda #RS         ; Clear RW/E but set RS - to send to data register
  sta PORTA
  lda #(RS | E)
  sta PORTA      ; Set Enable pin high, keep RS high
  lda #RS         ; Clear RW/E but set RS
  sta PORTA

; ---
  lda #" "
  sta PORTB
  lda #RS         ; Clear RW/E but set RS - to send to data register
  sta PORTA
  lda #(RS | E)
  sta PORTA      ; Set Enable pin high, keep RS high
  lda #RS         ; Clear RW/E but set RS
  sta PORTA

; ---
  lda #"W"
  sta PORTB
  lda #RS         ; Clear RW/E but set RS - to send to data register
  sta PORTA
  lda #(RS | E)
  sta PORTA      ; Set Enable pin high, keep RS high
  lda #RS         ; Clear RW/E but set RS
  sta PORTA

; ---
  lda #"o"
  sta PORTB
  lda #RS         ; Clear RW/E but set RS - to send to data register
  sta PORTA
  lda #(RS | E)
  sta PORTA      ; Set Enable pin high, keep RS high
  lda #RS         ; Clear RW/E but set RS
  sta PORTA

; ---
  lda #"r"
  sta PORTB
  lda #RS         ; Clear RW/E but set RS - to send to data register
  sta PORTA
  lda #(RS | E)
  sta PORTA      ; Set Enable pin high, keep RS high
  lda #RS         ; Clear RW/E but set RS
  sta PORTA

; ---
  lda #"l"
  sta PORTB
  lda #RS         ; Clear RW/E but set RS - to send to data register
  sta PORTA
  lda #(RS | E)
  sta PORTA      ; Set Enable pin high, keep RS high
  lda #RS         ; Clear RW/E but set RS
  sta PORTA

; ---
  lda #"d"
  sta PORTB
  lda #RS         ; Clear RW/E but set RS - to send to data register
  sta PORTA
  lda #(RS | E)
  sta PORTA      ; Set Enable pin high, keep RS high
  lda #RS         ; Clear RW/E but set RS
  sta PORTA

  jmp loop

  .org $FFFC
  .word reset
  .word $0000
