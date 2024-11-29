.code16 			    
.text 				    
.globl _start

_start:	
   movb $0b11111111, %al
   movb $0b00000000, %bl

   notb %bl #inverte os bit de bl

   xorb %al, %bl #verifica se existe bits iguais
   
   jz falso
   jmp verdadeiro

falso:
    movb $0x0e, %ah
    movb $'F', %al
    int $0x10
    jmp end

verdadeiro:
    movb $0x0e, %ah
    movb $'V', %al
    int $0x10
    jmp end

end:
    hlt
    jmp end

. = _start + 256

.byte 0x55		        
.byte 0xaa