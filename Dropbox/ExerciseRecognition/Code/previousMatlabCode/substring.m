%% Extracts a portion of a string
function result = substring(str, start, endIdx)
    len = endIdx - start;
    for i=1:len
       result(1,i) = sscanf(dec2hex(str(1,start+i-1)),'%x'); 
    end
end