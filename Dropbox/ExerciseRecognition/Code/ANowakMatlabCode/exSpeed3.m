function res = exSpeed3(inp)

shoulder1 = 1;
shoulder2 = 4;
elbow1 = 2;
elbow2 = 5;
wrist1 = 3;
wrist2 = 6;

% check specific row (half of exercise)
timeDiff = 450;
timeBound = inp(3,1) + timeDiff;

fin = find(inp(:,1) <= timeBound);

halfEx = inp(1: fin(size(fin),1),:);


%array = dataset(:, 2:6);
halfEx = sortrows(halfEx,2);

oneS = find( halfEx( :, 2) == shoulder1);
oneE = find( halfEx( :, 2) == elbow1);
oneW = find( halfEx( :, 2) == wrist1);
twoS = find( halfEx( :, 2) == shoulder2);
twoE = find( halfEx( :, 2) == elbow2);
twoW = find( halfEx( :, 2) == wrist2);

if(size(oneS,1)<1)
    oneS(1) = 1;
end
if (size(oneE,1)<1)
    oneE(1) = 1;
end
if (size(oneW,1)<1)
    oneW(1) = 1;
end

if(size(twoS,1)<1)
    twoS(1) = 1;
end
if (size(twoE,1)<1)
    twoE(1) = 1;
end
if (size(twoW,1)<1)
    twoW(1) = 1;
end


res1 = [(max(halfEx(oneS,3))- min(halfEx(oneS,3))) (max(halfEx(oneS,4))- min(halfEx(oneS,4))) (max(halfEx(oneS,5))- min(halfEx(oneS,5))) (max(halfEx(oneS,6))- min(halfEx(oneS,6))) size(oneS,1)];
res2 = [(max(halfEx(oneE,3))- min(halfEx(oneE,3))) (max(halfEx(oneE,4))- min(halfEx(oneE,4))) (max(halfEx(oneE,5))- min(halfEx(oneE,5))) (max(halfEx(oneE,6))- min(halfEx(oneE,6))) size(oneE,1)];
res3 = [(max(halfEx(oneW,3))- min(halfEx(oneW,3))) (max(halfEx(oneW,4))- min(halfEx(oneW,4))) (max(halfEx(oneW,5))- min(halfEx(oneW,5))) (max(halfEx(oneW,6))- min(halfEx(oneW,6))) size(oneW,1)];
res4 = [(max(halfEx(twoS,3))- min(halfEx(twoS,3))) (max(halfEx(twoS,4))- min(halfEx(twoS,4))) (max(halfEx(twoS,5))- min(halfEx(twoS,5))) (max(halfEx(twoS,6))- min(halfEx(twoS,6))) size(twoS,1)];
res5 = [(max(halfEx(twoE,3))- min(halfEx(twoE,3))) (max(halfEx(twoE,4))- min(halfEx(twoE,4))) (max(halfEx(twoE,5))- min(halfEx(twoE,5))) (max(halfEx(twoE,6))- min(halfEx(twoE,6))) size(twoE,1)];
res6 = [(max(halfEx(twoW,3))- min(halfEx(twoW,3))) (max(halfEx(twoW,4))- min(halfEx(twoW,4))) (max(halfEx(twoW,5))- min(halfEx(twoW,5))) (max(halfEx(twoW,6))- min(halfEx(twoW,6))) size(twoW,1)];

res = [sum(res1(:,1:4)) res1(:,5) (sum(res1(:,1:4))/res1(:,5)) sum(res2(:,1:4)) res2(:,5) (sum(res2(:,1:4))/res2(:,5)) sum(res3(:,1:4)) res3(:,5) (sum(res3(:,1:4))/res3(:,5)) sum(res4(:,1:4)) res4(:,5) (sum(res4(:,1:4))/res4(:,5)) sum(res5(:,1:4)) res5(:,5) (sum(res5(:,1:4))/res5(:,5))  sum(res6(:,1:4)) res6(:,5) (sum(res6(:,1:4))/res6(:,5)) size(inp,1)];
