assume cs:code

code segment

start:	mov ax, 2
	mov cx, 11;cx循环次数
s: 	add ax, ax; s标号,循环开始的地方
	loop s; cx减1, 判断循环是否结束

	mov ax, 4c00h
	int 21h
code ends
end start