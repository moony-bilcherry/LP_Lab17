.586														; система команд (процессор Pentium)
.model flat, stdcall										; модель памяти(плоская), соглашение о вызовах
includelib kernel32.lib										; компановщику: компоновать с kernel32
ExitProcess PROTO: DWORD									; прототип функции для завершения процесса Windows 

.stack 4096

.const
	array sdword 15, -26, -3, 14, 32, -8, 37, 1, -16, 28

.data
	min sdword ?

.code

getmin PROC first :DWORD, amount :DWORD
	mov esi, first											; указатель на начало массива
    mov ecx, amount											; кол-во элементов в счетчик цикла ECX
    mov eax, [esi]											; первый элемент
	
CHECK:
	cmp [esi], eax											;
	jge NEXT												; если [esi] >= eax	переход			
	mov eax, [esi]											; 

NEXT:
	add esi, 4												; тк размер 4 байта
	loop CHECK
	ret          
getmin ENDP

main PROC													; точка входа main
    INVOKE getmin, offset array, lengthof array			 ; вызов процедуры getmin
    mov min, eax											; результат в min												
	INVOKE ExitProcess, 0									; завершение процесса Windows
main ENDP													; конец процедуры
end main  