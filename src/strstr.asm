BITS 64                         ; setting architecture

SECTION .text                   ; start of coding part
GLOBAL strstr                   ; export this strstr function

strstr:
    mov rcx, 0                  ; initialisation of rcx (counter) to zero

while:
    cmp byte[rdi], 0            ; compare rdi with 0 to see if the loop is over
    je return_null              ; if condition is true, go to end_rdi label
    mov cl, byte[rsi]
    cmp byte[rdi], cl           ; compare byte[rdi] = av[1] character to sil (av[2][0]: lower 8 bits)
    je occur_find               ; if they are same, go to occur_find label    
    inc rdi                     ; rdi += 1
    jmp while                   ; looping by return on start of strchr label


occur_find:
    mov rcx, rdi                ; rcx (counter) = rdi (av[1])
    jmp occur_loop              ; go to start of occur_loop label

occur_loop:
    cmp rsi, 0                  ; compare rsi to 0
        je end_rsi              ; if they are equal, go to end_rsi
    mov cl, byte[rsi]           ; cl (tmp value) = byte[rsi] (av[2][0])
    cmp byte[rdi], cl           ; compare byte[rdi] (av[1][0]) with cl (tmp value)
        jne while               ; if they are inequal, go on the start of while label
    inc rdi                     ; rdi += 1
    inc rsi                     ; rsi += 1
    jmp occur_loop              ; looping by return on the start of occur_loop label

end_rsi:
    mov rax, rcx                ; rax (return value) = rcx (counter == rdi when = to rsi)
    ret                         ; return rax value

return_null:
    xor rax, rax                ; rax (return value) = NULL
    ret                         ; return rax value

