.code16 			    
.text 				    
.globl _start

_start:
    lea numeros, %si     #Carague o endereço do primeiro numero do array
    movw tamanho, %cx    #Carrega o tamanho do array
    xor %ax, %ax         #Limpa ax
    xor %bx, %bx         #Limpa bx 

soma_array:
    addw (%bx, %si), %ax   #Adiciona um número do array em ax
    addw $2, %bx           #Avança para o proximo número do array 
    loop soma_array         

    #impime o resultado da soma dos números do array
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