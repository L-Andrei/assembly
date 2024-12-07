.code16 			    
.text 				    
.globl _start

_start:
    call movimenta_cursor
    jmp end

movimenta_cursor:

    movb $0x02, %ah        # Serviço 02h: Posicionar o cursor
    movb $0x00, %bh        # Número da página de vídeo
    movb $10, %dh          # Linha desejada
    movb $20, %al          # Coluna desejada
    int $0x10            # Chama a interrupção 10h

    ret

end:
    hlt
    jmp end

. = _start + 128


.byte 0x55		        
.byte 0xaa
