.code16 			    
.text 				    
.globl _start

_start:
    lea str1, %si
    lea str2, %di
    call concatenar
    call print_string
    jmp end               

concatenar:
    movb (%si), %al

    cmpb $0,%al
    je concatenar_pt2

    inc %si

    jmp concatenar

concatenar_pt2:
    movb (%di), %ah
    movb %ah, (%si)

    cmpb $0, %ah
    je concatenar_end

    inc %di
    inc %si

    jmp concatenar_pt2
    
concatenar_end:
    ret

print_string:   
    lea str1, %si

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
