function res = halfSth(inp) 

shoulder1 = 1;
shoulder2 = 4;
elbow1 = 2;
elbow2 = 5;


% check specific row (half of exercise)
timeDiff = 450;
timeBound = inp(3,1) + timeDiff;

beg = find(inp(:,1) > timeBound);

halfEx = inp(beg(1,1) : size(inp),:);


%array = dataset(:, 2:6);
halfEx = sortrows(halfEx,2);

oneS = find( halfEx( :, 2) == shoulder1);
oneE = find( halfEx( :, 2) == elbow1);
twoS = find( halfEx( :, 2) == shoulder2);
twoE = find( halfEx( :, 2) == elbow2);


if(size(oneS,1)<1)
    oneS(1) = 1;
end
if (size(oneE,1)<1)
    oneE(1) = 1;
end

if(size(twoS,1)<1)
    twoS(1) = 1;
end
if (size(twoE,1)<1)
    twoE(1) = 1;
end

res = [halfEx(oneS(1),3:6) halfEx(oneE(1),3:6) halfEx(twoS(1),3:6) halfEx(twoE(1),3:6)];