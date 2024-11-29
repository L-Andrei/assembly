.code16 			    
.text 				    
.globl _start

_start:
    lea numeros, %si     
    movw tamanho, %cx    
    xor %ax, %ax         
    xor %bx, %bx          

soma_array:
    addw (%bx, %si), %ax   
    addw $2, %bx            
    loop soma_array         

print_valor:   

   movw %ax , resultado 
   movw $0 , %ax
   movw resultado, %ax
   addw $48 , %ax 

   movb $0x0e, %ah
   int $0x10

end:
    hlt
    jmp end

. = _start + 256
numeros: .word 1, 2, 3, 3    
tamanho: .word 4                     
resultado: .word 0 


.byte 0x55		        
.byte 0xaa