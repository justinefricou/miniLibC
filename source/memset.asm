;;
;; EPITECH PROJECT, 2020
;; memset.asm
;; File description:
;; minilibC: memset
;;

bits 64

section .text
    global memset

    memset:
        mov rax, rdi           ; moving rdi's content into rax to return it later

    .loop:                     ; filling rdx bytes of rdi with sil, starting with the last one
        cmp rdx, 0             ; is rdx 0 yet ?
        je .return             ; if so, go to the .return label
        dec rdx                ; else, decrement rdx
        mov [rdi + rdx], sil   ; moving sil's value into the byte at address rdi + rdx
        jmp .loop              ; go to the .loop label to handle the previous byte

    .return:
        ret                    ; returning rax's value