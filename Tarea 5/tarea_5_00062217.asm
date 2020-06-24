org 	100h

section .text ;320x200

	call 	grafico	; Llamada a iniciar modo grafico 13h

	xor 	si, si
	xor 	di, di
	xor 	bl, bl

	mov	si, 140d ; X -> Columna   
	mov 	di, 55d ; Y -> Fila
	mov	[0200h],byte 175d
	call 	linea_v

	mov 	si, 140d ; X -> Columna
	mov 	di, 175d ; Y -> Fila
	mov	[0202h],byte 160d
	call 	linea_h

	mov	si, 160d ; X -> Columna
	mov 	di, 115d ; Y -> Fila
	mov	[0200h],byte 175d
	call 	linea_v
	
	mov 	si, 160d ; X -> Columna
	mov 	di, 115d ; Y -> Fila
	mov	[0202h],byte 210d
	call 	linea_h

	mov	si, 210d ; X -> Columna
	mov 	di, 95d ; Y -> Fila
	mov	[0200h],byte 115d
	call 	linea_v

	mov 	si, 160d ; X -> Columna
	mov 	di, 95d ; Y -> Fila
	mov	[0202h],byte 210d
	call 	linea_h

	mov	si, 160d ; X -> Columna
	mov 	di, 75d ; Y -> Fila
	mov	[0200h],byte 95d
	call 	linea_v

	mov 	si, 160d ; X -> Columna
	mov 	di, 75d ; Y -> Fila
	mov	[0202h],byte 220d
	call 	linea_h

	mov	si, 220d ; X -> Columna
	mov 	di, 55d ; Y -> Fila
	mov	[0200h],byte 75d
	call 	linea_v

	mov 	si, 140d ; X -> Columna
	mov 	di, 55d ; Y -> Fila
	mov	[0202h],byte 220d
	call 	linea_h

	call 	kb	; Utilizamos espera de alguna tecla

	int 	20h

grafico:mov	ah, 00h
	mov	al, 13h
	int 	10h
	ret

pixel:	mov	ah, 0Ch
	mov	al, 1010b
	int 	10h
	ret

linea_h: 
lupi_h: mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, [0202h]
	jne 	lupi_h
	ret

linea_v:
lupi_v:mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, [0200h]
	jne 	lupi_v
	ret


kb: 	mov	ah, 00h
	int 	16h
	ret

section .data