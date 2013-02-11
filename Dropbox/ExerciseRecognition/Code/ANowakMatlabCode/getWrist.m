function res = getWrist(inp, name)
% 'a' for arms
% 'e' for elbows
% 'w' for wrists

% number of records to get mean from
n = 7;

%array = dataset(:, 2:6);
in = sortrows(inp,2);
in = in(:,2:6);
    
neck = size( find( in( :, 1) == 0 ), 1);
arm1 = size( find( in( :, 1) == 1 ), 1);
elbow1 = size( find( in( :, 1) == 2 ), 1);
wrist1 = size( find( in( :, 1) == 3 ), 1);
arm2 = size( find( in( :, 1) == 4 ), 1);
elbow2 = size( find( in( :, 1) == 5 ), 1);
wrist2 = size( find( in( :, 1) == 6 ), 1);

% sizes of subclasses of input data
% sizes contains endings of each class except last one
sizes = [neck (neck+arm1) (neck+arm1+elbow1) (neck+arm1+elbow1+wrist1) (neck+arm1+elbow1+wrist1+arm2) (neck+arm1+elbow1+wrist1+arm2+elbow2)];

% contains sizes of each of the classes
clSize = [arm1 elbow1 wrist1 arm2 elbow2 wrist2];

% when number of records for device is less than number of records
% requested
res1 = zeros(2,5);
res = zeros(1,8);
numSafe = ones(6,1);

for i=1:6
    if(clSize(i)<1)
        res1(i, :) = [i zeros(1,4)];
    else
        numSafe(i) = min([n clSize(i)]);
        res1(i, :) = mean(in(sizes(i)+1 : sizes(i)+1+numSafe(i),:));
    end
    % res(1, (i-1)*4+1:i*4) = res1(i,2:5);
    
end

if (strmatch('e',name))
    res = [res1(:,2)' res1(:,5)'];
else if (strmatch('w', name))
        res = [res1(:,3)' res1(:,6)'];
    else
            res = [res1(:,1)' res1(:,4)'];
    end
end
    
