.model small
.stack 100h
.data
array db '2','4','5','9','8','6','4'
len db 7
result db "Total even numbers = $"
count db 0
.code
main proc
    mov ax,@data
    mov ds,ax
    mov si,offset array
    mov cl,len
check:
    mov al,[si]
    cmp al,'0'
    jb skip
    cmp al,'9'
    ja skip
    sub al,48
    test al,1
    jnz skip
    inc count
skip:
    inc si
    dec cl
    jnz check
    mov dx,offset result
    mov ah,9
    int 21h
    mov al,count
    xor ah,ah
    mov bl,10
    div bl
    mov bh,ah
    mov bl,al
    cmp bl,0
    je print_ones
    mov dl,bl
    add dl,48
    mov ah,2
    int 21h
print_ones:
    mov dl,bh
    add dl,48
    mov ah,2
    int 21h
    mov ah,4Ch
    int 21h
main endp
end main