assume cs:codesg
codesg segment
 start: mov ax, 0
	jmp short s;根据位移进行转移
	add ax, 1

	s:inc ax
codesg ends
end start	
