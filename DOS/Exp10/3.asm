assume cs:code,ds:data

data segment
	db 10 dup(0)
data ends

code segment
start:
	mov ax,12666
	
	mov bx,data	;ds:si指向字符串的首地址
	mov ds,bx
	mov si,0

	call dtoc	;dtoc子程序实现将word型整数转化为字符串的ASCII码并存储

	mov dh,8	;初始化打印位置
	mov dl,3
	mov cl,0cah

	call show_str	;开始打印字符串

	mov ax,4c00h
	int 21h

dtoc:		;数值显示的子程序定义
	push dx
	push cx
	push ax
	push si
	push bx

	mov bx,0	;bx在子程序中用来存放位数,用栈来临时存放修改后的字符

s1:	mov cx,10d	;d表示十进制,cx准备被除
	mov dx,0	;保存余数

	div cx		;除以十(注:16位除法,ax存储商,dx存储余数)
	mov cx,ax	;得到的商赋值给cx

	jcxz s2		;当商为0则跳到s2

	add dx,30h	;将余数加上30h得到相应的ASCII码
	push dx

	inc bx

	jmp short s1

s2:	add dx,30h	;当商为0的时候,余数为个位
	push dx		;再进行一次栈操作(补充当'商为0而余数不为0'时的情况)
	
	inc bx		

	mov cx,bx	;总共有bx位进栈了,所以循环次数为bx
	mov si,0	

s3:	pop ax		;s3实现将栈中的数据依次出栈放到指定内存中
	
	mov [si],al
	inc si

	loop s3

okay:	pop bx
	pop si
	pop ax
	pop cx
	pop dx

	ret	;数值显示的子程序定义结束



show_str:	;显示字符串的子程序(定义开始)
	push cx
	push si

	mov al,0A0h ;每行80*2 = 160 byte = 0A0h byte 内容, 则第n行
	
	dec dh	;行号在显存中下标从0开始,所以减1
	mul dh	;相当于从第(n-1)* 0A0h 个byte单元开始
	
	mov bx,ax	;定位好的位置偏移地址存放在bx里(行)

	mov al,2	;每个字符占两个字节
	mul dl		;定位列,结果ax存放的是定位好的列位置
	sub ax,2	;列号在显存中下标从0开始,又因为偶字节存放字符,所以减2

	add bx,ax	;此时bx中存放的是行与行号的偏移地址

	mov ax,0B800h	;显存开始的地址
	mov es,ax	;es中存放的是显存的第0页(共0--7页)的起始的段地址

	mov di,0	;di指向显存的偏移地址

	mov al,cl	;cl是存放颜色的参数,这时候al存放颜色了

	mov ch,0	;下边cx存放的是每次准备处理的字符	

s:	mov cl,ds:[si]	;ds:[si]指向'Welcome to mas!',0
	
	jcxz ok		;当cl的值为0时候,cx == 0,则发生跳转,到ok处结束处理!

	mov es:[bx+di],cl	;偶地址存放字符
	mov es:[bx+di+1],al	;奇地址存放字符的颜色属性

	inc si

	add di,2	;指向了下个字符
	jmp short s	;无条件跳转,jcxz是离开的关键跳!

ok: 	pop si
	pop cx

	ret	;显示字符串的子程序[定义结束]


code ends
end start
