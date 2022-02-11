BITS 64                         ; setting architecture

SECTION .text                   ; start of coding part
GLOBAL rindex                   ; export this rindex function

rindex:
    mov rcx, 0                  ; initialisation of rcx (counter) to zero

while:
    cmp byte[rdi], 0            ; compare rdi with 0 to see if the loop is over
        je end_rdi              ; if condition is true, go to end_rdi label
    cmp byte[rdi], sil          ; compare byte[rdi] = av[1] character to sil (av[2][0]: lower 8 bits)
        je occur_find           ; if they are same, go to occur_find label
    inc rdi                     ; rdi += 1
    jmp while                   ; looping by return on start of strchr label

occur_find:
    mov rcx, rdi                ; rcx (counter) = rdi (av[1]) to stock occurence inside
    inc rdi                     ; rdi += 1
    jmp while                   ; return on top of while label
    
end_rdi:
    cmp sil, 0                  ; check if sil (av[2][0]) == '\0'
    je ptr_to_terminator        ; if it's true, go to ptr_to_terminator label
    cmp rcx, 0                  ; compare rcx (stocked occurence) to 0 to see if an occurence was found
        jne return              ; if there is an occurence (rcx != 0), go to return label
    xor rax, rax                ; rax (return value) = NULL
    ret                         ; return rax value

return:
    mov rax, rcx                ; give restant characters of rdi (av[1]) to rax (return value)
    ret                         ; return rax value
    
ptr_to_terminator:
    mov rax, rdi                ; rax (return value) = pointer to the terminator
    ret                         ; return rax value
