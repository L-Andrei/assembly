.code16 			    
.text 				    
.globl _start

_start:
    movb $0x00, %ah         #Prepara al para ler um entrada de teclado do usuário
    int $0x16               #Interrupção que possibilita a realização da leitura.
    mov $0x0e, %ah          #Prepara para imprimir o valor de al
    int $0x10               #imprime o valor de al

end:
    hlt
    jmp end

. = _start + 128


.byte 0x55		        
.byte 0xaa
