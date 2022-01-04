#include<stdio.h>
void main()
{
    char x;
    char decimal = 10;

Run:
    asm mov ax,0
	asm mov ah, 1
	asm int 21h
	asm mov x, al
	printf("\n");
	asm mov al, x
	asm mov ah, 0
	asm mov cx, 0

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

Compare1 :
    asm inc ax
    asm cmp ax, 1
    asm jne Support2
    asm je Support1

Compare2 :
    asm sub bx, 1h
    asm cmp bx, dx
    asm jl Hienthi2
    asm cmp ax, cx
    asm jnbe  Hienthi1
    asm jmp Compare1

Support1 :
    asm inc ax
    asm inc ax
    asm pop bx
    asm pop dx
    asm jmp Compare2

Support2 :
    asm mov bx, dx
    asm pop dx
    asm je Compare2

Hienthi1 :
    printf("Ma ASCII thap phan la so giam dan");
    asm jmp Ketthuc
Hienthi2 :
    printf("Ma ASCII thap phan la so khong giam dan")
    jmp Ketthuc
Ketthuc :
}