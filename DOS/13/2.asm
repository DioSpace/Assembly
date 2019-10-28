assume cs:code

code segment
start:	mov ax,cs
	mov ds,ax
	mov si,offset sqr;设置ds:si指向源地址
	mov ax,0
	mov es,ax
	mov di,200h	;设置es:di指向目的地址
	mov cx,offset sqrend - offset sqr;设置cx传输长度
	cld		;设置传输方向为正
	rep movsb

	mov ax,0
	mov es,ax
	mov word ptr es:[7ch*4],200h
	mov word ptr es:[7ch*4+2],0
	
	mov ax,4c00h
	int 21h

sqr:	mul ax
	iret
sqrend:nop

code ends
end start
