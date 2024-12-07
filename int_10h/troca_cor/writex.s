.code16 			    
.text 				    
.globl _start

_start:
    call altera_cor
    jmp end

altera_cor:
    movb $0x09, %ah         #Prepara o serviço 9h
    movb $' ', %al          #Caractere: espaço (não altera o texto visível)
    movb $0x00, %bh         #Página de vídeo 0
    movb $0x1f, %bl         #Atributo: Fundo azul (1) e texto branco (F)
    movw $2000, %cx         #Número de caracteres a atualizar com as cores
    int $0x10               #Chama a interrupção de vídeo
    ret

end:
    hlt
    jmp end

. = _start + 128


.byte 0x55		        
.byte 0xaa
