;ejercicio 1
        org     100h

        mov	ax,6d   ;62217
	mov	bx,2d
	add     ax,bx
	add     ax,bx
	mov	bx,1d
        add     ax,bx
        mov	bx,7d
        add     ax,bx
	mov	bx,5d
        div     bx
        mov     bx,0000h
        ;compara
        cmp     ax,3d
        je      result3



result3: mov     bl,[ms3+di]
         mov     [di+200h],bl
         inc     di
         loop    result3
        
         int 20h

section .data

ms3      db      "Hay salud"     

