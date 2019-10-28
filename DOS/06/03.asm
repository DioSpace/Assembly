assume cs:code, ds:data, ss:stack
;代码写在不同的段中
data segment
	dw 0123H,0456H,0789H,0acbH,0defH,0fedH,0cbaH,0987H
data ends

stack segment
	dw 0,0,0,0,0,0,0,0
stack ends

code segment
start:	mov ax, stack
	mov ss, ax
	mov sp, 16
	mov ax, data
	mov ds, ax

	mov bx, 0
	mov cx, 8
s:	push [bx]
	add bx, 2
	loop s

	mov bx, 0
	mov cx, 8
s0:	pop [bx]
	add bx, 2
	loop s0	
	
	mov ax, 4c00h
	int 21h
code ends
end start
