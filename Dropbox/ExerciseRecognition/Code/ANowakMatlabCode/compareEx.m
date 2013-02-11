function [rTrain rTest] = compareEx(bss)

% Input:
% bss - upper bound for base parameter
% Output:
% rTrain - results for train set, rows corresponds to b values (odd numbers starting from 3), columns are Position 0, 1 and 2 respectively
% rTest - results for test set, rows corresponds to b values (odd numbers starting from 3), columns are Position 0, 1 and 2 respectively

% load all upper limb data
newData1 = load('-mat', 'allOldPatients.mat');
vars = fieldnames(newData1);

rTest = zeros(bss,1);
rTrain = zeros(bss,1);

for bs = 1:bss
    ae = zeros(50,6);
    ai = ae;
    ef = ae;
    fp = ae;
    fs = ae;
    sa = ae;
    se = ae;
    sf = ae;
    we = ae;
    wf = ae;
    wr = ae;
    wu = ae;

    a1 = 0;
    a2 = a1;
    a3 = a1;
    a4 = a1;
    a5 = a1;
    a6 = a1;
    a7 = a1;
    a8 = a1;
    a9 = a1;
    a10 = a1;
    a11 = a1;
    a12 = a1;

    % import all first rows of data
    for i = 1:length(vars)
        if(strmatch('ae', char(vars{i})))
            a1 = a1+1;
            ae(a1,:) = getNextRows3(newData1.(vars{i}), bs);

        end


       if(strmatch('ef', char(vars{i})))
           a3 = a3+1;
            ef(a3,:) = getNextRows3(newData1.(vars{i}), bs);

       end



       if(strmatch('sa', char(vars{i})))
           a6 = a6+1;
            sa(a6,:) = getNextRows3(newData1.(vars{i}), bs);

       end

       if(strmatch('se', char(vars{i})))
           a7 = a7+1;
            se(a7,:) = getNextRows3(newData1.(vars{i}), bs);

        end

        if(strmatch('sf', char(vars{i})))
            a8 = a8+1;
            sf(a8,:) = getNextRows3(newData1.(vars{i}), bs);

        end



    end

    ae = ae(1:a1,:);
  
    ef = ef(1:a3,:);

    sa = sa(1:a6,:);
    se = se(1:a7,:);
    sf = sf(1:a8,:);



    [xAE y] = size(ae);
 
    [xEF ~] = size(ef);
  
    [xSA ~] = size(sa);
    [xSE ~] = size(se);
    [xSF ~] = size(sf);
   
    trainSize = floor(xAE *2/3);


% train1 = [ef(1:trainSize,:);sa(1:trainSize,:);se(1:trainSize,:);sf(1:trainSize,:)];
% test1 = [ef((trainSize+1):xEF,:); sa((trainSize+1):xSA,:);se((trainSize+1):xSE,:);sf((trainSize+1):xSF,:)];
% 
% vec0 = [zeros(trainSize,1);ones(3*trainSize,1)];
% vec0test = [zeros(xEF-trainSize,1); ones(xSA-trainSize,1);ones(xSE-trainSize,1);ones(xSF-trainSize,1)];
% 
% model0 = svmtrain(vec0, train1);
% resultTrain0 = svmpredict(vec0, train1, model0);
% resultTest0 = svmpredict(vec0test, test1, model0);
% 
% 
% rTest(bs,:) = [countError(resultTest0,vec0test)];
% rTrain(bs,:) = [countError(resultTrain0,vec0)];

train1 = [se(1:trainSize,:);sf(1:trainSize,:)];
test1 = [se((trainSize+1):xSE,:);sf((trainSize+1):xSF,:)];

vec0 = [zeros(trainSize,1);ones(trainSize,1)];
vec0test = [zeros(xSE-trainSize,1);ones(xSF-trainSize,1)];

model0 = svmtrain(vec0, train1);
resultTrain0 = svmpredict(vec0, train1, model0);
resultTest0 = svmpredict(vec0test, test1, model0);


rTest(bs,:) = [countError(resultTest0,vec0test)];
rTrain(bs,:) = [countError(resultTrain0,vec0)];
end
end



function reduced = getNextRows2(input, times)
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
        reduced(1,(i-1)*4+1:i*4) = quaternionToYpr2(in(sizes(i,1),:));
    else
        reduced(1,(i-1)*4+1:i*4) = zeros(1,4);
    end
end
end

function ypr = quaternionToYpr2(qin)
    q(1:4) = qin(2:5);
    
    % projection of y axis 
    gx = q(1)*q(1) + q(2)*q(2) - q(3)*q(3) - q(4)*q(4);
    gy = 2 * (q(2)*q(3) + q(1)*q(4));
    gz = 2 * (q(2)*q(4) - q(1)*q(3));
    
    % projection of x axis
    nx = 2 * (q(2)*q(3) - q(1)*q(4));
    ny = q(1)*q(1) - q(2)*q(2) + q(3)*q(3) - q(4)*q(4);
    nz = 2 * (q(3)*q(4) + q(1)*q(2));
    
    % time stamp
    ypr(1) = qin(1);
    
    % heading
    ypr(2) = atan2(ny, nx);
    
    % elevation
    ypr(3) = atan2(nz, sqrt(nx*nx + ny*ny));
    
    % bank
    ypr(4) = atan2(gz, sqrt(gx*gx + gy*gy));
    
        
    % convert to degrees
    ypr(2) = (pi - ypr(2)) * 57.2957795131;
    ypr(3) = ypr(3) * -57.2957795131;
    ypr(4) = ypr(4) * 57.2957795131;
    
end


function reduced2 = getNextRows3(input, times)
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

reduced = zeros( 1, 6);


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
reduced2 = [reduced(1,1:3) - reduced(1,5:7) reduced(1,13:15) - reduced(1,17:19)] ;
end


function reduced2 = getNextRows4(input, times)
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

reduced = zeros( 1, 6);


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
        reduced(1,(i-1)*4+1:i*4) = quaternionToYpr2(in(sizes(i,1),:));
    else
        reduced(1,(i-1)*4+1:i*4) = zeros(1,4);
    end
end
reduced2 = [reduced(1,1:3) - reduced(1,5:7) reduced(1,13:15) - reduced(1,17:19)] ;
end
