.code16 			    
.text 				    
.globl _start

_start:
    call texto
    jmp end

texto:
    movb $0x00, %ah
    int $0x16
    mov $0x0e, %ah
    int $0x10
    cmp $0x0d,%al
    je enter
    cmp $'.', %al
    je texto_end

    jmp texto

enter:
    movb $'\n', %al
    mov $0x0e, %ah
    int $0x10
    jmp texto

texto_end:
    ret

end:
    hlt
    jmp end

. = _start + 128


.byte 0x55		        
.byte 0xaa
