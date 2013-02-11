function res = efAngles(inp, dev1A, dev1B, dev2A, dev2B, num)

%array = dataset(:, 2:6);
in = sortrows(inp,2);
in = in(:,2:6);

oneAIdx = find( in( :, 1) == dev1A );
oneBIdx = find( in( :, 1) == dev1B );
twoAIdx = find( in( :, 1) == dev2A );
twoBIdx = find( in( :, 1) == dev2B );

in0 = size( oneAIdx, 1);
in1 = size( oneBIdx, 1);
in2 = size( twoAIdx, 1);
in3 = size( twoBIdx, 1);

resA = zeros(num,3);
resB = zeros(num,3);


if((in0<1) || (in2<1))
    resA = zeros(num,3);
else
    if((in0>=num) && (in2>=num))
        resA = in(oneAIdx(in0-num) : oneAIdx(in0),3:5) - in(twoAIdx(in2-num) : twoAIdx(in2),3:5);
    end
end

if((in1<1) || (in3<1))
    resB = zeros(num,3);
else
    if ((in1>=num) && (in3>=num))
        resB = in(oneBIdx(in1-num) : oneBIdx(in1),3:5) - in(twoBIdx(in3-num) : twoBIdx(in3),3:5);
    end 
end

res = [mean(resA) mean(resB)];
