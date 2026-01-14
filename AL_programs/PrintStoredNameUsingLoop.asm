.model small
.stack 100h
.data
    student db 'Awais'   
.code
main proc
    mov ax, @data
    mov ds, ax        

    mov si,0
    mov cx,5
label:
    mov dl,student[si]
    mov ah,2
    int 21h
    inc si
    
    loop label
    
    mov ah, 4Ch
    int 21h
main endp
end main
