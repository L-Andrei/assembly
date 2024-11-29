.code16 			    
.text 				    
.globl _start

_start:	

movw $5,%ax
movw $10,%bx

addw %ax, %bx
movw %bx, %dx 
   
end:
    hlt


. = _start + 256

.byte 0x55		        
.byte 0xaa