.model small
.stack 100h
.data  
   id db 'Awais$'
.code
main proc   
    mov ax,@data
    mov ds,ax
    
    mov dx,offset id
    mov ah,9
    int 21h
    
    mov ah,4ch
    int 21h
    
main endp
end main