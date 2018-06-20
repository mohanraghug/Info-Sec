section .data
  num db '0','9','6','7','5','4','3','2','1','8'
section .text
global _start:
_start:
  mov esi,num ;
  xor ebx,ebx
  mov ecx,9
  call QuickSort
  mov eax,4
  mov ebx,1
  mov ecx,num
  mov edx,10
  int 0x80
  mov eax,1
  int 0x80
QuickSort:                         ;void(char a[],int low,int high)
  push ebp
  mov ebp,esp
  push esi                         ;char a[]
  push ebx                         ;low
  push ecx                         ;high
  cmp ebx,ecx                       ;if(low>=high) return;
  jge exit
  mov esi,[EBP+8]                   ;array
  mov eax,[ebp+12]                  ;int i=low
  mov ebx,[ebp+12]                  ;int j=low
  mov ecx,[ebp+16]                  ;high
  mov edi,[esi+ecx]                 ;pivot=a[high]
  jmp Partition
  Partition:
    cmp ebx,ecx                     ;checking j<high
    jge recursion
    cmp [esi+ebx],edi               ;if(a[j]<=pivot)
    jle ok                          ;swap a[i]and a[j]
    add ebx,1                       ;j=j+1;
  ok:

    push dword [esi+eax]            ;swapping
    push dword[esi+ebx]
    pop dword [esi+eax]
    pop dword [esi+ebx]
    add eax,1                       ;i=i+1
    add ebx,1
    jmp Partition                     ;j=j+1
  recursion:

    push dword [esi+eax]            ;final swapping
    push dword [esi+ecx]
    pop dword [esi+eax]
    pop dword [esi+ecx]
    push eax
    push ecx
    mov ebx,[ebp+12]
    sub eax,1
    mov ecx,eax
    call QuickSort       ;QuickSort(a,low,q-1)
    pop ecx
    pop ebx
    add ebx,1
    call QuickSort      ;QuickSort(a,q+1,high)
    exit:
    pop ecx
    pop ebx
    pop esi
    pop EBP
    ret
