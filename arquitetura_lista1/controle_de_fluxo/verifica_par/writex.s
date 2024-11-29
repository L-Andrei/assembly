.code16 			    
.text 				    
.globl _start

_start:
    movw num1,%ax
    call verifica_par
    movw num2,%ax
    call verifica_par
    jmp end

verifica_par:
    movw $2, %bx
    divw %bx
    cmp $0, %dx
    je eh_par
    jg nao_eh_par
    jl erro

erro:
    movb $'e', %al
    movb $0x0e, %ah
    int $0x10
    ret

eh_par:
    movb $'p', %al 
    movb $0x0e, %ah
    int $0x10
    ret

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
