        org     100h

section .text

	call	texto
	call 	cursor
	call	phrase
	call	addinit
	call	showpromi
	call	showprom2i
	call	valid
	
	int 	20h
texto:	mov 	ah, 00h ;inicia modo texto
	mov	al, 03h 
	int 	10h
	ret

cursor: mov	ah, 01h  ; forma del cursor
	mov 	ch, 00000000b
	mov 	cl, 00001110b
	int 	10h
	ret

m_cursr:mov 	ah, 02h ; posicion cursor
	mov 	dx, di  ; column
	mov 	dh, bl ; row
	mov 	bh, 0h
	int 	10h
	ret

w_char:	mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov 	bl, 00001111b
	mov 	cx, 1h
	int 	10h
	ret

kb:	mov	ah, 00h 
	int 	16h	
	ret

phrase:	mov 	di, 8d
lupi:	mov 	cl, [msg3+di-8d]
        mov     bl,2d
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len3
	jb	lupi  ;<
	ret

addinit:xor 	si, si
	call	kb
	mov	[300h], al
	xor	ax,ax
	inc	si
	inc	si
	call	kb
	mov	[302h],al
	mov	ax,[300h]
	sub 	ax,30h
	mov	bx,[302h]
	sub 	bx,30h
	add	ax,bx	
	mov	[240h],ax
	xor	ax,ax
adding:	call	kb
	mov	[300h],al
	mov	ax,[300h]
	sub 	ax,30h
	mov	bx,[240h]
	add	ax,bx	
	mov	[240h],ax
	inc	si
	cmp	si, 5d ;5 caracteres
	je 	end
	jmp	adding
	
end:	mov	ax,[240h]
	mov	bl,5d
	div	bl
	add	ax,30h
	mov	[245h],ax
	ret

showpromi:mov 	di, 8d
showprom:mov 	cl, [msg4+di-8d]
         mov     bl,6d
	 call    m_cursr
	 call 	w_char
	 inc	di
	 cmp 	di, len4
	 jb	showprom  ;<
	 ret

showprom2i:mov 	di, 24d
	 mov 	cl, [245h]
         mov     bl,6d
	 call    m_cursr
	 call  	 w_char
	 ret


valid:	;compara
	mov	ax,[245h]
	sub	ax,30h
	cmp     ax,3d
        je      showmsgi
	ret

showmsgi:mov 	di, 8d
showmsg:mov 	cl, [msg5+di-8d]
         mov     bl,7d
	 call    m_cursr
	 call 	 w_char
	 inc	di
	 cmp 	di, len5
	 jb	showmsg  ;<
	 ret


section .data

msg3      db      "Ingrese las 5 notas para calcular promedio: "     
len3 	  equ	  $-msg3+8d
msg4      db      "El promedio es: "     
len4	  equ	  $-msg4+8d
msg5      db      "Hay salud"      
len5	  equ	  $-msg5+8d
