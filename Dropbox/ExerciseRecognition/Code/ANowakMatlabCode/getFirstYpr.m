function reduced = getFirstYpr(input)

% divide input data depending on the their source (device number)
in = sortrows(input(:,2:6),1);
in1 = find( in( :, 1) == 1 );
in2 = find( in( :, 1) == 2 );
in3 = find( in( :, 1) == 3 );
in4 = find( in( :, 1) == 4 );
in5 = find( in( :, 1) == 5 );
in6 = find( in( :, 1) == 6 );

reduced = zeros( 1, 18);
sizes = [in1;in2;in3;in4;in5;in6];

% reduce data in each subclass by factor 
%if(size(sizes)>0)
for i = 1 : 6
    ypr = quaternionToYpr(in(sizes(i,1),:));
    reduced(1,(i-1)*3+1:i*3) = ypr(1,2:4);
    end
%end