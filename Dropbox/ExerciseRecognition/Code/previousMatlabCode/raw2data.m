%% Converts raw output to csv-like data
% similar to that of a log file
% filename - raw binary file logged from masternode
% timeStart - time (in ms) of data to parse (default = 0)
% timeEnd - time (in ms) of data to stop parsing (default = to end of file)

function actualResult = raw2data(filename, timeStart, timeEnd)
    
    %% open file to read
    fID = fopen(filename);
    if(fID == -1)
        error('Invalid file');
    end
    
    fileAsString = fread(fID, [1 inf], '*uint8');
    fclose(fID);
    
    if(nargin < 3)
        timeEnd = -1;
    end
    
    if(nargin < 2)
        timeStart = 0;
    end
    
    %% obtain an estimate of array size for pre-allocation
    len = size(fileAsString, 2);
    arraySize = floor(len/27);
    result = zeros(arraySize, 8);
    
    %% define delimiters we will search for
    startDel = ':';
    endDel = 10;
    timeDel = '=';
    
    %% begin parsing of raw string
    startOfTime = indexOf(fileAsString, timeDel, 1);
    startOfLine = indexOf(fileAsString, startDel, 1);
    i = 1;
    while(startOfLine ~= -1)
        endOfLine = indexOf(fileAsString, endDel, startOfLine);
        
        if(endOfLine ~= -1)
            % parse time stamp
            if(startOfTime ~= -1 && startOfLine > startOfTime)
               time = getTimeStamp(fileAsString, startOfTime);
               
               if(time < timeStart)
                   continue;
               end
               
               if(timeEnd ~= -1 && time > timeEnd)
                   break;
               end
               
               result(i,1) = time;
               
               % debug
               if(i>1 && (time - result(i-1,1)) > 1000)
                  disp('enormous time!'); 
                  time = getTimeStamp(fileAsString, startOfTime);
                  result(i,1) = time;
               end    
               
               startOfTime = indexOf(fileAsString, timeDel, endOfLine);
            else
               if(i>1)
                  result(i,1) = result(i-1,1) + 40;
               end
            end
            
            % parse node ID
            if(startOfLine > 2 && endOfLine > startOfLine+2)
                nodeID = str2num(dec2base(fileAsString(startOfLine-1),10));
                result(i,2) = nodeID;

                % parse data
                tline = substring(fileAsString, startOfLine+1, endOfLine);
                temp = parseRawLine(tline);
                result(i,3:2+size(temp,2)) = temp;
                i = i+1;
            end
        else
            break;
        end
        
        startOfLine = indexOf(fileAsString, startDel, endOfLine);
    end
    
    %% convert result to its actual size
     actualResult = result(1:i-1, :);
end