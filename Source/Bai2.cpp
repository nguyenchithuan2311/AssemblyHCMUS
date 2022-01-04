#include<stdio.h>
void main()
{
	char x;
Run:
	asm mov ah, 1
	asm int 21h
	asm mov x, al
	printf("\n");

Lap1:
	asm inc bh
	asm cmp al,x
	asm jnbe Check2
	asm mov al,bh
	asm mul al
	asm cmp al,x
	asm jne Lap1
	asm je Check2
Check2:
	asm cmp al,x
	asm jne Hienthi2
	asm je Hienthi1
Hienthi1:
	printf("Ma ASCII thap phan la so chinh phuong");
	asm je Ketthuc
Hienthi2:
	printf("Ma ASCII thap phan khong phai la so chinh phuong");
	asm je Ketthuc
Ketthuc:
}