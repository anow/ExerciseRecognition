function reduced = getNextRows(input, times)
% function takes input and cuts off first part of it (up to the given timestamp "times")
% then it returns first row of reduced data set

% calculate number of rows to be reduced
row1 = 10*times;
%inIndx = find( input(:,1)>row1);
end1 = size(input,1);
input = input(row1:end1, :);

% divide reduced data depending on the their source (sensor number)
in = sortrows(input(:,2:6),1);
in1 = find( in( :, 1) == 1 );
in2 = find( in( :, 1) == 2 );
in3 = find( in( :, 1) == 3 );
in4 = find( in( :, 1) == 4 );
in5 = find( in( :, 1) == 5 );
in6 = find( in( :, 1) == 6 );

reduced = zeros( 1, 24);


if (isempty(in1))
    in1 = 0;
end
if (isempty(in2))
    in2 = 0;
end
if (isempty(in3))
    in3 = 0;
end
if (isempty(in4))
    in4 = 0;
end
if (isempty(in5))
    in5 = 0;
end
if (isempty(in6))
    in6 = 0;
end

sizes = [in1;in2;in3;in4;in5;in6];

% take first row of data from each of sensors
for i = 1 : 6
    if (sizes(i,1)>0)
        reduced(1,(i-1)*4+1:i*4) = in(sizes(i,1),2:5);
    else
        reduced(1,(i-1)*4+1:i*4) = zeros(1,4);
    end
end

