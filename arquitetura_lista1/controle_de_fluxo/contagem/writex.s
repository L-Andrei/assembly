.code16 			    
.text 				    
.globl _start

_start:
    movw $0, %bx

contagem:
    addw $1,%bx
    movw %bx, %ax
    cmpw $10,%bx
    je print_10
    

print:
    addw $48, %ax
    movb $0x0e, %ah
    int $0x10
    movb $'\n', %al
    movb $0x0e, %ah
    int $0x10
    jmp contagem

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
