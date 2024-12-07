.code16 			    
.text 				    
.globl _start

_start:	
   movb $0b1, %al 
   movb $0b0, %bl

   andb %al, %bl #Compara os zeros e uns e realiza um and
   jz falso
   jmp verdadeiro

    #Subrotina que indica que o resultado é falso
falso:
    movb $0x0e, %ah
    movb $'F', %al
    int $0x10
    jmp end

    #Subrotina que indica que o resultado do and é verdadeiro.
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