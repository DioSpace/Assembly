assume cs:code,ss:stack

stack segment
	dw 8 dup(0)
stack ends

code segment
start:
	mov ax,stack
	mov ss,ax
	mov sp,10h
	mov ax,4240h
	mov dx,0fh
	mov cx,0ah

	call divdw	

	mov ax,4c00h
	int 21h

divdw:  		;子程序定义开始
        push ax         ;低16位先保存在栈中
        mov ax,dx       ;ax保存高位16位
        mov dx,0        ;dx置0是为了不影响下边余数位,使得高16位为0
        div cx          ;H/N

        mov bx,ax       ;ax,bx的值为(int)H/N,dx的值为(rem)H/N
        pop ax          ;ax的值现在是L

        div cx          ;L/N 注意,16位除法的时候默认被除数dx为高16位,ax为低16位

        mov cx,dx

        mov dx,bx

        ret             ;子程序定义结束

code ends
end start
