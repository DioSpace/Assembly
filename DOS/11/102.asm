assume cs:code

data segment
	db 16 dup (0)
data ends

code segment
start:	mov ax,0f000h
	mov ds,ax
	mov si,0ffffh	;ds:si指向f000:ffff
	mov ax,data
	mov es,ax
	mov di,15	;es:di指向data:000f
	mov cx,16	;(cx)=16, rep循环16次
	std 		;设置df=1,逆向传送
	rep movsb

	mov ax,4c00h
	int 21h
code ends
end start
