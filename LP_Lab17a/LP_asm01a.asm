.586
.MODEL flat, stdcall

getmin PROTO :DWORD, :DWORD
getmax PROTO :DWORD, :DWORD

.code

getmin PROC first :DWORD, amount :DWORD
	mov esi, first											; ��������� �� ������ �������
    mov ecx, amount											; ���-�� ��������� � ������� ����� ECX
    mov eax, [esi]											; 
	
CHECK:
	cmp [esi], eax											;
	jge NEXT												; ���� [esi] >= eax	�������			
	mov eax, [esi]											; 

NEXT:
	add esi, 4												; �� ������ 4 �����
	loop CHECK
	ret          
getmin ENDP

getmax PROC first :DWORD, amount :DWORD
	mov esi, first											; ��������� �� ������ �������
    mov ecx, amount											; ���-�� ��������� � ������� ����� ECX
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