function reduced = getMeanSecYpr(input)

% divide input data depending on the their source (device number)
in1 = getMYpr(input, 1);
in2 = getMYpr(input, 2);
in3 = getMYpr(input, 3);
in4 = getMYpr(input, 4);
in5 = getMYpr(input, 5);
in6 = getMYpr(input, 6);


reduced = [in1, in2, in3, in4, in5, in6];
end

function res1 = getMYpr(inp1, sensor)

res1 = zeros(1,3);
    a = find( inp1(1:50, 2) == sensor );
    if(isempty(a))
    else
        aa = quaternionToYpr_array(inp1(a,:));
        res1 = mean(aa(:,2:4),1);
    end   
end