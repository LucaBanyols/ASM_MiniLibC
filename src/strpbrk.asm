BITS 64                         ; setting architecture

SECTION .text                   ; start of coding part
GLOBAL strpbrk                  ; export this strpbrk function

strpbrk:
    xor rax, rax                ; init rax (return value) to NULL
    ret                         ; return rax value
