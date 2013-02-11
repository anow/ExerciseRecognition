function rRes = compareYaws(bs)
% Input:
% bs - upper bound for base parameter
% Output:
% rTrain - results for train set, rows corresponds to b values (odd numbers starting from 3), columns are Position 0, 1 and 2 respectively
% rTest - results for test set, rows corresponds to b values (odd numbers starting from 3), columns are Position 0, 1 and 2 respectively

% load all upper limb data
newData1 = load('-mat', 'allOldPatients.mat');
vars = fieldnames(newData1);

rRes = zeros(bs+2,2);

ae = zeros(50,2);
ef = ae;
sa = ae;
se = ae;
sf = ae;
we = ae;
wf = ae;
wr = ae;
wu = ae;

a1 = 0;
a3 = a1;
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
        ae(a1,:) = getYawYpr(newData1.(vars{i}));  
    end
    
   if(strmatch('ef', char(vars{i})))
       a3 = a3+1;
        ef(a3,:) = getYawYpr(newData1.(vars{i}));
   end
    
   if(strmatch('sa', char(vars{i})))
       a6 = a6+1;
        sa(a6,:) = getYawYpr(newData1.(vars{i}));
   end
    
   if(strmatch('se', char(vars{i})))
       a7 = a7+1;
        se(a7,:) = getYawYpr(newData1.(vars{i}));
    end
    
    if(strmatch('sf', char(vars{i})))
        a8 = a8+1;
        sf(a8,:) = getYawYpr(newData1.(vars{i}));
    end
    
   if(strmatch('we', char(vars{i})))
       a9 = a9+1;
        we(a9,:) = getYawYpr(newData1.(vars{i}));
   end
   
    if(strmatch('wf', char(vars{i})))
          a10 = a10+1;
        wf(a10,:) = getYawYpr(newData1.(vars{i}));
    end
    
    if(strmatch('wr', char(vars{i})))
        a11 = a11+1;
        wr(a11,:) = getYawYpr(newData1.(vars{i}));
    end
    
   if(strmatch('wu', char(vars{i})))
       a12 = a12+1;
        wu(a12,:) = getYawYpr(newData1.(vars{i}));
    end
   
end


ef = ef(1:a3,:);
sa = sa(1:a6,:);
se = se(1:a7,:);
sf = sf(1:a8,:);
we = we(1:a9,:);
wf = wf(1:a10,:);
wr = wr(1:a11,:);
wu = wu(1:a12,:);




[xEF ~] = size(ef);
[xSA ~] = size(sa);
[xSE ~] = size(se);
[xSF ~] = size(sf);
[xWE ~] = size(we);
[xWF ~] = size(wf);
[xWR ~] = size(wr);
[xWU ~] = size(wu);
trainSize = floor(a1 *2/3);

% Position 1 
class1 = [ef(1:trainSize,:);sa(1:trainSize,:);se(1:trainSize,:);sf(1:trainSize,:)]; 
class2 = [we(1:trainSize,:);wf(1:trainSize,:);wr(1:trainSize,:);wu(1:trainSize,:)];
test1 = [ef((trainSize+1):xEF,:); sa((trainSize+1):xSA,:);se((trainSize+1):xSE,:);sf((trainSize+1):xSF,:)];%ones(xEF-trainSize,1)*(-1); ones(xSA-trainSize,1)*(-1); ones(xSE-trainSize,1)*(-1);ones(xSF-trainSize,1)*(-1)];
test2 = [we((trainSize+1):xWE,:);wf((trainSize+1):xWF,:);wr((trainSize+1):xWR,:);wu((trainSize+1):xWU,:)];%ones(xWE-trainSize,1);ones(xWF-trainSize,1);ones(xWR-trainSize,1);ones(xWU-trainSize,1)];

distObj1 = [ef(1:trainSize,:);sa(1:trainSize,:);se(1:trainSize,:);sf(1:trainSize,:)];
distObj2 = [we(1:trainSize,:);wf(1:trainSize,:);wr(1:trainSize,:);wu(1:trainSize,:)];
k = random('unif',1,4*trainSize,4*trainSize,1);
G = zeros(trainSize, 1);
for i=1:4*trainSize
    G(i) = pdist([distObj1(i,:); distObj2(floor(k(i,1)),:)]);
end
sigmaJ = mean(G); % median changed to mean
gammaJ = 1/(2*sigmaJ^2);

% checks different parameters
for i=0:bs
    b = 3+2*i;
    C2set=[b^(-1),1,b,b^2,b^3];
    G2set=[gammaJ*(b^(-3)),gammaJ*(b^(-2)),gammaJ*(b^(-1)),gammaJ,gammaJ*b,gammaJ*b^2,gammaJ*b^3];

    str5 = ['-b 1 -c ' num2str(gammaJ*(b^(-3))) ' -g ' num2str(b^2)];
    model5 = ovrtrain(class1, class2, str5);
    [pred acTrain decv] = ovrpredict(class1, class2, model5);
    [pred acTest decv] = ovrpredict(test1, test2, model5);
    
    rRes(i+1,2) = acTest*100;
    rRes(i+1,1) = acTrain*100;
end
end

function reduced = getYawYpr(input)
in1 = getY(input, 2);
in3 = getY(input, 5);
%in4 = getY(input, 4);

reduced = [in1, in3];
end

function res1 = getY(inp1, sensor)

res1 = zeros(1,1);
    a = find( inp1(1:50, 2) == sensor );
    if(isempty(a))
    else
        aa = quaternionToYpr(inp1(a,:));
        res1 = aa(1,2);
    end   
end
