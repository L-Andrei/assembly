.code16 			    
.text 				    
.globl _start

_start:
    movb $0x00, %ah
    int $0x16
    mov $0x0e, %ah
    int $0x10

end:
    hlt
    jmp end

. = _start + 128


.byte 0x55		        
.byte 0xaa
