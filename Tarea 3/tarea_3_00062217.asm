org 	100h

section .text

	call 	texto	
	call 	cursor
	call 	phrase
        call 	phrase2
        call 	phrase3
        call 	phrase4
        call 	phrase5
       
	int 	20h

texto:	mov 	ah, 00h ; inicia modo texto
	mov	al, 03h ; 80 columnas por 25 filas.
	int 	10h
	ret

cursor: mov	ah, 01h  ; forma del cursor
	mov 	ch, 00000000b
	mov 	cl, 00001110b
		;   IRGB
	int 	10h
	ret

w_char:	mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov 	bl, 00001111b
	mov 	cx, 1h
	int 	10h
	ret

kbwait: mov 	ax, 0000h ; no se utliza para que el programa corra de un solo
	int 	16h
	ret

m_cursr:mov 	ah, 02h ; posicion cursor
	mov 	dx, di  ; columna
	mov 	dh, bl ; fila
	mov 	bh, 0h
	int 	10h
	ret

phrase:	mov 	di, 1d
lupi:	mov 	cl, [msg+di-1d]
        mov     bl,2d
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len
	jb	lupi
	ret

phrase2:mov 	di, 10d
lupi2:	mov 	cl, [msg2+di-10d]
        mov     bl,6d
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len2
	jb	lupi2
	ret

phrase3:mov 	di, 20d
lupi3:	mov 	cl, [msg3+di-20d]
        mov     bl,11d
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len3
	jb	lupi3
	ret

phrase4:mov 	di, 30d
lupi4:	mov 	cl, [msg4+di-30d]
        mov     bl,16d
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len4
	jb	lupi4
	ret

phrase5:mov 	di, 45d
lupi5:	mov 	cl, [msg5+di-45d]
        mov     bl,23d
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len5
	jb	lupi5
	ret


section .data
msg	db 	"Cuando oigas a un nino preguntar "
len 	equ	$-msg+1d

msg2	db 	"Por que el sol viene y se va "
len2 	equ	$-msg2+10d

msg3	db 	"Dile : porque en esta vida no hay "
len3 	equ	$-msg3+20d

msg4	db 	"Luz sin oscuridad "
len4 	equ	$-msg4+30d

msg5	db 	"La danza del fuego - Mago de Oz "
len5 	equ	$-msg5+45d
