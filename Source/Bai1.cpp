#include<stdio.h>
void main()
{
    char x;
    char dem = 0;

Run:
	asm mov ah, 1
	asm int 21h
	asm mov x, al
	printf("\n");
	asm mov bx,0
    asm mov bh,1
Lap1:
	asm inc bh
	asm cmp bh,x
	asm je Check2
	asm mov ax,0
	asm mov al,x
	asm div bh
	asm cmp ah,0
	asm jne Lap1
	asm je Count
Count:
	asm inc dem
	asm jmp Lap1
Check2:
	asm cmp dem,1
	asm jnl Hienthi2
	asm jl Hienthi1
Hienthi1:
	printf("Ma ASCII thap phan la so nguyen to");
	asm je Ketthuc
Hienthi2:
	printf("Ma ASCII thap phan khong phai la so nguyen to");
	asm je Ketthuc
Ketthuc:
}