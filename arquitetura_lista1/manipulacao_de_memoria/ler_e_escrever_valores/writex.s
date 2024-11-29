.code16 			    
.text 				    
.globl _start

_start:	
   movb num1, %al
   movb %al, num2
   movb $0, %al

   movb num2,%al

print_value:
   movb num2,%al
   add $48, %al
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