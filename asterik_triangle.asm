.model small
.stack 100h
.data
 star dw 1               
.code

main proc
               
    mov cx,@data         
    mov ds,cx
    
    mov cx,5             
    OuterLoop:           
    
    mov bx,cx           
    mov cx,star          
    
    InnerLoop:           
                        
    mov dl,'*'          
    mov ah,2
    int 21h
                    
    loop InnerLoop          
    
    inc star            
    
    mov dl,10            
    mov ah,2
    int 21h

    mov dl,13            
    mov ah,2
    int 21h

    mov cx,bx            
    loop OuterLoop       
    
    mov ah,4ch
    int 21h
    
    main endp
end main