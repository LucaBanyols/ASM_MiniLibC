BITS 64                         ; setting architecture

SECTION .text                   ; start of coding part
GLOBAL memset                   ; export this memeset function

memset:
    xor rax, rax                ; init rax at NULL

while:
    cmp rax, rdx                ; compare rax (return value) to rdx (av[3])
    je return                   ; if they are equal, go to return label
    mov byte[rax + rdi], sil    ; transform byte[rax + rdi] (the character n°rax+rdi) in sil (av[2][0])
    inc rax                     ; rax += 1
    jmp while                   ; looping while label by return on it start
    
return:
    mov rax, rdi                ; rax (return value) = rdi (av[1])
    ret                         ; return rax value
