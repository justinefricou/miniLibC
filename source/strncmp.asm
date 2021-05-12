;;
;; EPITECH PROJECT, 2020
;; strncmp.asm
;; File description:
;; minilibC: strncmp
;;

bits 64

section .text
    global strncmp

    strncmp:
        xor r8, r8              ; Initializing r8's value to 0
    
    .loop:                      ; Going through the strings, storing the difference of bytes in r8b
        cmp rdx, byte 0         ; Is rdx equal to 0 yet?
        je .return              ; If so, go to the return label
        mov r8b, byte [rdi]     ; Copying rdi's current byte into r8b
        sub r8b, byte [rsi]     ; Subtracting rsi's current byte to rb8
        cmp r8b, byte 0         ; Is r8b equal to 0 ([rdi] == [rsi])?
        jne .return             ; If not, go to the .return label
        cmp byte [rdi], byte 0  ; Else, is rdi's current byte equal to 0?
        je .return              ; If so, got to the .return label
        inc rdi                 ; Go to rdi's next byte
        inc rsi                 ; Go to rsi's next byte
        dec rdx                 ; Decrementing rdx
        jmp .loop               ; Go to the .loop label to handle the next bytes

    .return:                    ; Returning the difference of the last analyzed bytes (r8b)
        xor rax, rax            ; Setting rax's value to 0
        movsx rax, r8b          ; Copying rb8's value into rax with a sign to return it
        ret                     ; Returning rax's value