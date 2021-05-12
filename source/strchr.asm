;;
;; EPITECH PROJECT, 2020
;; strchr.asm
;; File description:
;; minilibC: strchr
;;

bits 64

section .text
    global strchr

    strchr:
    .loop:                  ; going through the string until 0 or the char is found
        cmp [rdi], byte 0   ; is the current char the null-terminating byte ?
        je .return_null     ; if so, go to the .return_null label
        cmp [rdi], sil      ; else, is the current char the one we're looking for ?
        je .return_address  ; if so, got to the .return_address label
        inc rdi             ; else, increment rdi (go to the next char)
        jmp .loop           ; then go to the .loop label to handle the next char

    .return_null:           ; returning null
        xor rax, rax        ; setting the value to be returned to 0 (null)
        ret                 ; returning rax's value

    .return_address:        ; returning the adress through rax
        mov rax, rdi        ; moving rdi's content into rax so it can be returned
        ret                 ; returning rax's value