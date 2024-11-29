.code16
.text
.globl _start

_start:
    movw $1, %ax            
    movb num1, %bl     
    call fatorial       
    call print_result    
    jmp end

fatorial:
    cmp $0, %bl        
    je done             
    mul %bl               
    dec %bl           
    jmp fatorial         

done:
    ret

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

