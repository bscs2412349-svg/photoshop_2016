.model small
.stack 100h
.data
msg1 db 10,13, "Enter first number; $"
msg2 db 10,13, "Enter second number: $"
msg3 db 10,13, "Numbers are equal!!! $"
msg4 db 10,13, "Numbers are not equal!!! $"
msg5 db 10,13, "Num1 is greater than Num2 $" 
msg6 db 10,13, "Num1 is less than Num2 $" 

.code
main proc  
    
    ; input two numbers
    ; cmp use two compare those two values
    ; je >> jump if both the destination and source are equal
    
    ; cmp al , bl
    ; al- bl = 0
    ; je
     mov ax,@data
     mov ds,ax
     
     mov ah,9
     mov dx,offset msg1
     int 21h
     
     mov ah,1
     int 21h
     
     mov bl,al
     
     mov ah,9
     mov dx,offset msg2
     int 21h
     
     mov ah,1
     int 21h
     
     mov cl,al
     
     
     cmp bl,cl
     je IsEqual    ; je >> jump if equal
     
     ;cmp bl,cl
     ;jne IsNotEqual  ; jne >> jump if not equal
     
     cmp bl,cl
     jg IsGreater     ; jg >> jump if greater bl>cl
     
     cmp bl,cl        ;jl >> jump if less bl<cl
     jl IsLess
     
     mov ah,4ch
     int 21h
 main endp
IsEqual proc
    mov ah,9
    mov dx,offset msg3
    int 21h
    
    mov ah, 4ch
    int 21h
    IsEqual endp
IsNotEqual proc
    mov ah,9
    mov dx,offset msg4
    int 21h
    
    mov ah,4ch
    int 21h
    
    IsNotEqual endp  
IsGreater proc
    mov ah,9
    mov dx,offset msg5
    int 21h
    
    mov ah,4ch
    int 21h
    
    IsGreater endp 
IsLess proc
    mov ah,9
    mov dx,offset msg6
    int 21h
    
    mov ah,4ch
    int 21h
    
    IsLess endp

end main
