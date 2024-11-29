.code16 			    
.text 				    
.globl _start

_start:
    lea str1, %si
    lea str2, %di
    call copiar
    lea str1, %si
    lea str2, %di
    call comparar
    call print_string
    jmp end

copiar:
    movb (%si), %al
    movb %al,(%di)

    inc %si
    inc %di
    
    cmpb $0, %al
    
    je copiar_end
    jmp copiar

copiar_end:
    ret

comparar:
    movb (%si), %al 
    movb (%di), %ah 
    cmpb $0, %al   
    je comparar_pt2 

    cmpb %al, %ah 
    jne diferente  
    inc %si   
    inc %di  
    jmp comparar  

comparar_pt2:
    cmpb $0, %ah     
    jne diferente 
    jmp igual        

diferente:
    movb $'F', %al      
    movb $0x0e, %ah    
    int $0x10      
    ret 

igual:
    movb $'V', %al  
    movb $0x0e, %ah    
    int $0x10             
    ret                    


print_string:   
    lea str2, %si

print_string_pt2:
    movb (%si),%al
    movb $0x0e, %ah
    int $0x10

    inc %si

    cmpb $0, (%si)
    je print_string_end
    jmp print_string_pt2

print_string_end:
    ret

end:
    hlt

. = _start + 128
str1: .ascii "teste\0"
str2: .ascii "teste\0"


.byte 0x55		        
.byte 0xaa
