assume cs:code
;所有逻辑全在cs段里
code segment
	dw 0123H,0456H,0789H,0acbH,0defH,0fedH,0cbaH,0987H
	dw 0,0,0,0,0,0,0,0

start: 	mov ax, cs
	mov ss, ax
	mov sp, 32
	mov bx, 0
	mov cx, 8
s:	push cs:[bx]
	add bx, 2
	loop s

	mov bx, 0
	mov cx, 8
s0:	pop cs:[bx]
	add bx, 2
	loop s0	
	
	mov ax, 4c00h
	int 21h
code ends
end start