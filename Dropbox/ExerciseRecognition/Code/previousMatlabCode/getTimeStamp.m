%% Parses the timestamp value from 4 bytes
% timeIdx - the index of the time delimiter in fileAsString
function result = getTimeStamp(fileAsString, timeIdx)
    seekIdx = 1;
    timeArr = zeros(1,5);
    
    for i=1:4
       currentIdx = timeIdx - seekIdx;
       b = fileAsString(currentIdx); 
       if(str2double(dec2base(b,10)) == 254)
          % skip escape char
           seekIdx = seekIdx + 1;
          % xor previous byte with 0x20
          timeArr(1,5-i+1) = bitxor(timeArr(1,5-i+1), 32);
          
          b = fileAsString(timeIdx-seekIdx);
       end
       
       timeArr(1,5-i) = b;
       seekIdx = seekIdx + 1;
    end
    
    result = chars2long(timeArr);    
end