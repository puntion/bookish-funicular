%include "io64.inc"

section .text
global main
main:   
    mov rbp, rsp; for correct debugging
    
    ;write your code here
        
    GET_DEC 1, al
    GET_DEC 1, num
    
;    PRINT_DEC 1, al
;    NEWLINE
;    PRINT_DEC 1, num
    
    ;더하기 연산
    ;add a, b (a = a + b)
    ;a는 레지스터 or 메모리 or 상수
    ;단 a, b 모두 메모리는 X
    add al, 1 ;레지스터 + 상수
    PRINT_DEC 1, al  ;1+1=2
    NEWLINE
    
    ;mov rax, num
    add al, [num]  ;레지스터 + 메모
    PRINT_DEC 1, al  ;4
    NEWLINE
    
    mov bl, 3   ;레지스터 + 레지스터
    add al, bl
    PRINT_DEC 1, al  ;7
    NEWLINE
    
    add [num], byte 1  ;메모리 + 상수
    PRINT_DEC 1, [num]  ;3
    NEWLINE
    
    add [num], al  ;메모리 + 레지스터
    PRINT_DEC 1, [num]  ;10
    NEWLINE
    
    ;빼기 연산
    ;sub a, b (a = a - b)
    
    ;곱하기 연산
    ;mul reg
    ;- mul bl => al * bl (결과값을 위해 ax 예약)
    ;--연산결과를 ax에 저장
    ;- mul bx => ax * bx
    ;-- 연산결과는 dx(상위16비트) ax(하위16비트)에 저장
    ;- mul ebx => eax * ebx
    
    ;ex) 5 * 8?
    mov ax, 0
    mov al, 5
    mov bl, 8
    mul bl
    PRINT_DEC 2, ax  
    NEWLINE
    
    ;나누기 연산
    ;div reg
    ;- div bl => ax / bl
    ;-- 연산 결과는 al(몫) ah(나머지)
    
    ;ex) 100 /3?
    mov ax, 100
    mov bl, 3
    div bl
    PRINT_DEC 1, al  
    NEWLINE
    mov al, ah
    PRINT_DEC 1, al  
    
    xor rax, rax
    ret
    
section .data


section .bss
    num resb 1