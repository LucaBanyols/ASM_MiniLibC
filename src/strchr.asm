BITS 64                         ; setting architecture

SECTION .text                   ; start of coding part
GLOBAL strchr                   ; export strchr function

strchr:
    cmp byte[rdi], 0            ; compare rdi with 0 to see if the loop is over
        je not_in_rdi           ; if condition is true, go to not_in_rdi label
    cmp byte[rdi], sil          ; compare byte[rdi] = av[1] character to sil (av[2][0]: lower 8 bits)
        je return               ; if they are same, go to return label
    inc rdi                     ; rdi += 1
    jmp strchr                  ; looping by return on start of strchr label

return:
    mov rax, rdi                ; give restant characters of rdi (av[1]) to rax (return value)
    ret                         ; return rax value

not_in_rdi:
    cmp sil, 0                  ; check if sil (av[2][0]) == '\0'
        je ptr_to_terminator    ; if it's true, go to ptr_to_terminator label
    xor rax, rax                ; rax (return value) = NULL
    ret                         ; return rax value

ptr_to_terminator:
    mov rax, rdi                ; rax (return value) = pointer to the terminator
    ret                         ; return rax value
