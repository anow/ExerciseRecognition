function [rTrain rTest] = lowerSVM2

newData1 = load('-mat', 'correctPatients.mat');

% Create new variables in the base workspace from those fields.
vars = fieldnames(newData1);

rowNum = 1;


sY = 100;
sX = 18;

herl0 = zeros(sY, sX);
hel0 = herl0;
hfl0 = herl0;
kfl0 = herl0;
afl0 = herl0;
haal0 = herl0;

a1 = 0;
a2 = a1;
a3 = a1;
a4 = a1;
a5 = a1;
a6 = a1;

rTest = zeros(bss,3);
rTrain = zeros(bss,3);


for i = 1:length(vars)
    if(strfind(char(vars{i}),'AF'))
        a1 = a1+1;
        aa = str2double(newData1.(vars{i}));
        afl(a1, 1:18) = aa(1,1:18);
        
    end

    
    if(strfind(char(vars{i}),'EHR'))
        a2 = a2+1;
        aa = str2double(newData1.(vars{i}));
        herl(a2,1:18) = aa(1,1:18);
    else
    
        if(strfind(char(vars{i}),'HE'))
            a3 = a3+1;
            aa = str2double(newData1.(vars{i}));
            hel(a3,1:18) = aa(1,1:18);
        end
    end
    
    if(strfind(char(vars{i}),'HF'))
        a4 = a4+1;
        aa = str2double(newData1.(vars{i}));
        hfl(a4, 1:18) = aa(1,1:18);
        
    end
    
    if(strfind(char(vars{i}),'KF'))
        a5 = a5+1;
        aa = str2double(newData1.(vars{i}));
        kfl(a5,1:18) = aa(1,1:18);
    end
    
   if(strfind(char(vars{i}),'HAA'))
       a6 = a6+1;
       aa = str2double(newData1.(vars{i}));
       haal(a6,1:18) = aa(1,1:18);
   end
   
end

hfl = hfl(1:a4,:);
kfl = kfl(1:a5,:);
afl = afl(1:a1,:);
haal = haal(1:a6,:);
herl = herl(1:a2,:);
hel = hel(1:a3,:);

hfl = [hfl(:,3:6) hfl(:,9:12) hfl(:,15:18)];
kfl = [kfl(:,3:6) kfl(:,9:12) kfl(:,15:18)];
afl = [afl(:,3:6) afl(:,9:12) afl(:,15:18)];
haal = [haal(:,3:6) haal(:,9:12) haal(:,15:18)];
herl = [herl(:,3:6) herl(:,9:12) herl(:,15:18)];
hel = [hel(:,3:6) hel(:,9:12) hel(:,15:18)];


xAE = min([a1 a2 a3 a4 a5 a6]);
trainSize = floor(xAE *2/3);

vec0 = [zeros(trainSize,1); zeros(trainSize,1); zeros(trainSize,1); zeros(trainSize,1); ones(trainSize,1); ones(trainSize,1)];
train1 = [hfl(1:trainSize,:); kfl(1:trainSize,:); afl(1:trainSize,:); haal(1:trainSize,:); herl(1:trainSize,:); hel(1:trainSize,:)];

vec0test = [zeros(a4-trainSize,1); zeros(a5-trainSize,1); zeros(a1-trainSize,1); zeros(a6-trainSize,1); ones(a2-trainSize,1); ones(a3-trainSize,1)];
test1 = [hfl((trainSize+1):a4,:); kfl((trainSize+1):a5,:); afl((trainSize+1):a1,:); haal((trainSize+1):a6,:); herl((trainSize+1):a2,:); hel((trainSize+1):a3,:)];
 
% position 0
distObj1 = [train1(1:2*trainSize,:); train1(3*trainSize+1:4*trainSize,:)];
distObj2 = train1(2*trainSize+1: length(train1),:);
numOfElem = 2*trainSize; 
k = random('unif',1,size(distObj1,1),numOfElem,1);
G = zeros(trainSize, 1);
for i=numOfElem
    G(i) = pdist([distObj1(floor(k(i,1)),:);distObj2(i,:)]);
end
sigmaJ = mean(G);
gammaJ = 1/(2*sigmaJ^2);
b = 2;
C2set=[b^(-1),1,b,b^2,b^3];
G2set=[gammaJ*(b^(-3)),gammaJ*(b^(-2)),gammaJ*(b^(-1)),gammaJ,gammaJ*b,gammaJ*b^2,gammaJ*b^3];
accuracy1=zeros(5,7);
for i=1:5
    for j=1:7
        str1=['-v 5 -c ' num2str(C2set(i)) ' -g ' num2str(G2set(j)) ' '];
        accuracy1(i,j)=svmtrain(vec0, train1, str1);   
    end
end
[value1, location1] = max(accuracy1(:));
[R2,C2] = ind2sub(size(accuracy1),location1);
str1 = ['-b 1 -c ' num2str(C2set(R2)) ' -g ' num2str(G2set(C2))];
model1 = svmtrain(vec1, train1, str1);
resultTrain0 = svmpredict(vec0, train1, model1);
resultTest0 = svmpredict(vec0test, test1, model1);


%position 1
vec1 = [ones(trainSize,1); zeros(trainSize,1)];
train1 = [herl(1:trainSize,:); hel(1:trainSize,:)];
vec1test = [ones(a2-trainSize,1); zeros(a3-trainSize,1)];
test1 = [herl((trainSize+1):a2,:); hel((trainSize+1):a3,:)];
str1 = ['-b 1 -c 50'];
model1 = svmtrain(vec1, train1, str1);
resultTrain1 = svmpredict(vec1, train1, model1);
resultTest1 = svmpredict(vec1test, test1, model1);

rTest(1,:) = [countError(resultTest0,vec0test) countError(resultTest1,vec1test)];
rTrain(1,:) = [countError(resultTrain0,vec0) countError(resultTrain1,vec1)];
end