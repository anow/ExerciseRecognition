%% Converts a string of 4 characters into a float
function result = chars2long(dataArray)
       i0 = sscanf(dec2hex(dataArray(1)), '%x'); 
       i1 = sscanf(dec2hex(dataArray(2)), '%x'); 
       i2 = sscanf(dec2hex(dataArray(3)), '%x'); 
       i3 = sscanf(dec2hex(dataArray(4)), '%x'); 

       result = bitor(bitsll(i0,24), bitsll(i1,16));
       result = bitor(result, bitsll(i2,8));
       result = bitor(result, i3);
       
       temp = dec2bin(result,32);
       result = sbin2dec(temp);
       if(result > 100000000)
           % sometimes data may not be formatted properly 
           % resulting in extreme timestamps
           
          disp('problem?'); 
       end
end