function reduced = getMeanYpr(input)

% divide input data depending on the their source (device number)
in = sortrows(input(:,2:6),1);
in1 = find( in( :, 1) == 1 );
in2 = find( in( :, 1) == 2 );
in3 = find( in( :, 1) == 3 );
in4 = find( in( :, 1) == 4 );
in5 = find( in( :, 1) == 5 );
in6 = find( in( :, 1) == 6 );

maxS = max([size(in1) size(in2) size(in3) size(in4) size(in5) size(in6)]);
reduced = zeros( 1, 18);
sizes = ones(maxS,6);
sizes(1:size(in1),1) = in1; 
sizes(1:size(in2),2) = in2;
sizes(1:size(in3),3) = in3;
sizes(1:size(in4),4) = in4;
sizes(1:size(in5),5) = in5;
sizes(1:size(in6),6) = in6;


% reduce data in each subclass by factor 
%if(size(sizes)>0)
for i = 1 : 6
    ypr = quaternionToYpr_array(input(sizes(1:7,i),:));
    reduced(1,(i-1)*3+1:i*3) = mean(ypr(:,2:4));
end
%end