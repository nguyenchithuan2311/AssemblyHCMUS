; CT HN nhap 1 ki tu tu ban phim va kiem tra ma ASCII thap phan co toan le khong
; viet o dang dich ra .EXE - co dung bien
; VD - Nhap 'A'  ==>  Xuat  La so co ma ASCII thap phan khong phai toan so le
;    - Nhap 'B'  ==>  Xuat  La so co ma ASCII thap phan khong phai toan so le
;    - Nhap 'a'  ==>  Xuat  La so co ma ASCII thap phan toan so le
;    - Nhap '1'  ==>  Xuat  La so co ma ASCII thap phan khong phai toan so le 
; Nguoi viet: Nguyen Chi Thuan
.model small
.stack 100
.data
     decemial db 10 
     newline db 10,13,'$'
     anuonce1 db "La so co ma ASCII thap phan toan so le$"
     anuonce2 db "La so co ma ASCII thap phan khong phai toan so le$"
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
    
    mov al,x
    mov ah,0
    mov cx,0       ;gan cx = 0 de dem so ky tu so  
    mov bx,0
Lapchia:                                
        mov dx,0       ;dua dx =0
        div decemial    ;chia cho ax cho 10 o dang 8 bit ah chua so du al chua thuong
        
        add ah,30h      ;bien so trong ah thanh ky tu so
        mov dl,ah       ; dua ah vao dx
        push dx         ;dua dx vao ngang xep
        inc cx          ;them mot chu so la cong them
        xor ah,ah       ;xoa ah
        cmp ax,0        ;neu thuong bang 0 thi dung lai
        jne Lapchia
Check:  
        mov ax,0
        inc bx 
        pop dx
        mov al,dl
        mov dx,2
        div dl
        cmp ah,0
        jne Check2
        je Hienthi2
Check2:
        cmp cx,bx
        jne check
        je hienthi1
 
Hienthi1:
        lea dx,anuonce1
        mov ah,9
        int 21h
        je Ketthuc
Hienthi2:
        lea dx,anuonce2
        mov ah,9
        int 21h
        je Ketthuc
Ketthuc: 
    
    mov ah,4Ch
    int 21h
    main endp
end