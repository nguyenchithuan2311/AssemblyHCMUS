; CT HN nhap 1 ki tu tu ban phim va kiem tra ma ASCII co phai nguyen to khong
; viet o dang dich ra .EXE - co dung bien
; VD - Nhap 'a'  ==>  Xuat  ma ASCII thap phan la so nguyen to
;    - Nhap 'B'  ==>  Xuat  ma ASCII thap phan khong phai so nguyen to
;    - Nhap '1'  ==>  Xuat  ma ASCII thap phan khong phai so nguyen to
; Nguoi viet: Nguyen Chi Thuan va Luong Vu Thai
.model small
.stack 100
.data
     decemial db 10 
     newline db 10,13,'$'
     anounce1 db 'ma ASCII thap phan la so nguyen to $'
     anounce2 db 'ma ASCII thap phan khong phai so nguyen to$'
     x db ?
     dem db ?  
.code
main proc
    mov ax,@data
    mov ds,ax
Run:    
    mov ah,1
    int 21h
    mov x,al
    mov dem,0 
    lea dx, newline
    mov ah,9
    int 21h
    mov bx,0
    mov bh,1
Lap1:
    inc bh
    cmp bh,x
    je Check2
    mov ax,0
    mov al,x
    div bh
    cmp ah,0
    jne Lap1
    je Count
Count:
     inc dem
     jmp Lap1
 
Check2:
    cmp dem,1
    jnl Hienthi2
    jl Hienthi1
Hienthi1:
    lea dx, anounce1
    mov ah,9
    int 21h
    jmp Ketthuc
Hienthi2:
    lea dx, anounce2
    mov ah,9
    int 21h
    jmp Ketthuc    
Ketthuc: 
    
    mov ah,4Ch
    int 21h
    main endp
end