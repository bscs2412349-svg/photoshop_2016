include 'emu8086.inc'
.model small
.stack 100h
.data
array db 9,5,7,8,1
.code
main proc 
    mov ax,@data
    mov ds,ax
    
    mov si,offset array
    mov bl,[si]
    mov cx,5
    max:
    cmp [si],bl
    jge maximum
    compare:
    inc si
    loop max
    
    mov dl,bl
    add dl,48
    mov ah,2
    int 21h
    
    mov ah,4ch
    int 21h
    
    maximum:
    mov bl,[si]
    jmp compare
    

   main endp
end main



