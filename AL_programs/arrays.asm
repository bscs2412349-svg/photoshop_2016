include 'emu8086.inc'
.stack 100h
.model small

.data
   
   array db 3,5,6,7,9,1   

.code

       main proc
        
          mov ax,@data
          mov ds,ax
          
          mov si,offset array
          mov cx,6
          print 'Array Values: '
            loopx:
                mov dl,[si]
                add dl,48         
                mov ah,02h
                int 21h   
                
                mov dl,32
                mov ah,02h
                int 21h
                
                inc si  
            loop loopx
            
         mov ah,04ch
         int 21h
                
        
        
        
       main endp
  
end main