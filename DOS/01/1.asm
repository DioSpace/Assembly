assume cs:codesg

codesg segment

start:  mov ax, 0123H
	mov bx, 0456H
	add ax, bx; ax = ax + bx
	add ax, ax; ax = ax + ax

	mov ax, 4C00H
	int 21H
codesg ends

end start	
