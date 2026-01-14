.model small
.stack 100h
.data
vowel db 0
consonant db 0
vow db 10,13,"Vowels: $"
con db 10,13,"Consonants: $"
inp db 10,13,"Enter the characters: $" 
cont db 10,13,"Enter Y to continue: $"
.code
main proc
    mov ax,@data
    mov ds,ax
    
pre_start:    
    mov dx,offset inp
    mov ah,9
    int 21h   
    starting:
        
        mov ah,1
        int 21h
        
        
        
        cmp al,'a'
        je vowels
        
        cmp al,'e'
        je vowels
        
        cmp al,'i'
        je vowels
        
        cmp al,'o'
        je vowels
        
        cmp al,'u'
        je vowels
        
        cmp al,13
        je result
        
        jmp consonants
vowels:
    inc vowel
    jmp starting
consonants:
    inc consonant
    jmp starting

result:
    mov dx,offset vow
    mov ah,9
    int 21h
    
    mov dl,vowel
    add dl,48
    mov ah,2
    int 21h 
    
    mov vowel,0
    
    mov dx,offset con
    mov ah,9
    int 21h
    
    mov dl,consonant 
    add dl,48
    mov ah,2
    int 21h 
    
    mov consonant,0
    
    mov dx,offset cont
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    
    cmp al,'Y'
    je pre_start
    jne exit
    
exit:
    mov ah,4ch
    int 21h
    
              
	main endp
end main