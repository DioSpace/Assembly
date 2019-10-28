assume cs:code

data segment
	db 'Welcome to masm!'
	db 16 dup (0)
data ends

code segment
start:	mov ax,data
	mov ds,ax
	mov si,0	;ds:si指向data:0
	mov es,ax	
	mov di,16	;es:di指向data:0010
	mov cx,16	
	cld		;设置df=0,正向传送
	rep movsb
	
	mov ax,4c00h
	int 21h
code ends
end start
