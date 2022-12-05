%include 'in_out.asm'
section .data
msg1 db 'Введите X: ',0h
msg11 db 'Введите A: ', 0h
msg2 db "Результат: ",0h
section .bss
max resb 10
B resb 10
A resb 10
section .text
global _start
_start:

mov eax,msg1
call sprint
; ---------- Ввод 'B'
mov ecx,B
mov edx,10
call sread

mov eax,B
call atoi ; Вызов подпрограммы перевода символа в число
mov [B],eax ; запись преобразованного числа

mov eax,msg11
call sprint

mov ecx,A
mov edx,10
call sread

mov eax,A
call atoi ; Вызов подпрограммы перевода символа в число
mov [A],eax ; запись преобразованного числа 

mov eax, 8
cmp [A], eax
jl yes
jge no

yes:
mov eax, 8
add [A], eax
jmp fin

no:
mov eax, [A]
mov esi, [B]
mul esi
mov [A], eax
jmp fin


fin:
mov eax, msg2
call sprint ; 
mov eax,[A]
call iprintLF ; 
call quit ; Выход
