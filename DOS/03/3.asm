assume cs:code

code segment

	mov ax, 2000h
	mov ds, ax; ds段不能直接赋值,必须通过其他寄存器间接赋值
	mov bx,	0
	mov al, [bx];把偏移地址bx所对应的内存上的值赋经al
	mov bx, 1
	mov bl, ds:[bx];等价于 mov bl, [bx]
	mov cl, ds:[2];把偏移地址2所对应的内存上的值赋经al
	mov dl, [3];把3赋给dl, 等价于 mov dl, 3

	mov ax, 4c00h
	int 21h
code ends

end