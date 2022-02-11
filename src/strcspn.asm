BITS 64                         ; setting architecture

SECTION .text                   ; start of coding part
GLOBAL strcspn                  ; export this strcspn function

strcspn:
    xor rax, rax                ; init rax (return value) to NULL
    ret                         ; return rax value
