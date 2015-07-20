i = 0x01020304

case [i].pack('l') 
  when [i].pack('V') 
    puts 'LittleEndian' 
  when [i].pack('N') 
    puts 'BigEndian'
  end
