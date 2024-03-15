
section .data
msg db "Programma realizzato da Simone Marro:" , 0xA, 0xA
len equ $ - msg  
sum_msg db "Il risultato della somma ---> ",
len_sum equ $ - sum_msg
mol_msg db "Il risultato della moltiplicazione ---> ",
len_mol equ $ - mol_msg

new_line db 0xA
len_nl equ $ - new_line

odd_msg db "Il numero è dispari", 0xA
len_odd_msg equ $ - odd_msg

even_msg db "Il numero è pari", 0xA
len_even_msg equ $ - even_msg

section .bss
sum resb 1
mol resb 1

section .text
global _start

num1 db 3
num2 db 2

_start:
mov	eax, [num1]
mov	ebx, [num2]

add	eax, ebx
add	eax, '0'
mov	[sum], eax

mov	ecx, msg
mov	edx, len
mov	ebx,1
mov	eax, 4
int	80h

mov	ecx, sum_msg
mov	edx, len_sum
mov	ebx, 1
mov	eax, 4
int	80h

mov	ecx, sum
mov	edx, 1
mov	ebx, 1
mov	eax, 4
int	80h

mov eax, 4
mov ebx, 1
mov ecx, new_line
mov edx, len_nl
int 80h

mov eax, [sum]
sub eax, 0	
and eax, 1
jz pari_sum
jnz dispari_sum

pari_sum:

mov eax, 4
mov ebx, 1
mov ecx, even_msg
mov edx, len_even_msg
int 80h

jmp moltiplicazione


dispari_sum:

mov eax, 4
mov ebx, 1
mov ecx, odd_msg
mov edx, len_odd_msg
int 80h

jmp moltiplicazione

moltiplicazione:
mov	eax, [num1]
mov	ebx, [num2]
mul ebx;
add eax, '0'
mov [mol], eax

mov	ecx, mol_msg
mov	edx, len_mol
mov	ebx, 1
mov	eax, 4
int	80h

mov	ecx, mol
mov	edx, 1
mov	ebx, 1
mov	eax, 4
int	80h

mov eax, 4
mov ebx, 1
mov ecx, new_line
mov edx, len_nl
int 80h

mov eax, [mol]
sub eax, 0	
and eax, 1
jz pari_mol
jnz dispari_mol

pari_mol:

mov eax, 4
mov ebx, 1
mov ecx, even_msg
mov edx, len_even_msg
int 80h

jmp fine


dispari_mol:

mov eax, 4
mov ebx, 1
mov ecx, odd_msg
mov edx, len_odd_msg
int 80h

jmp fine

fine:
mov	eax, 1
mov	ebx, 0
int	80h