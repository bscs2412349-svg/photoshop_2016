.model small
.stack 100h
.data
array db 5,9,2,14,7,3,8,1
len db 9
msg db "Largest number = $"
.code
main proc
    mov ax,@data
    mov ds,ax
    mov si,offset array
    mov cl,len
    dec cl
    mov al,[si]
    inc si
find_max:
    cmp al,[si]
    jae skip
    mov al,[si]
skip:
    inc si
    dec cl
    jnz find_max
    push ax
    mov dx,offset msg
    mov ah,9
    int 21h
    pop ax
    xor ah,ah
    aam
    mov bx,ax
    cmp bh,0
    je print_ones
    mov dl,bh
    add dl,48
    mov ah,2
    int 21h
print_ones:
    mov dl,bl
    add dl,48
    mov ah,2
    int 21h
    mov ah,4Ch
    int 21h
main endp
end main