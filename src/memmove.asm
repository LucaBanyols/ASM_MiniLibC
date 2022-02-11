BITS 64                         ; setting architecture

%define tmp al                  ; define tmp macro = al (lower 8 bit character of rax), to make the code more clear

SECTION .text                   ; start of coding part
GLOBAL memmove                  ; export this memmove function

memmove:
    xor rax, rax                ; init rax (return value) to NULL
    mov rcx, 0                  ; init rcx (counter) to 0

while:
    cmp rcx, rdx                ; compare rcx (counter) to rdx (av[3])
    je return                   ; if they are equal, go to return label
    mov tmp, byte[rsi + rcx]    ; character tmp value = byte[rsi + rcx] (av[2][rcx])
    mov byte[rdi + rcx], tmp    ; byte[rdi + rcx] (av[1][rcx]) = tmp (av[2][rcx])
    inc rcx                     ; rcx (counter) += 1
    jmp while                   ; looping by return on the top of while label

return:
    mov rax, rdi                ; rax (return value) = rdi (av[1])
        ret                     ; return rax value
