section	.data
   msg db "Quante patate ha in sacco piu grande: "
   len equ $- msg
   stu db "Invece quello piu piccolo: "
   lun equ $- stu

   sac1 dd '49'
   sac2 dd '31'
   sac3 dd '27'
   
   
   new_line db 0xA
   len_nl equ $ - new_line

section .bss
   grande resb 2
   small resb 2
section	.text
global _start

_start:			
mov   ecx, [sac1]
cmp   ecx, [sac2]
jg    check_third_num	
mov   ecx, [sac2]

check_third_num:
cmp   ecx, [sac3]
jg    _exit	
mov   ecx, [sac3]	

_exit:
   mov   [grande], ecx	
   mov   ecx,msg	
   mov   edx, len
   mov   ebx,1
   mov   eax,4
   int   0x80

   mov   ecx,grande		
   mov   edx, 2
   mov   ebx,1
   mov   eax,4
   int   0x80
   
   mov eax, 4
	mov ebx, 1
	mov ecx, new_line
	mov edx, len_nl
	int 80h
   
   mov   ecx,stu		
   mov   edx, lun
   mov   ebx,1
   mov   eax,4
   int   0x80
   
   mov   ecx,[sac3]
   mov   [small], ecx
   
   mov   ecx,small	
   mov   edx, 2
   mov   ebx,1
   mov   eax,4
   int   0x80

   mov   eax, 1
   mov   ebx, 0
   int   80h