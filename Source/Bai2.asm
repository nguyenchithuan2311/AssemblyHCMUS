; CT HN nhap 1 ki tu tu ban phim va kiem tra ma ASCII thap phan co phai chinh phuong hay khong 
; viet o dang dich ra .EXE - co dung bien
; VD - Nhap 'A'  ==>  Xuat  ma ASCII thap phan khong phai so chinh phuong
;    - Nhap 'B'  ==>  Xuat  ma ASCII thap phan khong phai so chinh phuong
;    - Nhap 'a'  ==>  Xuat  ma ASCII thap phan khong phai so chinh phuong
;    - Nhap '1'  ==>  Xuat  ma ASCII thap phan la so chinh phuong
; Nguoi viet: Nguyen Chi Thuan va Luong Vu Thai
.model small
.stack 100
.data
     decemial db 10 
     newline db 10,13,'$'
     anounce1 db 'ma ASCII thap phan la so chinh phuong $'
     anounce2 db 'ma ASCII thap phan khong phai so chinh phuong$'
     x db ?  
.code
main proc
    mov ax,@data
    mov ds,ax
Run:    
    mov ah,1
    int 21h
    mov x,al
    lea dx, newline
    mov ah,9
    int 21h
Lap1:
    inc bh
    cmp al,x
    jnbe Check2
    mov al,bh
    mul al
    cmp al,x
    jne Lap1
    je Check2 
Check2:
    cmp al,x
    jne Hienthi2
    je Hienthi1
Hienthi1:
    lea dx, anounce1
    mov ah,9
    int 21h
    je Ketthuc
Hienthi2:
    lea dx, anounce2
    mov ah,9
    int 21h
    je Ketthuc    
Ketthuc: 
    
    mov ah,4Ch
    int 21h
    main endp
end