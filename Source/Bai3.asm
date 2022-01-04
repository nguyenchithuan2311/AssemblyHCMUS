; CT HN nhap 1 ki tu tu ban phim va kiem tra ma ASCII thap phan co tang dan khong
; viet o dang dich ra .EXE - co dung bien
; VD - Nhap 'A'  ==>  Xuat  ma ASCII thap phan khong phai so tang dan
;    - Nhap 'B'  ==>  Xuat  ma ASCII thap phan khong phai so tang dan
;    - Nhap 'a'  ==>  Xuat  ma ASCII thap phan khong phai so tang dan
;    - Nhap '1'  ==>  Xuat  ma ASCII thap phan la so tang dan 
; Nguoi viet: Nguyen Chi Thuan va Luong Vu Thai
.model small
.stack 100
.data
     decimal db 10 
     newline db 10,13,'$'
     anounce1 db 'ma ASCII thap phan la so tang dan $'
     anounce2 db 'ma ASCII thap phan khong phai so tang dan$'
     x db ?  
.code
main proc
    mov ax,@data                 
    mov ds,ax
Run:
    mov ax,0    
    mov ah,1
    int 21h
    mov x,al
    lea dx, newline
    mov ah,9
    int 21h
    mov al,x
    mov ah,0
    mov cx,0 
Lapchia:                                
        mov dx,0       ;dua dx =0
        div decimal    ;chia cho ax cho 10 o dang 8 bit ah chua so du al chua thuong
        
        add ah,30h      ;bien so trong ah thanh ky tu so
        mov dl,ah       ; dua ah vao dx
        push dx         ;dua dx vao ngang xep
        inc cx          ;them mot chu so la cong them
        xor ah,ah       ;xoa ah
        cmp ax,0        ;neu thuong bang 0 thi dung lai
        jne Lapchia                       
Compare1:        
        inc ax
        cmp ax,1
        jne Support2
        je Support1
Compare2:
        cmp dx,bx
        jle Hienthi2
        cmp cx,ax
        jnbe  Hienthi1
        jmp compare1
Support1:
        inc ax
        inc ax
        pop bx
        pop dx
        jmp Compare2
Support2:
        mov bx,dx
        pop dx
        je Compare2   
        
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