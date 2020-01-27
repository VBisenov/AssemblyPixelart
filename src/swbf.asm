.MODEL SMALL				;	Модель памяти ближнего типа.
.STACK 256					;	Отвести под стек 256 байт.
.486						;	Используем расширенную систему команд.

.DATA
	forcolor DB 04h			;	цвет.
	xc DW 250				; 	координаты центра квадрата 
	yc DW 150				;	в новой системе координат
	x DW ?				;	зарезервировано для вывода квадрата.
	y DW ?				
	xd dw 160               ;	координаты новой системы отсчета
	yd dw 15

.CODE						;	Открыть сегмент кодов.

Point PROC ; процедура вывода пикселя {
pusha ; сохранить_в_стеке_регистры(AX,CX,DX,BX,SP,BP,SI,DI)
mov CX, xc ; центральный
add CX, x ; -> x: xc + x
sub cx, 2
add cx, xd
mov DX, yc ;
sub DX, y ; -> y: yc - y.
sub dx, 2
add dx, yd
mov AL, forcolor ; -> палитра: forcolor
mov BH, 0 ; -> страница: 0
mov AH, 12 ; функция_вывода_пикселя(
int 10h ; )
popa ; извлечь_из_стека_регистры(AX,CX,DX,BX,SP,BP,SI,DI)
ret ; return
Point ENDP


kvadrat PROC  ;цикл для вывода квадрата размером 5х5
pusha
mov cx,0
kv1:
mov y,cx
mov dx,0
kv2:
mov x, dx
call Point
inc dx
cmp dx,4
jne kv2
inc cx
cmp cx,4
jne kv1
popa
ret
kvadrat ENDP


lev PROC     ;процедура вывода квадрата слева от предыдущего
sub xc, 5
call kvadrat
ret
lev ENDP


Main PROC			;	Подготовка данных
	mov AX, @DATA			;	
	mov DS, AX				;	DS = начало сегмента данных
	mov AH, 0				;	функция_выбора_видео_режима(
	mov AL, 13h				;		режим: 320х200 цв. 256
	int 10h					;

	mov xc, 5				; 1 str			
	mov yc, 5
	mov forcolor, 0Fh		; White color

	call kvadrat	
	call lev
	call lev
	mov forcolor, 07h 		; Gray color
	call lev
	call lev

	mov xc, 15				; 2 str
	mov yc, 10
	mov forcolor, 0Fh		; White color
	call kvadrat
	call lev
	call lev
	call lev
	call lev
	mov forcolor, 07h 		; Gray color
	call lev
	call lev
	call lev
	call lev

	mov xc, 25				; 2st str
	mov yc, 15
	mov forcolor, 0Fh		; White color
	call kvadrat
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	mov forcolor, 07h 		; Gray color
	call lev
	call lev
	call lev
	call lev
	call lev

	mov xc, 25				; 3 str
	mov yc, 15
	mov forcolor, 0Fh		; White color
	call kvadrat
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	mov forcolor, 07h 		; Gray color
	call lev
	call lev
	call lev
	call lev
	call lev

	mov xc, 30				; 4 str
	mov yc, 20
	mov forcolor, 0Fh		; White color
	call kvadrat
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	mov forcolor, 07h 		; Gray color
	call lev
	call lev
	call lev
	call lev
	call lev

	mov xc, 35				; 5 str
	mov yc, 25
	mov forcolor, 0Fh		; White color
	call kvadrat
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	mov forcolor, 07h 		; Gray color
	call lev
	call lev
	call lev
	call lev
	call lev

	mov xc, 35				; 6 str
	mov yc, 30
	mov forcolor, 0Fh		; White color
	call kvadrat
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	mov forcolor, 07h 		; Gray color
	call lev
	call lev
	call lev
	call lev
	call lev

	mov xc, 35				; 7 str
	mov yc, 35
	mov forcolor, 00h		; Black color
	call kvadrat
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev

	mov xc, 35				; 7 str
	mov yc, 40
	mov forcolor, 0Fh		; White color
	call kvadrat
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	mov forcolor, 07h
	call lev
	call lev
	call lev

	mov xc, 35				; 8 str
	mov yc, 45
	mov forcolor, 0Fh		; White color
	call kvadrat
	call lev
	mov forcolor, 00h		; Black color
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	mov forcolor, 0Fh 		; white color
	call lev
	mov forcolor, 00h		; Black color
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	mov forcolor, 07h		; Gray color
	call lev
	call lev

	mov xc, 35				; 9 str
	mov yc, 50
	mov forcolor, 0Fh		; White color
	call kvadrat
	call lev
	mov forcolor, 00h		; Black color
	call lev
	call lev
	call lev
	call lev
	mov forcolor, 0Fh 		; white color
	call lev
	call lev
	call lev
	call lev
	call lev
	mov forcolor, 00h		; Black color
	call lev
	call lev
	call lev
	call lev
	mov forcolor, 07h		; Gray color
	call lev
	call lev

	mov xc, 40				; 10 str
	mov yc, 55
	mov forcolor, 0Fh		; White color
	call kvadrat
	call lev
	call lev
	mov forcolor, 00h		; Black color
	call lev
	call lev
	mov forcolor, 0Fh 		; white color
	call lev
	call lev
	mov forcolor, 07h 		; gray color
	call lev
	mov forcolor, 0Fh 		; white color
	call lev
	call lev
	call lev
	mov forcolor, 07h 		; gray color
	call lev
	mov forcolor, 0Fh 		; white color
	call lev
	call lev
	mov forcolor, 00h		; Black color
	call lev
	call lev
	mov forcolor, 07h		; Gray color
	call lev
	call lev
	call lev

	mov xc, 45				; 11 str
	mov yc, 60
	mov forcolor, 0Fh		; White color
	call kvadrat
	call lev
	mov forcolor, 07h		; gray color
	call lev
	mov forcolor, 0Fh		; White color
	call lev
	mov forcolor, 07h 		; gray color
	call lev
	mov forcolor, 0Fh		; White color
	call lev
	call lev
	mov forcolor, 07h 		; gray color
	call lev
	mov forcolor, 0Fh 		; white color
	call lev
	call lev
	call lev
	call lev
	call lev
	mov forcolor, 07h 		; gray color
	call lev
	mov forcolor, 0Fh 		; white color
	call lev
	call lev
	mov forcolor, 08h		; Dark gray color
	call lev
	mov forcolor, 07h		; Gray color
	call lev
	mov forcolor, 08h 		; dark gray color
	call lev
	mov forcolor, 07h		; Gray color
	call lev
	call lev

	mov xc, 45				; 12 str
	mov yc, 65
	mov forcolor, 0Fh		; White color
	call kvadrat
	call lev
	call lev
	mov forcolor, 07h		; gray color
	call lev
	mov forcolor, 0Fh		; white color
	call lev
	call lev
	mov forcolor, 07h 		; gray color
	call lev
	mov forcolor, 0Fh		; white color
	call lev
	call lev
	call lev
	mov forcolor, 08h 		; dark gray
	call lev
	mov forcolor, 0Fh 		; white
	call lev
	call lev
	call lev
	mov forcolor, 07h 		; gray color
	call lev
	mov forcolor, 0Fh		; white color
	call lev
	call lev
	mov forcolor, 08h 		; dark gray
	call lev
	mov forcolor, 07h 		; gray color
	call lev
	call lev
	call lev


	mov xc, 45				; 13 str
	mov yc, 70
	mov forcolor, 07h		; Gray color
	call kvadrat
	mov forcolor, 0Fh		; white color
	call lev
	call lev
	call lev
	mov forcolor, 07h		; Gray color
	call lev
	call lev
	mov forcolor, 0Fh		; white color
	call lev
	call lev
	call lev
	mov forcolor, 00h		; black color
	call lev
	call lev
	call lev
	mov forcolor, 0Fh		; white color
	call lev
	call lev
	call lev
	mov forcolor, 07h		; Gray color
	call lev
	mov forcolor, 08h		; Dark gray color
	call lev
	mov forcolor, 07h		; Gray color
	call lev
	call lev
	call lev
	mov forcolor, 08h		; Dark gray color
	call lev

	mov xc, 45				; 14 str
	mov yc, 75
	mov forcolor, 0Fh		; White color
	call kvadrat
	mov forcolor, 07h		; Gray color
	call lev
	mov forcolor, 0Fh		; white color
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	mov forcolor, 00h		; black color
	call lev
	mov forcolor, 08h		; Dark gray color
	call lev
	mov forcolor, 0Fh		; white color
	call lev
	mov forcolor, 08h		; Dark gray color
	call lev
	mov forcolor, 00h		; black color
	call lev
	mov forcolor, 0Fh		; white color
	call lev
	call lev
	call lev
	call lev
	mov forcolor, 07h		; Gray color
	call lev
	call lev
	mov forcolor, 08h		; Dark gray color
	call lev
	mov forcolor, 07h		; Gray color
	call lev

	mov xc, 45				; 15 str
	mov yc, 80
	mov forcolor, 0Fh		; White color
	call kvadrat
	call lev
	mov forcolor, 07h		; Gray color
	call lev
	mov forcolor, 0Fh		; white color
	call lev
	call lev
	call lev
	call lev
	mov forcolor, 00h		; black color
	call lev
	mov forcolor, 08h		; Dark gray color
	call lev
	mov forcolor, 0Fh		; white color
	call lev
	call lev
	call lev
	mov forcolor, 08h		; Dark gray color
	call lev
	mov forcolor, 00h		; black color
	call lev
	mov forcolor, 0Fh		; white color
	call lev
	call lev
	mov forcolor, 07h		; Gray color
	call lev
	call lev
	mov forcolor, 08h		; Dark gray color
	call lev
	mov forcolor, 07h		; Gray color
	call lev
	call lev

	mov xc, 40				; 16 str
	mov yc, 85
	mov forcolor, 0Fh		; White color
	call kvadrat
	call lev
	mov forcolor, 07h		; Gray color
	call lev
	mov forcolor, 0Fh		; white color
	call lev
	call lev
	mov forcolor, 00h		; black color
	call lev
	mov forcolor, 0Fh		; white color
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	mov forcolor, 00h		; black color
	call lev
	mov forcolor, 07h		; Gray color
	call lev
	call lev
	mov forcolor, 08h		; Dark gray color
	call lev
	mov forcolor, 07h		; Gray color
	call lev
	call lev

	mov xc, 40				; 17 str
	mov yc, 90
	mov forcolor, 0Fh		; White color
	call kvadrat
	call lev
	call lev
	mov forcolor, 07h		; Gray color
	call lev
	mov forcolor, 0Fh		; white color
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	mov forcolor, 07h		; Gray color
	call lev
	call lev
	mov forcolor, 08h		; Dark gray color
	call lev
	mov forcolor, 07h		; Gray color
	call lev
	call lev
	call lev

	mov xc, 35				; 18 str
	mov yc, 95
	mov forcolor, 0Fh		; White color
	call kvadrat
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	mov forcolor, 00h		; black color
	call lev
	mov forcolor, 0Fh		; white color
	call lev
	mov forcolor, 07h		; Gray color
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev
	call lev

	mov xc, 30				; 19 str
	mov yc, 100
	mov forcolor, 0Fh		; White color
	call kvadrat
	call lev
	call lev
	mov forcolor, 00h		; black color
	call lev
	call lev
	mov forcolor, 0Fh		; White color
	call lev
	mov forcolor, 00h		; black color
	call lev
	call lev
	call lev
	mov forcolor, 07h		; Gray color
	call lev
	mov forcolor, 00h		; black color
	call lev
	call lev
	mov forcolor, 07h		; Gray color
	call lev
	call lev
	call lev

	mov xc, 25				; 20 str
	mov yc, 105
	mov forcolor, 0Fh		; White color
	call kvadrat
	call lev
	mov forcolor, 00h		; black color
	call lev
	mov forcolor, 0Fh		; White color
	call lev
	call lev
	mov forcolor, 00h		; black color
	call lev
	call lev
	call lev
	mov forcolor, 07h		; Gray color
	call lev
	call lev
	mov forcolor, 00h		; black color
	call lev
	mov forcolor, 07h		; Gray color
	call lev
	call lev

	mov xc, 25				; 20 str
	mov yc, 110
	mov forcolor, 0Fh		; White color
	call lev
	call lev
	call lev
	call lev
	mov forcolor, 00h		; black color
	call lev
	call lev
	call lev
	mov forcolor, 07h		; Gray color
	call lev
	call lev
	call lev
	call lev


	mov AX, 4C00h			;	функция_завершения_работы(
	int 21h					;	)
Main ENDP
END Main