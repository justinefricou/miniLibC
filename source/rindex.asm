;;
;; EPITECH PROJECT, 2020
;; rindex.asm
;; File description:
;; minilibC: rindex
;;

bits 64

section .text
    global rindex

    rindex:
        xor rax, rax            ; Initializing rax's value to 0

    .loop:
        cmp byte [rdi], sil     ; Is rdi's current byte the char we're looking for?
        cmove rax, rdi          ; If so, copying rdi's value to rax
        cmp byte [rdi], byte 0  ; Is rdi's current byte 0?
        je .return              ; If so, got to the .return label
        inc rdi                 ; Else, increment rdi
        jmp .loop               ; Go to the .loop label to handle the next character


    .return:
        ret                     ; returning rax's value