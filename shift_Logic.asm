%include "io64.inc"

section .text
global main
main:   
    mov rbp, rsp; for correct debugging
    
    ;쉬프트(shift) 연산, 논리(logical) 연산
    mov eax, 0x12345678
    PRINT_HEX 4, eax
    NEWLINE
    shl eax, 8
    PRINT_HEX 4, eax
    NEWLINE
    shr eax, 8
    PRINT_HEX 4, eax
    NEWLINE
    ;곱셈/나눗셈
    ;게임서버에서 ObjectID를 만들어 줄 때
    
    ;not and or xor
    ;조건A : 잘생겼다
    ;조건B : 키가 크다
    ;not A : 잘생겼다의 반대 -> (0이면 1, 1이면 0)
    ;A and B : 잘생겼고 키도 크다 -> 둘다1이면 1, 아니면 0
    ;A or B : 잘생겼거나 키가 크다 -> 둘중 하나라도 1이면 1, 아니면 0
    ;A xor B : 잘생기고 작거나 or 못생기고 크다 -> 둘다 1이거나 둘다 0이면 0, 아니면 1
    
    mov al, 0b10010101
    mov bl, 0b01111100
    
    and al, bl ; al = al and bl
    PRINT_HEX 1, al ;0b0001 0100 = 0x14
    NEWLINE
    
    not al
    PRINT_HEX 1, al ;0b1110 1011 = 0xeb
    NEWLINE
    
    ;응용사례 : bitflag
        
    mov al, 0b10010101
    
    PRINT_HEX 1, al ;95
    NEWLINE
    
    xor al, bl
    PRINT_HEX 1, al ;e9
    NEWLINE
    
    xor al, bl
    PRINT_HEX 1, al ;95
    NEWLINE
    ;동일한 값으로 xor 두번하면 자기 자신으로 되돌아 오는 특성
    ;암호학에서 유용하다(value xor key)
    
    xor al, al
    PRINT_HEX 1, al ;mov al, 0
    NEWLINE
    
    
    
    
    xor rax, rax
    ret
    
section .data


section .bss
    num resb 1