;;
;; EPITECH PROJECT, 2020
;; memcpy.asm
;; File description:
;; minilibC: memcpy
;;

bits 64

section .text
    global memcpy

    memcpy:
        mov rax, rdi                ; moving rdi's content into rax to return it later

    .loop:                          ; copying rdx bytes from rsi to rdi, starting with the last one
        cmp rdx, 0                  ; is rdx 0 yet ?
        je .return                  ; if so, go to the .return label
        dec rdx                     ; else, decrement rdx
        mov r8b, byte [rsi + rdx]   ; copying current byte of the source to r8b
        mov byte [rdi + rdx], r8b   ; copying r8b to current byte of the destination
        jmp .loop                   ; go to the .loop label to handle the previous byte

    .return:
        ret                         ; returning rax's value