.model small
.stack 100h
.data
array db '2','4','5','9','8','6','1'
len db 7
result db "Total odd numbers = $"
count db 0
.code
main proc
    mov ax,@data
    mov ds,ax
    mov si,offset array
    mov cl,len
check:
    mov al,[si]
    sub al,48
    test al,1
    jz skip
    inc count
skip:
    inc si
    dec cl
    jnz check
    mov dx,offset result
    mov ah,9
    int 21h
    mov al,count
    add al,48
    mov dl,al
    mov ah,2
    int 21h
    mov ah,4Ch
    int 21h
main endp
end main