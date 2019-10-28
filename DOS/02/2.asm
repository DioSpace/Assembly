assume cs:codesg

codesg segment

fishcc: mov ax, 2000h
	mov ds, ax
	mov al, [0];是把0赋给al,不会把偏移地址0所指的内存值赋给al
	mov bl, [1]
	mov cl, [2]
	mov dl, [3]

	mov ax, 4C00H
	int 21H

codesg ends

end fishcc
