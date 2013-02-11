function res = exSpeed2(inp)

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


res1 = [sum(abs(gradient(halfEx(oneS,3)))) sum(abs(gradient(halfEx(oneS,4)))) sum(abs(gradient(halfEx(oneS,5)))) sum(abs(gradient(halfEx(oneS,6)))) size(oneS,1)];
res2 = [sum(abs(gradient(halfEx(oneE,3)))) sum(abs(gradient(halfEx(oneE,4)))) sum(abs(gradient(halfEx(oneE,5)))) sum(abs(gradient(halfEx(oneE,6)))) size(oneE,1)];
res3 = [sum(abs(gradient(halfEx(oneW,3)))) sum(abs(gradient(halfEx(oneW,4)))) sum(abs(gradient(halfEx(oneW,5)))) sum(abs(gradient(halfEx(oneW,6)))) size(oneW,1)];
res4 = [sum(abs(gradient(halfEx(twoS,3)))) sum(abs(gradient(halfEx(twoS,4)))) sum(abs(gradient(halfEx(twoS,5)))) sum(abs(gradient(halfEx(twoS,6)))) size(twoS,1)];
res5 = [sum(abs(gradient(halfEx(twoE,3)))) sum(abs(gradient(halfEx(twoE,4)))) sum(abs(gradient(halfEx(twoE,5)))) sum(abs(gradient(halfEx(twoE,6)))) size(twoE,1)];
res6 = [sum(abs(gradient(halfEx(twoW,3)))) sum(abs(gradient(halfEx(twoW,4)))) sum(abs(gradient(halfEx(twoW,5)))) sum(abs(gradient(halfEx(twoW,6)))) size(twoW,1)];

res = [sum(res1(:,1:4)) res1(:,5) (sum(res1(:,1:4))/res1(:,5)) sum(res2(:,1:4)) res2(:,5) (sum(res2(:,1:4))/res2(:,5)) sum(res3(:,1:4)) res3(:,5) (sum(res3(:,1:4))/res3(:,5)) sum(res4(:,1:4)) res4(:,5) (sum(res4(:,1:4))/res4(:,5)) sum(res5(:,1:4)) res5(:,5) (sum(res5(:,1:4))/res5(:,5))  sum(res6(:,1:4)) res6(:,5) (sum(res6(:,1:4))/res6(:,5)) size(inp,1)];

%  dev1 = [gradient(halfEx(oneS,3)) gradient(halfEx(oneS,4)) gradient(halfEx(oneS,5)) gradient(halfEx(oneS,6)) size(oneS)];
%  dev2 = [gradient(halfEx(oneE,3)) gradient(halfEx(oneE,4)) gradient(halfEx(oneE,5)) gradient(halfEx(oneE,6)) size(oneE)];
%  dev3 = [gradient(halfEx(oneW,3)) gradient(halfEx(oneW,4)) gradient(halfEx(oneW,5)) gradient(halfEx(oneW,6)) size(oneW)];
%  dev4 = [gradient(halfEx(twoS,3)) gradient(halfEx(twoS,4)) gradient(halfEx(twoS,5)) gradient(halfEx(twoS,6)) size(twoS)];
%  dev5 = [gradient(halfEx(twoE,3)) gradient(halfEx(twoE,4)) gradient(halfEx(twoE,5)) gradient(halfEx(twoE,6)) size(twoE)];
%  dev6 = [gradient(halfEx(twoW,3)) gradient(halfEx(twoW,4)) gradient(halfEx(twoW,5)) gradient(halfEx(twoW,6)) size(twoW)];
%  
% res1 = [sum(abs(dev1(:,1:4),2)) dev1(:,5) (sum(abs(dev1(:,1:4),2))/dev1(:,5))];
% res2 = [sum(abs(dev2(:,1:4),2)) dev2(:,5) (sum(abs(dev2(:,1:4),2))/dev2(:,5))];
% res3 = [sum(abs(dev3(:,1:4),2)) dev3(:,5) (sum(abs(dev3(:,1:4),2))/dev3(:,5))];
% res4 = [sum(abs(dev4(:,1:4),2)) dev4(:,5) (sum(abs(dev4(:,1:4),2))/dev4(:,5))];
% res5 = [sum(abs(dev5(:,1:4),2)) dev5(:,5) (sum(abs(dev5(:,1:4),2))/dev5(:,5))];
% res6 = [sum(abs(dev6(:,1:4),2)) dev6(:,5) (sum(abs(dev6(:,1:4),2))/dev6(:,5))];
