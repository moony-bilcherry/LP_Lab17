.586
.MODEL flat, stdcall

getmin PROTO :DWORD, :DWORD
getmax PROTO :DWORD, :DWORD

.code

getmin PROC first :DWORD, amount :DWORD
	mov esi, first											; указатель на начало массива
    mov ecx, amount											; кол-во элементов в счетчик цикла ECX
    mov eax, [esi]											; 
	
CHECK:
	cmp [esi], eax											;
	jge NEXT												; если [esi] >= eax	переход			
	mov eax, [esi]											; 

NEXT:
	add esi, 4												; тк размер 4 байта
	loop CHECK
	ret          
getmin ENDP

getmax PROC first :DWORD, amount :DWORD
	mov esi, first											; указатель на начало массива
    mov ecx, amount											; кол-во элементов в счетчик цикла ECX
    mov eax, [esi]											; 

CHECK:
	cmp [esi], eax
	jle NEXT
	mov eax, [esi]

NEXT:
	add esi, 4
	loop CHECK
	ret          
getmax ENDP

END