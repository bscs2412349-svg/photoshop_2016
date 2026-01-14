.model small
.stack 100h
.data   
message db "Hello World$"                    ;created string of name message $ sign necessary
.code
main proc 
    mov ax,@data                             ;moving data from .data to ax
    mov ds,ax                                ;moving from ax to ds
    
    
    mov ah,9h                  ; function to display string message
    mov dx,offset message      ;offset of message string moved to dx for printing
    int 21h                    ;dos interrupt
    
    mov ah,4ch                 ;function terminate
    int 21h                    ;dos interrupt
    

main endp
end main
