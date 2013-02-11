%% Parses a line of raw data from node into a quaternion vector
function result = parseRawLine(tline)
    
    len = size(tline, 2);
       
    % pre-allocate space
    result = zeros(1,4);
    dataArray = zeros(1,len);
    idx = 1;
    c = 1;
        
    if(len < 16)
       for i=1:4
          result(1,i) = 0; 
       end
       return; 
    end
    
    while(c <= len)
        if(tline(1,c) == 254)
            % skip escape char and take the next one
            c = c + 1;
            
            if(c <= len)
                % xor subsequent byte with 0x20
                dataArray(1,idx) = bitxor(tline(c), 32);
                idx = idx + 1;
                c = c+1;
            end
        else
            dataArray(1,idx) = tline(c);
            idx = idx + 1;
            c = c+1;
        end
        
    end
    
    % detect errors
    if(idx < 17)
       disp('invalid line: too short!');
       for i=1:4
          result(1,i) = 0; 
       end
       return;
    end
    
    % parse into quaternion
    for i=0:3
       dataStr = dataArray(1,4*i+1:4*i+4);
       result(1,i+1) = fourBytesToLong(dataStr);

       % convert from long to float
       result(1,i+1) = result(1,i+1) / 100000000; 
    end
    
end