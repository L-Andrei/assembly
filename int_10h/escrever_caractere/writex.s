.code16 			    
.text 				    
.globl _start

_start:
    call print
    jmp end

print:
    movb $'x',%al           #Move o caractere a ser imprimido para al
    movb $0x0e, %ah         #Inicia o serviço de impreção
    int $0x10               #Chama a interrupção de vídeo
    ret

end:
    hlt
    jmp end

. = _start + 128


.byte 0x55		        
.byte 0xaa
