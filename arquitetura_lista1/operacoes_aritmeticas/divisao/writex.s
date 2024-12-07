.code16 			    
.text 				    
.globl _start

_start:	
   movw $50, %ax
   movb $10, %bl

   divw %bx                 #Divide ax por bx e guarda o resultado em ax e resto da divisão em dx.
   movw %ax,%bx
    
end:
    hlt
    jmp end

. = _start + 256

.byte 0x55		        
.byte 0xaa