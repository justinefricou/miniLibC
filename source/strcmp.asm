;;
;; EPITECH PROJECT, 2020
;; strcmp.asm
;; File description:
;; minilibC: strcmp
;;

bits 64

section .text
    global strcmp
    
    strcmp:
        
    .loop:                      ; Going through the strings, storing the difference of bytes in r8b
        mov r8b, byte [rdi]     ; Copying rdi's current byte into r8b
        sub r8b, byte [rsi]     ; Subtracting rsi's current byte to rb8
        cmp r8b, byte 0         ; Is r8b equal to 0 ([rdi] == [rsi]) ?
        jne .return             ; If not, go to the .return label
        cmp byte [rdi], byte 0  ; Else, is rdi's current byte equal to 0 ?
        je .return              ; If so, got to the .return label
        inc rdi                 ; Go to rdi's next byte
        inc rsi                 ; Go to rsi's next byte
        jmp .loop               ; Go to the .loop label to handle the next bytes

    .return:                    ; Returning the difference of the last analyzed bytes (r8b)
        xor rax, rax            ; Setting rax's value to 0
        movsx rax, r8b          ; Copying rb8's value into rax with a sign to return it
        ret                     ; Returning rax's value