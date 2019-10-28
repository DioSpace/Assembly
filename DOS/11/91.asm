assume cs:code

data segment
	db 8,11,8,1,8,5,63,38
data ends

code segment
start:	mov ax,data
	mov ds,ax
	mov bx,0	;ds:bx指向第一个字节
	mov ax,0	;初始化累加器
	mov cx,8
s:	cmp byte ptr [bx],8;和8进行比较
	jne next	;如果不相等转到next,继续循环
	inc ax		;如果相等,往下执行,将计数值加1
next:	inc bx
	loop s		;程序执行后,(ax)=3

	mov ax,4c00h
	int 21h
code ends
end start