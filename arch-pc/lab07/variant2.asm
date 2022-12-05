%include 'in_out.asm' ; подключение внешнего файла
SECTION .data
div: DB 'Результат: ',0
rem: DB '18 * (x + 1) / 6',0
rem1: DB 'ВВедите х:'

SECTION .bss
x: RESB 80
SECTION .text
GLOBAL _start
_start:

mov eax, rem
call sprintLF

mov eax, rem1
call sprintLF

mov ecx, x
mov edx, 80
call sread
mov eax,x ; вызов подпрограммы преобразования
call atoi
add eax,1 ;
mov eax, eax
mov ebx,18 ;
mul ebx ; EAX=EAX*EBX
xor edx,edx ; обнуляем EDX для корректной работы div
mov ebx,6 ; 
div ebx ; EAX=EAX, EDX=остаток от деления
mov edi,eax ; запись результата вычисления в 'edi'
; ---- Вывод результата на экран
mov eax,div ; вызов подпрограммы печати
call sprint ; сообщения 'Результат: '
mov eax,edi ; вызов подпрограммы печати значения
call iprintLF ; из 'edi' в виде символов

call quit ; вызов подпрограммы завершения
