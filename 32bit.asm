section .data
  usermsg db 'please enter a number:'
  lenusrmsg equ $-usermsg
  dispmsg db 'You have entered: '
  lendispmsg equ $-dispmsg
section .bss
  num resb 5
section .text
  global _start
_start:
  mov eax,4
  mov ebx,1
  mov ecx,usermsg
  mov edx,lenusrmsg
  int 80h
  mov eax,3
  mov ebx,2
  mov ecx,num
  mov edx,5
  int 80h
  mov eax,4
  mov ebx,1
  mov ecx,dispmsg
  mov edx,lendispmsg
  int 80h
  mov eax,4
  mov ebx,1
  mov ecx,num
  mov edx,5
  int 80h
  mov eax,1
  mov ebx,0
  int 80h
