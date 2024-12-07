.code16 			    
.text 				    
.globl _start

_start:	
   movb $0b11111111, %al    #Move um binario para al
   movb $0b00000000, %bl    #Move outro binário para bl

   notb %bl #inverte os bit de bl

   xorb %al, %bl #verifica se existe bits iguais
   
   jz falso
   jmp verdadeiro

    #Subrotina que imprime F de falso caso o resultado do xor seja falso
falso:
    movb $0x0e, %ah
    movb $'F', %al
    int $0x10
    jmp end

    #Subrotina que imprime V de verdadeiro caos o resultado do xor seja verdadeiro.
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