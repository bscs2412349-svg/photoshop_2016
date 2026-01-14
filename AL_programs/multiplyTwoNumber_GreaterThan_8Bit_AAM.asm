.model small
.stack 100h
.data
.code 
main proc
  mov al,6   
mov bh,3    
mul bh       
AAM          ; AH=tens, AL=ones

; Move to BH/BL to print
mov bh, ah
mov bl, al

; Print tens
mov dl, bh
add dl, 48
mov ah, 2
int 21h

; Print ones
mov dl, bl
add dl, 48
mov ah, 2
int 21h

mov ah,4Ch
int 21h

    
    main endp
end main