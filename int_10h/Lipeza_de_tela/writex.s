.code16 			    
.text 				    
.globl _start

_start:
    call lipeza_de_tela
    jmp end

lipeza_de_tela:
    movb $0x06,%ah         # Serviço 06h: Rolar a tela para cima.
    movb $0, %al           # Número de linhas a rolar (0 significa toda a tela).
    movb $0x07, %bh        # Atributo do caractere (cor de fundo e texto para modo texto; 0x07 é branco sobre preto).
    movw $0, %cx           # Posição inicial (linha e coluna superior esquerda: 0x0000).
    movw $0x184F, %dx      # Posição final (linha e coluna inferior direita: 0x184F para 80x25).
    int $0x10              # Chama a interrupção 10h.
    ret

end:
    hlt
    jmp end

. = _start + 128


.byte 0x55		        
.byte 0xaa
