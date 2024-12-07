.code16 			    
.text 				    
.globl _start

_start:
    movw $0, %bx

    #Subrotina que realiza o incremento e print de bx
contagem:
    addw $1,%bx             #Aumenta bx em 1
    movw %bx, %ax           #Move bx para ax
    cmpw $10,%bx            #Verifica se bx é 10
    je print_10
    
    #Realiza o print do número
print:
    addw $48, %ax           #Converte o número para o seu respectivo na tabela ascii.
    movb $0x0e, %ah         
    int $0x10
    movb $'\n', %al
    movb $0x0e, %ah
    int $0x10
    jmp contagem            #Volta para a contagem

    #Imprime o número de ao final da contagem até 9
print_10:       
    movb $'1' , %al
    movb $0x0e, %ah
    int $0x10
    movb $'0', %al
    movb $0x0e, %ah
    int $0x10

end:
    hlt
    jmp end

. = _start + 128


.byte 0x55		        
.byte 0xaa
