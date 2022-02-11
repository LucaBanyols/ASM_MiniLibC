BITS 64                     ; setting architecture

SECTION .text               ; start of coding part
GLOBAL strlen               ; export this strlen function

strlen:
    xor rax, rax            ; init rax at NULL
    
while:
    cmp byte[rdi], 0        ; byte[rdi (av[1] characters) compared to 0
        je return           ; if equation cmp is equal, go to return label, else continue strl
    inc rax                 ; rax (return value) += 1
    inc rdi                 ; rdi (av[1]) += 1
    jmp while               ; looping while label (retrurn to the start of the label)

return:
    ret                     ; return rax value
