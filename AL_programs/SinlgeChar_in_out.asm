.model small
.stack 100h
.data
.code
main proc
    mov ah,1 ;for taking single character input
    int 21h
    
    mov dl,al   ;what ever the input will be taken goes to AL. then we move it to dl for output
    mov ah,2 ;for displaying the output
    int 21h
    
    
    
    mov ah,4ch
    int 21h
main endp
end main