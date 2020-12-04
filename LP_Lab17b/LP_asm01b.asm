.586														
.model flat, stdcall										
includelib kernel32.lib										
includelib "..\Debug\LP_Lab17a.lib"

ExitProcess PROTO: DWORD									
GetStdHandle PROTO: DWORD									
															
WriteConsoleA PROTO: DWORD,: DWORD,: DWORD,: DWORD,: DWORD	
SetConsoleTitleA PROTO: DWORD								

getmin PROTO :DWORD, :DWORD
getmax PROTO :DWORD, :DWORD

.stack 4096

.const
	massiv			sdword		15, -26, -3, 14, 32, -8, 37, 1, -16, 28     ; ������
	consoleTitle	byte		'LP_asm01', 0                               ; �������� �������
	text			byte		'b) getmax - getmin =', 0		            ; ����� � �������					
	handleOutput	sdword		-11					                        ; �����	    

.data
	consoleHandle dword 0h									
	max sdword ?
	min sdword ?
	result sdword ?
	resultString byte 4 dup(0)

.code

int_to_char PROC uses eax ebx ecx edi esi,		
							  pstr: dword,  ; ����� ������ ���������
						  intfield: sdword  ; ������������� �����
    mov edi, pstr                           ; ����� ���������� � -> edi
    mov esi, 0			            ; ���������� �������� � ����������						
    mov eax, intfield								
    cdq								; �������������� 2�� ����� � ������������ ����������� ��������� ���� �������� eax �� ��� ���� �������� edx						
    mov ebx, 10                     ; ���������� ������� ���������
    idiv ebx						; aex = eax/ebx, ������� -> edx					
    test eax, 80000000h				; ��������� ������������� ?							
    jz plus							; ���� ��������� ���������� ������� 0, �.�.������������� �� �� plus							
    neg eax							; eax = -eax			
    neg edx                         ; edx = -edx
    mov cl, '-'                     ; ������ ������ ���������� '-'
    mov[edi], cl
    inc edi							; ++edi							
plus:
    push dx                         ; ������� -> ����
    inc esi                         ; ++esi
    test eax, eax					; eax == 0?							
    jz fin                          ; ���� �� �� �� fin
    cdq                             ; ���� �������������� � eax �� edx
    idiv ebx                        ; aex = eax/ebx, ������� -> edx
    jmp plus
fin:
    mov ecx ,esi                    ; ���������� ��������� �������� = ���������� �������� � ����������
write:
    pop bx							; ������� �� ����� -> bx							
    add bl,'0'                      ; ������������ ������ � bl
    mov[edi], bl                    ; bl-> � ���������
    inc edi                         ; edi++
    loop write                      ; if (--ecx) > 0 goto write
    ret
int_to_char ENDP

main PROC
	INVOKE SetConsoleTitleA, offset consoleTitle		                                ; ���������� ��������� ����������� ����
	INVOKE GetStdHandle,handleOutput			                                        ; �������� handle ������ �� ������� (-11 - �����)
	mov consoleHandle, eax						                                        ; ��������� -11 � consolehandle
    INVOKE getmin, offset massiv,lengthof massiv
    mov min, eax                                                                        ; ������ �� eax � min
    INVOKE getmax, offset massiv,lengthof massiv
	sub eax, min                                                                        ; �� eax (��� ������ max) �������� min
	mov result, eax                                                                     ;
	INVOKE WriteConsoleA, consoleHandle, offset text, sizeof text, 0, 0							
    INVOKE int_to_char, offset resultString, result	
	INVOKE WriteConsoleA, consoleHandle, offset resultString, sizeof resultString, 0, 0			
	INVOKE ExitProcess,0
main ENDP
end main   