BITS 64                         ; setting architecture

SECTION .text                   ; start of coding part
GLOBAL strncmp                  ; export this strncmp function

strncmp:
    cmp rdi, rsi                ; compare rdi (av[1]) with rsi (av[2])
    je return_equal             ; is result is equal, go to return_equal label
    jg return_superior          ; is rdi (av[1]) is superior, go to return_superior label
    jle return_inferior         ; is rdi (av[1]) is inferior, go to return_inferiror label

return_equal:
    mov rax, 0                  ; rax = 0
    ret                         ; return rax value

return_superior:
    mov rax, 1                  ; rax = 1
    ret                         ; return rax value

return_inferior:
    mov rax, -1                 ; rax = - 1
    ret                         ; return rax value
