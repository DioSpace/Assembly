assume cs:code

code segment
	dw 0123H,0456H,0789H,0acbH,0defH,0fedH,0cbaH,0987H;dw(define word, 往word中写入数据)
start:	mov bx, 0; 定义程序入口(不定非要是start,可以随意定义,防止CPU误读指令)
	mov ax, 0
	mov cx, 8
s:	add ax, cs:[bx]
	add bx, 2
	loop s

	mov ax, 4c00h
	int 21h
code ends
end start;end除了通知编译器程序结束外,还可以通知编译器程序的入口在什么地方	
