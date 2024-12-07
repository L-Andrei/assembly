.code16 			    
.text 				    
.globl _start

_start:
    lea str1, %si               #Carrega o endereço da string 1.
    lea str2, %di               #Carrega o endereço da string 2.
    call concatenar
    call print_string
    jmp end               

concatenar:
    movb (%si), %al             #Lê o byte atual de str1 no registrador %al.

    cmpb $0,%al                 #Verifica se o byte atual não é "\0"
    je concatenar_pt2

    inc %si                     #Avança para a proxima letra da string

    jmp concatenar

concatenar_pt2:
    movb (%di), %ah             #Lê o byte atual de str2 no registrador ah.
    movb %ah, (%si)             #Escreve o byte de str2 na posição atual de str1.

    cmpb $0, %ah                 #Verifica se o byte atual não é "\0"
    je concatenar_end

    inc %di                     #Incrementa di para avançar ao próximo caractere de str2.
    inc %si                     #Incrementa si para avançar na posição final de str1.

    jmp concatenar_pt2
    
concatenar_end:
    ret

print_string:   
    lea str1, %si               #Carrega o endereço de memoria de str1 em si

print_string_pt2:
    movb (%si),%al              #Move o valor do endereço de si para al
    movb $0x0e, %ah
    int $0x10                   #Realiza o print desse valor.

    inc %si                     #Avança para a próxima letra de str1.

    cmpb $0, (%si)              #Verifica se a string não acabou.
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
