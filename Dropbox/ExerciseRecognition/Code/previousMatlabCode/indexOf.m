function result = indexOf(input, delimiter, startIdx)
    % searches a byte array and returns the index
    % of the first occurance of the delimiter
    % from the specified start index
   
    for i=startIdx:size(input,2)
       if(input(i) == delimiter)
          result = i;
          return;
       end
    end
    
    result = -1;     
end