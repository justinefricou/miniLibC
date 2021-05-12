;;
;; EPITECH PROJECT, 2020
;; strlen.asm
;; File description:
;; minilibC: strlen
;;

bits 64

section .text
    global strlen

    strlen:
        push rcx                ; saving rcx's content into the stack
        xor rcx, rcx            ; initializing rcx to 0

    .loop:                      ; going through the string incrementing rcx until 0:
        cmp [rdi + rcx], byte 0 ; is the current character 0 ?
        je .return              ; if so, go to the .return label
        inc rcx                 ; else, increment rcx (the length)
        jmp .loop               ; go to the .loop label to handle the next character

    .return:                    ; restoring rcx's value and returning the length through rax:
        mov rax, rcx            ; moving rcx's value into rax to return it later
        pop rcx                 ; getting rcx's original content back from the stack
        ret                     ; returning rax's value
