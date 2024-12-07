.code16
.text
.globl _start

# O código abaixo já realiza a ordenação e utiliza a pilha para passagem de paramentros para subrotinas.

_start:
    lea array, %si          # Aponta para o início do array
    movb tamanho, %cl       # Carrega o tamanho do array em cl
    dec %cl                 # Decrementa o contador de elementos (pois começa do índice 0)
    
    call bubble_sort        # Chama a função de ordenação Bubble Sort
    
    lea array, %si          # Aponta novamente para o início do array
    movb tamanho, %cl       # Carrega o tamanho do array
    call print_loop         # Imprime o array ordenado

    jmp end                 # Finaliza o programa

# Função Bubble Sort (ordem crescente)
bubble_sort:
    push %si                 # Salva si
    push %cx                 # Salva o tamanho
    movb tamanho, %bl       # Copia o tamanho em bl (para o loop interno)

outer_loop:
    xor %di, %di            # Zera o índice interno di
    lea array, %si          # Aponta novamente para o início do array
    movb %cl, %dl           # Copia o número de elementos restantes em dl

inner_loop:
    movb (%si), %al         # Carrega o valor atual em al
    movb 1(%si), %ah        # Carrega o próximo valor em ah
    cmpb %al, %ah           # Compara os dois valores
    jge no_swap             # Se al >= ah, não faz a troca

    # Troca os valores de al e ah
    xchg %al, %ah
    movb %al, (%si)         # Coloca o menor valor no primeiro
    movb %ah, 1(%si)        # Coloca o maior valor no segundo

no_swap:
    inc %si                 # Avança para o próximo par
    dec %dl                 # Decrementa o contador de elementos
    jnz inner_loop          # Repete o loop interno até o final

    dec %cl                 # Decrementa o contador de passagens
    jnz outer_loop          # Repete o loop externo até ordenar o array

    pop %cx                  # Restaura cl
    pop %si                  # Restaura si
    ret

# Função de impressão
print_loop:
    movb (%si), %al         # Carrega o valor atual em al
    addb $48, %al           
    mov $0x0e, %ah          # Configura o serviço de impressão
    int $0x10               # Chama a interrupção de vídeo

    inc %si                 # Incrementa si para o próximo elemento
    dec %cx                 # Decrementa o contador
    jnz print_loop          

    ret

end:
    hlt 

# Dados
array:  .byte 4, 2, 5, 3, 7  
tamanho: .byte 5             

.byte 0x55
.byte 0xaa
