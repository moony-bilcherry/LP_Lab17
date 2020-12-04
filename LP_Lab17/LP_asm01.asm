.586														; ������� ������ (��������� Pentium)
.model flat, stdcall										; ������ ������(�������), ���������� � �������
includelib kernel32.lib										; ������������: ����������� � kernel32
ExitProcess PROTO: DWORD									; �������� ������� ��� ���������� �������� Windows 

.stack 4096

.const
	array sdword 15, -26, -3, 14, 32, -8, 37, 1, -16, 28

.data
	min sdword ?

.code

getmin PROC first :DWORD, amount :DWORD
	mov esi, first											; ��������� �� ������ �������
    mov ecx, amount											; ���-�� ��������� � ������� ����� ECX
    mov eax, [esi]											; ������ �������
	
CHECK:
	cmp [esi], eax											;
	jge NEXT												; ���� [esi] >= eax	�������			
	mov eax, [esi]											; 

NEXT:
	add esi, 4												; �� ������ 4 �����
	loop CHECK
	ret          
getmin ENDP

main PROC													; ����� ����� main
    INVOKE getmin, offset array, lengthof array			 ; ����� ��������� getmin
    mov min, eax											; ��������� � min												
	INVOKE ExitProcess, 0									; ���������� �������� Windows
main ENDP													; ����� ���������
end main  