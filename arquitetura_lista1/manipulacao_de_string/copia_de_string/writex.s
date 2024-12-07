.code16 			    
.text 				    
.globl _start

_start:
    lea str1, %si               #Carrega o endereço da string 1.
    lea str2, %di               #Carrega o endereço da string 2.
    call copiar
    lea str1, %si
    lea str2, %di
    call comparar
    call print_string
    jmp end

    #Copia um string para a outra.
copiar:
    movb (%si), %al         #Move a letra de si para al
    movb %al,(%di)          #Move a letra de al para di

    inc %si                 #Avança para a próxima letra da palavra.
    inc %di
    
    cmpb $0, %al            #Verifica se apalavra não chegou ao final.
    
    je copiar_end
    jmp copiar

copiar_end:
    ret

comparar:              
    movb (%si), %al     # Carrega o byte atual da string apontada por %si no registrador %al.
    movb (%di), %ah     # Carrega o byte atual da string apontada por %di no registrador %ah.
    cmpb $0, %al        # Compara o caractere de si com o terminador nulo "\0".
    je comparar_pt2     # Se o caractere de %si for nulo, salta para comparar_pt2.

    cmpb %al, %ah       # Compara o caractere atual de al com o de ah.
    jne diferente       # Se os caracteres forem diferentes, salta para o rótulo `diferente`.
    inc %si             # Incrementa si para avançar para o próximo caractere da str1.
    inc %di             # Incrementa di para avançar para o próximo caractere da str2.
    jmp comparar        # Repete o processo para os próximos caracteres.

comparar_pt2:          
    cmpb $0, %ah        # Verifica se o caractere atual da string apontada por di é nulo.
    jne diferente       # Se di não encontrou um terminador nulo, salta para diferente.
    jmp igual           # Se ambos os caracteres forem nulos, salta para igual.
       

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

    #Subrotinas que realizão a impreção da str2
print_string:   
    lea str2, %si

print_string_pt2:
    movb (%si),%al                      #Move a letra atual para al
    movb $0x0e, %ah                     #Prepara para impreção
    int $0x10                           #imprime o valor

    inc %si                             #Avança para a próxima letra

    cmpb $0, (%si)                      #Verifica se a str2 chegou no final.
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
