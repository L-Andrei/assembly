.code16 			    
.text 				    
.globl _start

_start:	
   movb num1, %al       #Move o valor da memoria para al
   movb %al, num2       #Move o valor de al para um novo espaço da memoria.
   movb $0, %al

   movb num2,%al

   #Imprime o valor do num2 para verificar se a mudança foi bem sucedida
print_value:
   movb num2,%al
   addb $48, %al
   movb $0x0e, %ah
   int $0x10


end:
    hlt
    jmp end

. = _start + 256
num1: .byte 5
num2: .byte 0


.byte 0x55		        
.byte 0xaa