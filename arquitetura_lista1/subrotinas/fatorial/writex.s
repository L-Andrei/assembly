.code16
.text
.globl _start

_start:
    movw $1, %ax                #Move 1 para ax                
    movb num1, %bl              #Move o valor de num1 para bx
    call fatorial               #Chama a subrotina para calcular o fatorial
    call print_result           #Chama a função para imprimir o resultado
    jmp end

    #Calcula o fatorial de um número
fatorial:
    cmp $0, %bl       #Verifica se bl é zero 
    je done             
    mul %bl           #Multiplica al por bl    
    dec %bl           #decrementa bl em -1
    jmp fatorial         

done:
    ret

    #Imprime o resultado
print_result:
    addb $48, %al
    movb $0x0e, %ah      
    movb %al, %dl        
    int $0x10             
    ret

end:
    hlt                   
    jmp end

. = _start + 128
num1: .byte 3

.byte 0x55
.byte 0xaa

