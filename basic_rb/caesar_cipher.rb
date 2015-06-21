def caesar_cipher(str, offset)
    offstring = ''
    str.each_byte do |byte|
        offstring << byte_offset(byte, offset) 
    end
    offstring 
end

A = 65
Z = 90

def byte_offset(byte, offset)
    a = 97
    z = 122
    a, b = A, Z if (byte.between?(A, Z))
    
    return ((byte + offset - (a-1))%26 + (a-1)) if (byte.between?(a, z))
    return byte
end
        
caesar_cipher("What a string!", 5)  #=> "Bmfy f xywnsl!"   