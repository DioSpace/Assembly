assume cs:code
;一段字符串以0结束,现在要将这段字符串转换成大写,结尾处的0不操作
data segment
	db 'conversatoin',0
data ends

code segment

start:	mov ax,data
	mov ds,ax
	mov si,0;ds:si指向字符串(批量数据)所在空间的首地址
	
	call capital
	
	mov ax,4c00h
	int 21h

capital:
	mov cl,[si]
	mov ch,0

	jcxz ok;如果cx等于0,进行跳转,如果不是0 就往下执行

	and byte ptr [si],11011111b ;将字符转化成大写
	inc si ;ds:si指向下一个单元
	
	jmp short capital

ok:	ret	

code ends
end start

