function res = getMeanOfLastNRecords(inp, name)


%array = dataset(:, 2:6);
in = sortrows(inp,2);
in = in(:,2:6);
    
in0 = size( find( in( :, 1) == 0 ), 1);
in1 = size( find( in( :, 1) == 1 ), 1);
in2 = size( find( in( :, 1) == 2 ), 1);
in3 = size( find( in( :, 1) == 3 ), 1);
in4 = size( find( in( :, 1) == 4 ), 1);
in5 = size( find( in( :, 1) == 5 ), 1);
in6 = size( find( in( :, 1) == 6 ), 1);

% sizes of subclasses of input data
% sizes contains endings of each class except last one
sizes = [in0 (in0+in1) (in0+in1+in2) (in0+in1+in2+in3) (in0+in1+in2+in3+in4) (in0+in1+in2+in3+in4+in5) size(in,1)];

% contains sizes of each of the classes
clSize = [in1 in2 in3 in4 in5 in6];

% when number of records for device is less than number of records
% requested
% every row corresponds to one device, columns corresponds to deviceNumber:
% q0 : q1 : q2 : q3
res1 = zeros(6,5);

numSafe = ones(6,1);
for i=1:6
    if(clSize(i)<1)
        res1(i, :) = [i zeros(1,4)];
    else
        numSafe(i) = min([i clSize(i)]);
        res1(i, :) = mean(in(sizes(i+1)-1-numSafe(i) : sizes(i+1)-1,:));
    end
    % res(1, (i-1)*4+1:i*4) = res1(i,2:5);
    
end

%return elbows
if (strmatch('e',name))
    res = [res1(2,2:5) res1(5,2:5)];
    
    % return wrists
else if (strmatch('w', name))
        res = [res1(3,2:5) res1(6,2:5)];
        
        %return arms
    else if (strmatch('a', name))
            res = [res1(1,2:5) res1(3,2:5)];
            
            % return all
        else 
            res = [res1(:,2)' res1(:,3)' res1(:,4)' res1(:,5)'];
        end
    end
end