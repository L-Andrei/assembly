.code16 			    
.text 				    
.globl _start

_start:
    movw num1,%ax                   #Move o num1 para ax
    call verifica_par               #Chama a subrotina para verificar se ax é par
    movw num2,%ax
    call verifica_par
    jmp end

verifica_par:
    movw $2, %bx                    #Move 2 para bx
    divw %bx                        #Divide ax por bx, se gerar resto ele ficará em dx
    cmp $0, %dx                     #Verifica se existe resto em dx
    je eh_par
    jg nao_eh_par
    jl erro

erro:
    movb $'e', %al
    movb $0x0e, %ah
    int $0x10
    ret

    #Subrotina que imprime p se for par
eh_par:
    movb $'p', %al 
    movb $0x0e, %ah
    int $0x10
    ret

    #Subrotina que imprime i se não for par
nao_eh_par:
    movb $'i', %al
    movb $0x0e, %ah
    int $0x10
    ret

end:
    hlt
    jmp end

. = _start + 128
num1: .byte 5
num2: .byte 6


.byte 0x55		        
.byte 0xaa
