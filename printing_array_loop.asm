.model small
.stack 100h
.data
 arr1 db 1,2,3,4,5          
.code

main proc
           
      mov dx,@data
      mov ds,dx 
      
      mov bx,offset arr1   
      
      mov cx,5
      printLoop:
      
      mov dl,[bx]         
      
      add dl,48           
      
      mov ah,2
      int 21h
      
      inc bx
      loop printLoop: 
      
      mov ah,4ch
      int 21h
    
    main endp
end main