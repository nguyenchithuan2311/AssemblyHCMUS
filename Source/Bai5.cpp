#include<stdio.h>
void main()
{
    char x;
    char decimal = 10;

Run:
	asm mov ah, 1
	asm int 21h
	asm mov x, al
	printf("\n");
	asm mov al, x
	asm mov ah, 0
	asm mov cx, 0
    asm mov bx, 0

Lapchia:
    asm mov dx, 0
    asm div decimal

    asm add ah, 30h
    asm mov dl, ah
    asm push dx
    asm inc cx
    asm xor ah, ah
    asm cmp ax, 0
    asm jne Lapchia

Check:
    asm mov ax,0
    asm inc bx
        asm pop dx
        asm mov al,dl
        asm mov dx,2
        asm div dl
        asm cmp ah,1
        asm je Hienthi2
        asm jne Check2
Check2:
    asm cmp cx,bx
    asm je Hienthi1
    asm jne Check

Hienthi1 :
    printf("Ma ASCII thap phan la so toan chan");
    asm jmp Ketthuc
Hienthi2 :
    printf("Ma ASCII thap phan la so khong toan chan")
    jmp Ketthuc
Ketthuc :
}