.code16 			    
.text 				    
.globl _start

_start:	

movb $5,%al
movb $5,%bl

mulb %bl

movw %ax, %dx
   
end:
    hlt
    jmp end

. = _start + 256

.byte 0x55		        
.byte 0xaa