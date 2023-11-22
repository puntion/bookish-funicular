%include "io64.inc"

section .text
global main
main:   
    mov rbp, rsp; for correct debugging
    
    ;반복문 (while for do-while)
    ;특정 조건을 만족할때까지 반복해서 실행
    ;ex) Hello World를 10번 출력
    mov ecx, 10
    
LABEL_LOOP:
    PRINT_STRING msg
    NEWLINE
;    sub ecx, 1
    dec ecx; sub ecx, 1과 동일
    cmp ecx, 0
    jne LABEL_LOOP
    
    ;연습문제) 1에서 100까지의 합
    mov eax, 100 ;최종목적지
    xor ebx, ebx ;mov ebx, 0 -> ebx 결과물
    xor ecx, ecx
    
LABEL_SUM:
    inc ecx ;add ecx, 1과 동일
    add ebx, ecx;
    cmp ecx, eax
    jne LABEL_SUM
    
    PRINT_DEC 4, ebx
    NEWLINE
    
    ;loop [라벨]
    ;-ecx에 반복 횟수
    ;-loop 할때마다 ecx 1감소 0이면 빠져나감 아니면 라벨로 이동
    mov ecx, 100
    xor ebx, ebx
LABEL_LOOP_SUM:
    add ebx, ecx
    loop LABEL_LOOP_SUM
    
    PRINT_DEC 4, ebx
    NEWLINE
    
    xor rax, rax
    ret
   
section .data
    msg db 'Hello World', 0x00

section .bss
    num resb 1