.code16 			    
.text 				    
.globl _start

_start:	

movw $5,%ax        #Move 5 para ax
movw $10,%bx       #Move 10 para bx

addw %ax, %bx      #Adiciona 5 em bx
movw %bx, %dx      #Move bx para dx para fins de debug.
   
end:
    hlt


. = _start + 256

.byte 0x55		        
.byte 0xaa