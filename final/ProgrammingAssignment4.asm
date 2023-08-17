.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.code
includelib irvine32.lib
byte q1 "Please enter a sentence: ", 0;
byte q2 "Please  enter  the  number  of  characters  to  delete: “, 0;
byte q3 “Please enter the position from where to start deleting: “, 0;
byte q4 “Please enter a sentence S1 to insert: “, 0;
byte q5 “Please enter a sentence S2 in which to insert: “, 0;
byte q6 “Please enter the position P where to insert: “, 0;
word DWORD 21 DUP 0;
byteCount DWORD 0;
numChar DWORD 0;
startPos DWORD 0;

;------------
; EXERCISE 1
;------------

main proc

E1:
push eax
push ecx
push edx

mov edx, OFFSET q1  
call WriteString   ;display q1

mov edx, OFFSET buffer 
mov ecx, SIZEOF buffer  
call ReadString    ;read the user input
mov byteCount, eax   ;store the number of characters in byteCount

mov edx, OFFSET q2  
call WriteString   ;display q2
call Crlf

call ReadHex    ;question 4, reads hexadecimal n
mov numChar, eax

mov edx, OFFSET q3  
call WriteString   ;display q3
call Crlf

call ReadHex    ; reads hexadecimal P
mov startPos, eax

start:
mov edi, offset word
mov eax, offset startPos ;search startPos
mov ecx, LENGTHOF word
cld
repne scasb     ;repeat if not equal

mov edx, OFFSET word
call WriteString
pop edx
pop ecx
pop eax
call Crlf

ret

;------------
; EXERCISE 2
;------------

E2:

mov edx, OFFSET q4  ;question 4
call WriteString   ;display q4
call Crlf

mov edx, OFFSET buffer  
mov ecx, SIZEOF buffer  
call ReadString    ;read the user input

mov edx, OFFSET q5  ;question 5
call WriteString   ;display q5
call Crlf

mov edx, OFFSET buffer  
mov ecx, SIZEOF buffer  
call ReadString    ;read the user input

mov edx, OFFSET q6 ; question6
call ReadHex
mov  hexNum, eax
call Readstring ;read the user input
call Crlf

cld 
push ds 
pop es 
xor al, al 
mov di, offset q4 
mov si, offset q5
repnz scasb 
repnz movsb 
stosb 

ret

; calls both procedures
call E1
call E2

main endp
end main