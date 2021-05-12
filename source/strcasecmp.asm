;;
;; EPITECH PROJECT, 2020
;; strcasecmp.asm
;; File description:
;; minilibC: strcasecmp
;;

bits 64

section .text
    global strcasecmp

    strcasecmp:
        xor rax, rax            ; Initializing rax to 0
        
    .loop:                      ; Going through the strings, storing the difference of bytes in r8b
        mov r8b, byte [rdi]     ; Copying rdi's current byte into r8b
        jmp .identify_byte      ; Go to the .identify_byte label to know what type r8b is

    .letters_are_equal:          ; If current letters are equal, checking if they're not 0 and going to the next ones
        xor rax, rax            ; Resetting rax's value to 0 in case of same letters but not same byte
        cmp byte [rdi], byte 0  ; Is rdi's current byte equal to 0 ?
        je .return              ; If so, got to the .return label
        inc rdi                 ; Go to rdi's next byte
        inc rsi                 ; Go to rsi's next byte
        jmp .loop               ; Go to the .loop label to handle the next bytes
    
    .identify_byte:              ; Sends to the right label according to what rdi is (upper / lower / not a letter)
        cmp r8b, byte 65        ; Is r8b below 65?
        jb .not_a_letter        ; If so, it's not a letter: go to the .not_a_letter label
        cmp r8b, byte 122       ; Else, is it higher than 122?
        jg .not_a_letter        ; If so, it's not a letter: go to the .not_a_letter label
        cmp r8b, byte 90        ; Is r8b below or equal to 90?
        jbe .uppercase_letter   ; If so, it's an uppercase letter: go to the .uppercase_letter label
        cmp r8b, byte 97        ; Else, is r8b higher or equal to 97?
        jge .lowercase_letter   ; If so, it's a lowercase letter: go to the .lowercase_letter label
        jmp .not_a_letter       ; Else, it's not a letter: go to the .not_a_letter label

    .not_a_letter:
        sub r8b, byte [rsi]     ; Subtracting rsi's current byte to rb8
        cmp r8b, byte 0         ; Is r8b equal to 0 ([rdi] == [rsi]) ?
        jne .return             ; If not, go to the .return label to return the difference
        jmp .letters_are_equal  ; Else, got to the .letters_are_equal label


    .uppercase_letter:
        sub r8b, byte [rsi]     ; Subtracting rsi's current byte to rb8
        cmp r8b, byte 0         ; Is r8b equal to 0 ([rdi] == [rsi]) ?
        je .letters_are_equal   ; If so, go to the .letters_are_equal label
        movsx rax, r8b          ; Copying rb8's value into rax with its sign
        cmp rax, -32            ; Is rax's value -32? (is [rsi] equal to lowercase [rdi]?)
        je .letters_are_equal   ; If so, go to the .letters_are_equal label
        sub rax, 32             ; Add 32 to rax to get the lowercase version of the difference
        jmp .return             ; Else, go to the .return label to return the difference

    .lowercase_letter:
        sub r8b, byte [rsi]     ; Subtracting rsi's current byte to rb8
        cmp r8b, byte 0         ; Is r8b equal to 0 ([rdi] == [rsi]) ?
        je .letters_are_equal   ; If so, go to the .letters_are_equal label
        movsx rax, r8b          ; Copying rb8's value into rax with its sign
        cmp rax, 32             ; Is rax's value 32? (is [rsi] equal to uppercase [rdi]?)
        je .letters_are_equal   ; If so, go to the .letters_are_equal label
        jmp .return             ; Else, go to the .return label to return the difference

    .return:                    ; Returning the difference of the last analyzed bytes (r8b)
        movsx rax, r8b          ; Copying rb8's value into rax with a sign to return it
        ret                     ; Returning rax's value