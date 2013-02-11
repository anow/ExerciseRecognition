% Create new variables in the base workspace from those fields.


% csvFiles = dir('*.csv'); 
% numfiles = length(csvFiles);
% mydata = cell(1, numfiles);
% for k = 1:numfiles
%   mydata{k} = importdata(csvFiles(k).name);
% end
% vars = fieldnames(mydata);




newData1 = load('-mat', 'correctPatients.mat');

% Create new variables in the base workspace from those fields.
vars = fieldnames(newData1);

rowNum = 1;


sY = 100;
sX = 18;

% hirl = cell(sY, sX);
herl = cell(sY, sX);
hel = herl;
hfl = herl;
kfl = herl;
afl = herl;
haal = herl;

a1 = 0;
a2 = a1;
a3 = a1;
a4 = a1;
a5 = a1;
a6 = a1;
%a7 = a1;


for i = 1:length(vars)
    if(strfind(char(vars{i}),'AF'))
        a1 = a1+1;
        aa = newData1.(vars{i});
        afl(a1, 1:18) = aa(rowNum,1:18);
        
    end

    
    if(strfind(char(vars{i}),'EHR'))
        a2 = a2+1;
        aa = newData1.(vars{i});
        herl(a2,:) = aa(rowNum,1:18);
    else
    
        if(strfind(char(vars{i}),'HE'))
            a3 = a3+1;
            aa = newData1.(vars{i});
            hel(a3, 1:18) = aa(rowNum,1:18);
        end
    end
    
    if(strfind(char(vars{i}),'HF'))
        a4 = a4+1;
        aa = newData1.(vars{i});
        hfl(a4, 1:18) = aa(rowNum,1:18);
        
    end
    
    if(strfind(char(vars{i}),'KF'))
        a5 = a5+1;
        aa = newData1.(vars{i});
        kfl(a5, 1:18) = aa(rowNum,1:18);
        
    end
    
   if(strfind(char(vars{i}),'HAA'))
       a6 = a6+1;
       aa = newData1.(vars{i});
       haal(a6, 1:18) = aa(rowNum,1:18);
        
   end
   
end

hfl = hfl(1:a4,:);
kfl = kfl(1:a5,:);
afl = afl(1:a1,:);
haal = haal(1:a6,:);
herl = herl(1:a2,:);
hel = hel(1:a3,:);

xAE = min([a1 a2 a3 a4 a5 a6]);

trainSize = floor(xAE *2/3);
vec1 = [zeros(trainSize,1); zeros(trainSize,1); zeros(trainSize,1); zeros(trainSize,1); ones(trainSize,1); ones(trainSize,1)];
train1 = [hfl(1:trainSize,:); kfl(1:trainSize,:); afl(1:trainSize,:); haal(1:trainSize,:); herl(1:trainSize,:); hel(1:trainSize,:)];

vec1test = [zeros(a4-trainSize,1); zeros(a5-trainSize,1); zeros(a1-trainSize,1); zeros(a6-trainSize,1); ones(a2-trainSize,1); ones(a3-trainSize,1)];
test1 = [hfl((trainSize+1):a4,:); kfl((trainSize+1):a5,:); afl((trainSize+1):a1,:); haal((trainSize+1):a6,:); herl((trainSize+1):a2,:); hel((trainSize+1):a3,:)];

train1D = zeros(size(train1,1), size(train1,2));
for i=1:size(train1)
    for j=1:size(train1,2)
        train1D(i,j) = str2double(train1(i,j));
    end
end
train1D(:,1) = cell2mat(train1(:,1));
train1D(:,7) = cell2mat(train1(:,7));
train1D(:,13) = cell2mat(train1(:,13));


test1D = zeros(size(test1,1), size(test1,2));
for i=1:size(test1)
    for j=1:size(test1,2)
        test1D(i,j) = str2double(test1(i,j));
    end
end
test1D(:,1) = cell2mat(test1(:,1));
test1D(:,7) = cell2mat(test1(:,7));
test1D(:,13) = cell2mat(test1(:,13));


str1 = ['-b 1 -c 100 '];
model1 = svmtrain(vec1, train1D, str1);
% Find the number of classification errors on the training data
% and test data.
resultTrain2 = svmpredict(vec1, train1D, model1);
resultTest2 = svmpredict(vec1test, test1D, model1);

str1 = ['-b 1 -c 50 '];
model1 = svmtrain(vec1, train1D, str1);
% Find the number of classification errors on the training data
% and test data.
resultTrain2 = svmpredict(vec1, train1D, model1);
resultTest2 = svmpredict(vec1test, test1D, model1);


vec1 = [ones(trainSize,1); ones(trainSize,1)];
train1 = [herl(1:trainSize,:); hel(1:trainSize,:)];

vec1test = [zeros(a2-trainSize,1); ones(a3-trainSize,1)];
test1 = [herl((trainSize+1):a2,:); hel((trainSize+1):a3,:)];

train1D = zeros(size(train1,1), size(train1,2));
for i=1:size(train1)
    for j=1:size(train1,2)
        train1D(i,j) = str2double(train1(i,j));
    end
end
train1D(:,1) = cell2mat(train1(:,1));
train1D(:,7) = cell2mat(train1(:,7));
train1D(:,13) = cell2mat(train1(:,13));


test1D = zeros(size(test1,1), size(test1,2));
for i=1:size(test1)
    for j=1:size(test1,2)
        test1D(i,j) = str2double(test1(i,j));
    end
end
test1D(:,1) = cell2mat(test1(:,1));
test1D(:,7) = cell2mat(test1(:,7));
test1D(:,13) = cell2mat(test1(:,13));


distObj1 = train1D(1:trainSize,:);
distObj2 = train1D(1:trainSize,:);

k = random('unif',1,size(distObj2,1),size(distObj2,1),1);
G = zeros(trainSize, 1);
for i=trainSize
    G(i) = pdist([distObj1(i,:);distObj2(floor(k(i,1)),:)]);
end

sigmaJ = max(G);
gammaJ = 1/(2*sigmaJ^2);
b = 2;
C2set=[b^(-1),1,b,b^2,b^3];
G2set=[gammaJ*(b^(-3)),gammaJ*(b^(-2)),gammaJ*(b^(-1)),gammaJ,gammaJ*b,gammaJ*b^2,gammaJ*b^3];
accuracy1=zeros(5,7);
for i=1:5
    for j=1:7
        str1=['-v 5 -c ' num2str(C2set(i)) ' -g ' num2str(G2set(j)) ' '];
        accuracy1(i,j)=svmtrain(vec1, train1D, str1);   
    end
end
[value1, location1] = max(accuracy1(:));
[R2,C2] = ind2sub(size(accuracy1),location1);

model1 = svmtrain(vec1, train1D, str1);

resultTrain1 = svmpredict(vec1, train1D, model1);
resultTest1 = svmpredict(vec1test, test1D, model1);





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

bound = (1:50);

for i = 1:length(vars)
    if(strfind(char(vars{i}),'AF'))
        a1 = a1+1;
        aa = str2double(newData1.(vars{i}));
        afl0(a1, 1:18) = mean(aa(bound,1:18));
        
    end

    
    if(strfind(char(vars{i}),'EHR'))
        a2 = a2+1;
        aa = str2double(newData1.(vars{i}));
        herl0(a2,1:18) = mean(aa(bound,1:18));
    else
    
        if(strfind(char(vars{i}),'HE'))
            a3 = a3+1;
            aa = str2double(newData1.(vars{i}));
            hel0(a3,1:18) = mean(aa(bound,1:18));
        end
    end
    
    if(strfind(char(vars{i}),'HF'))
        a4 = a4+1;
        aa = str2double(newData1.(vars{i}));
        hfl0(a4, 1:18) = mean(aa(bound,1:18));
        
    end
    
    if(strfind(char(vars{i}),'KF'))
        a5 = a5+1;
        aa = str2double(newData1.(vars{i}));
        kfl0(a5,1:18) = mean(aa(bound,1:18));
    end
    
   if(strfind(char(vars{i}),'HAA'))
       a6 = a6+1;
       aa = str2double(newData1.(vars{i}));
       haal0(a6,1:18) = mean(aa(bound,1:18));
   end
   
end

hfl0 = hfl0(1:a4,:);
kfl0 = kfl0(1:a5,:);
afl0 = afl0(1:a1,:);
haal0 = haal0(1:a6,:);
herl0 = herl0(1:a2,:);
hel0 = hel0(1:a3,:);


%% I heep measuring them and yet they contained timestamps!! try to run
%% again without timestamps
hfl0 = [hfl0(:,2:6) hfl0(:,8:12) hfl0(:,14:18)];
kfl0 = [kfl0(:,2:6) kfl0(:,8:12) kfl0(:,14:18)];
afl0 = [afl0(:,2:6) afl0(:,8:12) afl0(:,14:18)];
haal0 = [haal0(:,2:6) haal0(:,8:12) haal0(:,14:18)];
herl0 = [herl0(:,2:6) herl0(:,8:12) herl0(:,14:18)];
hel0 = [hel0(:,2:6) hel0(:,8:12) hel0(:,14:18)];

% without timestamps
hfl = [hfl(:,3:6) hfl(:,9:12) hfl(:,15:18)];
kfl = [kfl(:,3:6) kfl(:,9:12) kfl(:,15:18)];
afl = [afl(:,3:6) afl(:,9:12) afl(:,15:18)];
haal = [haal(:,3:6) haal(:,9:12) haal(:,15:18)];
herl = [herl(:,3:6) herl(:,9:12) herl(:,15:18)];
hel = [hel(:,3:6) hel(:,9:12) hel(:,15:18)];

herl0 = [herl0(:,2:6) herl0(:,7:10) herl0(:,12:15)];
hel0 = [hel0(:,2:6) hel0(:,7:10) hel0(:,12:15)];




xAE = min([a1 a2 a3 a4 a5 a6]);

trainSize = floor(xAE *2/3);
vec1 = [zeros(trainSize,1); zeros(trainSize,1); zeros(trainSize,1); zeros(trainSize,1); ones(trainSize,1); ones(trainSize,1)];
train1 = [hfl(1:trainSize,:); kfl(1:trainSize,:); afl(1:trainSize,:); haal(1:trainSize,:); herl(1:trainSize,:); hel(1:trainSize,:)];

vec1test = [zeros(a4-trainSize,1); zeros(a5-trainSize,1); zeros(a1-trainSize,1); zeros(a6-trainSize,1); ones(a2-trainSize,1); ones(a3-trainSize,1)];
test1 = [hfl((trainSize+1):a4,:); kfl((trainSize+1):a5,:); afl((trainSize+1):a1,:); haal((trainSize+1):a6,:); herl((trainSize+1):a2,:); hel((trainSize+1):a3,:)];


str1 = ['-b 1 -c 50'];
model1 = svmtrain(vec1, train1, str1);

resultTrain1 = svmpredict(vec1, train1, model1);
resultTest1 = svmpredict(vec1test, test1, model1);



distObj1 = train1(1:2*trainSize,:);
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
        accuracy1(i,j)=svmtrain(vec1, train1, str1);   
    end
end
[value1, location1] = max(accuracy1(:));
[R2,C2] = ind2sub(size(accuracy1),location1);
str1 = ['-b 1 -c ' num2str(C2set(R2)) ' -g ' num2str(G2set(C2))];
model1 = svmtrain(vec1, train1, str1);
resultTrain1 = svmpredict(vec1, train1, model1);
resultTest1 = svmpredict(vec1test, test1, model1);



sY = 100;
sX = 18;

herl = zeros(sY, sX);
hel = herl;
hfl = herl;
kfl = herl;
afl = herl;
haal = herl;

a1 = 0;
a2 = a1;
a3 = a1;
a4 = a1;
a5 = a1;
a6 = a1;

bound = 30;

for i = 1:length(vars)
    if(strfind(char(vars{i}),'AF'))
        a1 = a1+1;
        aa = str2double(newData1.(vars{i}));
        afl(a1, 1:18) = (aa(bound,1:18));
        
    end

    
    if(strfind(char(vars{i}),'EHR'))
        a2 = a2+1;
        aa = str2double(newData1.(vars{i}));
        herl(a2,1:18) = (aa(bound,1:18));
    else
    
        if(strfind(char(vars{i}),'HE'))
            a3 = a3+1;
            aa = str2double(newData1.(vars{i}));
            hel(a3,1:18) = (aa(bound,1:18));
        end
    end
    
    if(strfind(char(vars{i}),'HF'))
        a4 = a4+1;
        aa = str2double(newData1.(vars{i}));
        hfl(a4, 1:18) = (aa(bound,1:18));
        
    end
    
    if(strfind(char(vars{i}),'KF'))
        a5 = a5+1;
        aa = str2double(newData1.(vars{i}));
        kfl(a5,1:18) = (aa(bound,1:18));
    end
    
   if(strfind(char(vars{i}),'HAA'))
       a6 = a6+1;
       aa = str2double(newData1.(vars{i}));
       haal(a6,1:18) = (aa(bound,1:18));
   end
   
end

hfl = hfl(1:a4,:);
kfl = kfl(1:a5,:);
afl = afl(1:a1,:);
haal = haal(1:a6,:);
herl = herl(1:a2,:);
hel = hel(1:a3,:);

% hfl = (hfl(:,3:6)) .* (hfl(:,9:12)) .* (hfl(:,15:18));
% kfl = (kfl(:,3:6)) .* (kfl(:,9:12)) .* (kfl(:,15:18));
% afl = (afl(:,3:6)) .* (afl(:,9:12)) .* (afl(:,15:18));
% haal = (haal(:,3:6)).* (haal(:,9:12)).* (haal(:,15:18));
% herl = (herl(:,3:6)).* (herl(:,9:12)).* (herl(:,15:18));
% hel = (hel(:,3:6)).* (hel(:,9:12)).* (hel(:,15:18));


xAE = min([a1 a2 a3 a4 a5 a6]);

trainSize = floor(xAE *2/3);
vec1 = [zeros(trainSize,1); zeros(trainSize,1); zeros(trainSize,1); zeros(trainSize,1); ones(trainSize,1); ones(trainSize,1)];
train1 = [hfl(1:trainSize,:); kfl(1:trainSize,:); afl(1:trainSize,:); haal(1:trainSize,:); herl(1:trainSize,:); hel(1:trainSize,:)];

vec1test = [zeros(a4-trainSize,1); zeros(a5-trainSize,1); zeros(a1-trainSize,1); zeros(a6-trainSize,1); ones(a2-trainSize,1); ones(a3-trainSize,1)];
test1 = [hfl((trainSize+1):a4,:); kfl((trainSize+1):a5,:); afl((trainSize+1):a1,:); haal((trainSize+1):a6,:); herl((trainSize+1):a2,:); hel((trainSize+1):a3,:)];


str1 = ['-b 1 -c 50'];
model1 = svmtrain(vec1, train1, str1);

resultTrain1 = svmpredict(vec1, train1, model1);
resultTest1 = svmpredict(vec1test, test1, model1);



%vector part of quaternion
col1 = 3;
col2 = 6;
col3 = 9;
col4 = 12;
col5 = 15;
col6 = 18;
hfl2 = [cross(hfl(:,col3:col4),hfl(:,col1:col2)) cross(hfl(:,col3:col4),hfl(:,col5:col6))];
kfl2 = [cross(kfl(:,col3:col4),kfl(:,col1:col2)) cross(kfl(:,col3:col4),kfl(:,col5:col6))];
afl2 = [cross(afl(:,col3:col4),afl(:,col1:col2))  cross(afl(:,col3:col4),afl(:,col5:col6))];
haal2 = [cross(haal(:,col3:col4),haal(:,col1:col2)) cross(haal(:,col3:col4),haal(:,col5:col6))];
herl2 = [cross(herl(:,col3:col4),herl(:,col1:col2)) cross(herl(:,col3:col4),herl(:,col5:col6))];
hel2 = [cross(hel(:,col3:col4),hel(:,col1:col2)) cross(hel(:,col3:col4),hel(:,col5:col6))];



for i=1:size(hfl,1)
    hfl3(i,:) = [sum(hfl(i,col3:col4)'*hfl(i,col1:col2)) sum(hfl(i,col3:col4)'*hfl(i,col5:col6))];
end
for i=1:size(kfl,1)
    kfl3(i,:) = [sum(kfl(i,col3:col4)'*kfl(i,col1:col2)) sum(kfl(i,col3:col4)'*kfl(i,col5:col6))];
end
for i=1:size(afl,1)
    afl3(i,:) = [sum(afl(i,col3:col4)'*afl(i,col1:col2)) sum(afl(i,col3:col4)'*afl(i,col5:col6))];
end
for i=1:size(haal,1)
    haal3(i,:) = [sum(haal(i,col3:col4)'*haal(i,col1:col2)) sum(haal(i,col3:col4)'*haal(i,col5:col6))];
end
for i=1:size(herl,1)
    herl3(i,:) = [sum(herl(i,col3:col4)'*herl(i,col1:col2)) sum(herl(i,col3:col4)'*herl(i,col5:col6))];
end
for i=1:size(hel,1)
    hel3(i,:) = [sum(hel(i,col3:col4)'*hel(i,col1:col2)) sum(hel(i,col3:col4)'*hel(i,col5:col6))];
end

xAE = min([a1 a2 a3 a4 a5 a6]);

trainSize = floor(xAE *2/3);
vec3 = [zeros(trainSize,1); zeros(trainSize,1); zeros(trainSize,1); zeros(trainSize,1); ones(trainSize,1); ones(trainSize,1)];
train3 = [hfl3(1:trainSize,:); kfl3(1:trainSize,:); afl3(1:trainSize,:); haal3(1:trainSize,:); herl3(1:trainSize,:); hel3(1:trainSize,:)];

vec3test = [zeros(a4-trainSize,1); zeros(a5-trainSize,1); zeros(a1-trainSize,1); zeros(a6-trainSize,1); ones(a2-trainSize,1); ones(a3-trainSize,1)];
test3 = [hfl3((trainSize+1):a4,:); kfl3((trainSize+1):a5,:); afl3((trainSize+1):a1,:); haal3((trainSize+1):a6,:); herl3((trainSize+1):a2,:); hel3((trainSize+1):a3,:)];


str3 = ['-b 1 -c 50'];
model3 = svmtrain(vec3, train3, str3);

resultTrain3 = svmpredict(vec3, train3, model3);
resultTest3 = svmpredict(vec3test, test3, model3);

%%%%%%%%%%%%%%%%%%%%%




%vector part of quaternion
col1 = 3;
col2 = 6;
col3 = 9;
col4 = 12;
col5 = 15;
col6 = 18;
hfl = [hfl(:,col1:col2) hfl(:,col3:col4) hfl(:,col5:col6)];
kfl = [kfl(:,col1:col2) kfl(:,col3:col4) kfl(:,col5:col6)];
afl = [afl(:,col1:col2) afl(:,col3:col4) afl(:,col5:col6)];
haal = [haal(:,col1:col2) haal(:,col3:col4) haal(:,col5:col6)];
herl = [herl(:,col1:col2) herl(:,col3:col4) herl(:,col5:col6)];
hel = [hel(:,col1:col2) hel(:,col3:col4) hel(:,col5:col6)];



xAE = min([a2 a3]);

trainSize = floor(xAE *2/3);
vec1 = [zeros(trainSize,1); ones(trainSize,1)];
train1 = [herl(1:trainSize,:); hel(1:trainSize,:)];

vec1test = [zeros(a2-trainSize,1); ones(a3-trainSize,1)];
test1 = [herl((trainSize+1):a2,:); hel((trainSize+1):a3,:)];


str1 = ['-b 1 -c 50'];
model1 = svmtrain(vec1, train1, str1);

resultTrain1 = svmpredict(vec1, train1, model1);
resultTest1 = svmpredict(vec1test, test1, model1);



distObj1 = herl(1:trainSize,:);
distObj2 = hel(1:trainSize,:);

numOfElem = trainSize; 

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
        accuracy1(i,j)=svmtrain(vec1, train1, str1);   
    end
end
[value1, location1] = max(accuracy1(:));
[R2,C2] = ind2sub(size(accuracy1),location1);
str1 = ['-b 1 -c ' num2str(C2set(R2)) ' -g ' num2str(G2set(C2))];
model1 = svmtrain(vec1, train1, str1);
resultTrain1 = svmpredict(vec1, train1, model1);
resultTest1 = svmpredict(vec1test, test1, model1);



%% distinguish between exercises from position0
col1 = 1;
col2 = 6;
hfl2 = hfl(:,col1:col2);
kfl2 = kfl(:,col1:col2);
afl2 = afl(:,col1:col2);
haal2 = haal(:,col1:col2);

xAE = min([a1 a4 a5 a6]);
trainSize = floor(xAE *2/3);
vec1 = [zeros(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(trainSize,1)];
train1 = [hfl2(1:trainSize,:); kfl2(1:trainSize,:); afl2(1:trainSize,:); haal2(1:trainSize,:)];
vec1test = [zeros(a4-trainSize,1); ones(a5-trainSize,1); ones(a1-trainSize,1); ones(a6-trainSize,1)];
test1 = [hfl2((trainSize+1):a4,:); kfl2((trainSize+1):a5,:); afl2((trainSize+1):a1,:); haal2((trainSize+1):a6,:)];
str1 = ['-b 1 -c 50'];
model1 = svmtrain(vec1, train1, str1);
resultTrain1 = svmpredict(vec1, train1, model1);
resultTest1 = svmpredict(vec1test, test1, model1);



distObj1 = [kfl2(1:trainSize,:); haal2(1:trainSize,:)];
distObj2 = [afl2(1:trainSize,:); hfl2(1:trainSize,:)];
numOfElem = 2*trainSize; 
k = random('unif',1,size(distObj1,1),numOfElem,1);
G = zeros(trainSize, 1);
for i=numOfElem
    G(i) = pdist([distObj1(floor(k(i,1)),:);distObj2(i,:)]);
end
sigmaJ = mean(G);
gammaJ = 1/(2*sigmaJ^2);




col1 = 9;
col2 = 12;
hfl2 = hfl(:,col1:col2);
kfl2 = kfl(:,col1:col2);
afl2 = afl(:,col1:col2);
haal2 = haal(:,col1:col2);


b = 2;
C2set=[b^(-1),1,b,b^2,b^3];
G2set=[gammaJ*(b^(-3)),gammaJ*(b^(-2)),gammaJ*(b^(-1)),gammaJ,gammaJ*b,gammaJ*b^2,gammaJ*b^3];
accuracy1=zeros(5,7);
for i=1:5
    for j=1:7
        str1=['-v 5 -c ' num2str(C2set(i)) ' -g ' num2str(G2set(j)) ' '];
        accuracy1(i,j)=svmtrain(vec1, train1, str1);   
    end
end
[value1, location1] = max(accuracy1(:));
[R2,C2] = ind2sub(size(accuracy1),location1);
str1 = ['-b 1 -c ' num2str(C2set(R2)) ' -g ' num2str(G2set(C2))];
model1 = svmtrain(vec1, train1, str1);
resultTrain1 = svmpredict(vec1, train1, model1);
resultTest1 = svmpredict(vec1test, test1, model1);

xAE = min([a1 a4 a5 a6]);
trainSize = floor(xAE *2/3);
vec1 = [zeros(trainSize,1); zeros(trainSize,1); ones(trainSize,1); ones(trainSize,1)];
train1 = [hfl2(1:trainSize,:); kfl2(1:trainSize,:); afl2(1:trainSize,:); haal2(1:trainSize,:)];
vec1test = [zeros(a4-trainSize,1); zeros(a5-trainSize,1); ones(a1-trainSize,1); ones(a6-trainSize,1)];
test1 = [hfl2((trainSize+1):a4,:); kfl2((trainSize+1):a5,:); afl2((trainSize+1):a1,:); haal2((trainSize+1):a6,:)];
str1 = ['-b 1 -c 50'];
model1 = svmtrain(vec1, train1, str1);
resultTrain1 = svmpredict(vec1, train1, model1);
resultTest1 = svmpredict(vec1test, test1, model1);



col1 = 1;
col2 = 3;
col3 = 7;
col4 = 9;
hfl2 = [hfl(:,col1:col2) hfl(:,col3:col4)];
kfl2 = [kfl(:,col1:col2) kfl(:,col3:col4)];
afl2 = [afl(:,col1:col2) afl(:,col3:col4)];
haal2 = [haal(:,col1:col2) haal(:,col3:col4)];



col1 = 1;
col2 = 3;
col3 = 4;
col4 = 6;
col5 = 7;
col6 = 9;
hfl2 = [cross(hfl(:,col3:col4),hfl(:,col1:col2)) cross(hfl(:,col3:col4),hfl(:,col5:col6))];
kfl2 = [cross(kfl(:,col3:col4),kfl(:,col1:col2)) cross(kfl(:,col3:col4),kfl(:,col5:col6))];
afl2 = [cross(afl(:,col3:col4),afl(:,col1:col2))  cross(afl(:,col3:col4),afl(:,col5:col6))];
haal2 = [cross(haal(:,col3:col4),haal(:,col1:col2)) cross(haal(:,col3:col4),haal(:,col5:col6))];
herl2 = [cross(herl(:,col3:col4),herl(:,col1:col2)) cross(herl(:,col3:col4),herl(:,col5:col6))];
hel2 = [cross(hel(:,col3:col4),hel(:,col1:col2)) cross(hel(:,col3:col4),hel(:,col5:col6))];


xAE = min([a1 a4 a5 a6]);
trainSize = floor(xAE *2/3);
vec1 = [zeros(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(trainSize,1)];
train1 = [hfl2(1:trainSize,:); kfl2(1:trainSize,:); afl2(1:trainSize,:); haal2(1:trainSize,:)];
vec1test = [zeros(a4-trainSize,1); ones(a5-trainSize,1); ones(a1-trainSize,1); ones(a6-trainSize,1)];
test1 = [hfl2((trainSize+1):a4,:); kfl2((trainSize+1):a5,:); afl2((trainSize+1):a1,:); haal2((trainSize+1):a6,:)];
str1 = ['-b 1 -c 50'];
model1 = svmtrain(vec1, train1, str1);
resultTrain1 = svmpredict(vec1, train1, model1);
resultTest1 = svmpredict(vec1test, test1, model1);



hfl2 = [hfl(:,3:6) hfl(:,9:12) hfl(:,15:18)];
kfl2 = [kfl(:,3:6) kfl(:,9:12) kfl(:,15:18)];
afl2 = [afl(:,3:6) afl(:,9:12) afl(:,15:18)];
haal2 = [haal(:,3:6) haal(:,9:12) haal(:,15:18)];
herl2 = [herl(:,3:6) herl(:,9:12) herl(:,15:18)];
hel2 = [hel(:,3:6) hel(:,9:12) hel(:,15:18)];

xAE = min([a1 a2 a3 a4 a5 a6]);

trainSize = floor(xAE *2/3);
vec2 = [zeros(trainSize,1); zeros(trainSize,1); zeros(trainSize,1); zeros(trainSize,1); ones(trainSize,1); ones(trainSize,1)];
train2 = [hfl2(1:trainSize,:); kfl2(1:trainSize,:); afl2(1:trainSize,:); haal2(1:trainSize,:); herl2(1:trainSize,:); hel2(1:trainSize,:)];

vec2test = [zeros(a4-trainSize,1); zeros(a5-trainSize,1); zeros(a1-trainSize,1); zeros(a6-trainSize,1); ones(a2-trainSize,1); ones(a3-trainSize,1)];
test2 = [hfl2((trainSize+1):a4,:); kfl2((trainSize+1):a5,:); afl2((trainSize+1):a1,:); haal2((trainSize+1):a6,:); herl2((trainSize+1):a2,:); hel2((trainSize+1):a3,:)];


str2 = ['-b 1 -c 50'];
model2 = svmtrain(vec2, train2, str2);

resultTrain2 = svmpredict(vec2, train2, model2);
resultTest2 = svmpredict(vec2test, test2, model2);


distObj1 = train2(1:4*trainSize,:);
distObj2 = train2(4*trainSize+1: length(train1),:);
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
        accuracy1(i,j)=svmtrain(vec2, train2, str1);   
    end
end
[value1, location1] = max(accuracy1(:));
[R2,C2] = ind2sub(size(accuracy1),location1);
str1 = ['-b 1 -c ' num2str(C2set(R2)) ' -g ' num2str(G2set(C2))];
model1 = svmtrain(vec2, train2, str1);
resultTrain1 = svmpredict(vec2, train2, model1);
resultTest1 = svmpredict(vec2test, test2, model1);



xAE = min([a2 a3]);
trainSize = floor(xAE *2/3);
vec1 = [zeros(trainSize,1); ones(trainSize,1)];
train1 = [herl2(1:trainSize,:); hel2(1:trainSize,:)];
vec1test = [zeros(a2-trainSize,1); ones(a3-trainSize,1)];
test1 = [herl2((trainSize+1):a2,:); hel2((trainSize+1):a3,:)];
str1 = ['-b 1 -c 50'];
model1 = svmtrain(vec1, train1, str1);
resultTrain1 = svmpredict(vec1, train1, model1);
resultTest1 = svmpredict(vec1test, test1, model1);


distObj1 = herl2(1:trainSize,:);
distObj2 = hel2(1:trainSize,:);
numOfElem = trainSize; 
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
        accuracy1(i,j)=svmtrain(vec1, train1, str1);   
    end
end
[value1, location1] = max(accuracy1(:));
[R2,C2] = ind2sub(size(accuracy1),location1);
str1 = ['-b 1 -c ' num2str(C2set(R2)) ' -g ' num2str(G2set(C2))];
model1 = svmtrain(vec1, train1, str1);
resultTrain1 = svmpredict(vec1, train1, model1);
resultTest1 = svmpredict(vec1test, test1, model1);


%% recognize particular exercises
% afrer some fixed timestamp - new dataset is needed

hfl2 = [hfl(:,3:6) hfl(:,9:12) hfl(:,15:18)];
kfl2 = [kfl(:,3:6) kfl(:,9:12) kfl(:,15:18)];
afl2 = [afl(:,3:6) afl(:,9:12) afl(:,15:18)];
haal2 = [haal(:,3:6) haal(:,9:12) haal(:,15:18)];



a1 = 0;
a2 = a1;
a3 = a1;
a4 = a1;
a5 = a1;
a6 = a1;

for i = 1:length(vars)
    if(strfind(char(vars{i}),'AF'))
        a1 = a1+1;
        aa = (newData1.(vars{i}));
        afl(a1,19) = size(aa,1);
        
    end

    
    if(strfind(char(vars{i}),'EHR'))
        a2 = a2+1;
        aa = newData1.(vars{i});
        herl(a2,19) = size(aa,1);
    else
    
        if(strfind(char(vars{i}),'HE'))
            a3 = a3+1;
            aa = (newData1.(vars{i}));
            hel(a3,19) = size(aa,1);
        end
    end
    
    if(strfind(char(vars{i}),'HF'))
        a4 = a4+1;
        aa = newData1.(vars{i});
        hfl(a4,19) = size(aa,1);
        
    end
    
    if(strfind(char(vars{i}),'KF'))
        a5 = a5+1;
        aa = (newData1.(vars{i}));
        kfl(a5,19) = size(aa,1);
    end
    
   if(strfind(char(vars{i}),'HAA'))
       a6 = a6+1;
       aa = (newData1.(vars{i}));
       haal(a6,19) = size(aa,1);
   end
   
end


sizes = [hfl(:,19) kfl(:,19) afl(:,19) haal(:,19)];


xAE = min([a1 a4 a5 a6]);
trainSize = floor(xAE *2/3);
vec1 = [zeros(trainSize,1); zeros(trainSize,1); ones(trainSize,1); zeros(trainSize,1)];
train1 = [hfl2(1:trainSize,:); kfl2(1:trainSize,:); afl2(1:trainSize,:); haal2(1:trainSize,:)];
vec1test = [zeros(a4-trainSize,1); zeros(a5-trainSize,1); ones(a1-trainSize,1); zeros(a6-trainSize,1)];
test1 = [hfl2((trainSize+1):a4,:); kfl2((trainSize+1):a5,:); afl2((trainSize+1):a1,:); haal2((trainSize+1):a6,:)];
str1 = ['-b 1 -c 50'];
model1 = svmtrain(vec1, train1, str1);
resultTrain1 = svmpredict(vec1, train1, model1);
resultTest1 = svmpredict(vec1test, test1, model1);


distObj1 = [train1(1:2*trainSize,:); train1(3*trainSize+1:length(train1),:)];
distObj2 = train1(2*trainSize+1: 3*trainSize,:);
numOfElem = trainSize; 
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
        accuracy1(i,j)=svmtrain(vec1, train1, str1);   
    end
end
[value1, location1] = max(accuracy1(:));
[R2,C2] = ind2sub(size(accuracy1),location1);
str1 = ['-b 1 -c ' num2str(C2set(R2)) ' -g ' num2str(G2set(C2))];
model1 = svmtrain(vec1, train1, str1);
resultTrain1 = svmpredict(vec1, train1, model1);
resultTest1 = svmpredict(vec1test, test1, model1);


hfl0 = [hfl0(:,3:6) hfl0(:,9:12) hfl0(:,15:18)];
kfl0 = [kfl0(:,3:6) kfl0(:,9:12) kfl0(:,15:18)];
afl0 = [afl0(:,3:6) afl0(:,9:12) afl0(:,15:18)];
haal0 = [haal0(:,3:6) haal0(:,9:12) haal0(:,15:18)];


hfl = [hfl(:,3:6) hfl(:,9:12) hfl(:,15:18)];
kfl = [kfl(:,3:6) kfl(:,9:12) kfl(:,15:18)];
afl = [afl(:,3:6) afl(:,9:12) afl(:,15:18)];
haal = [haal(:,3:6) haal(:,9:12) haal(:,15:18)];


for i=1:size(hfl0,1)
    hfl1(i,:) = sum(hfl0(i,:)'*hfl(i,:));
end
for i=1:size(kfl,1)
    kfl1(i,:) = sum(kfl0(i,:)'*kfl(i,:));
end
for i=1:size(afl,1)
    afl1(i,:) = sum(afl0(i,:)'*afl(i,:));
end
for i=1:size(haal,1)
    haal1(i,:) = sum(haal0(i,:)'*haal(i,:));
end


herl0 = [herl0(:,3:6) herl0(:,9:12) herl0(:,15:18)];
hel0 = [hel0(:,3:6) hel0(:,9:12) hel0(:,15:1
herl = [herl(:,3:6) herl(:,9:12) herl(:,15:18)];
hel = [hel(:,3:6) hel(:,9:12) hel(:,15:18)];
for i=1:size(herl,1)
    herl1(i,:) = sum(herl0(i,:)'*herl(i,:));
end
for i=1:size(hel,1)
    hel1(i,:) = sum(hel0(i,:)'*hel(i,:));
end








a1 = 0;
a2 = a1;
a3 = a1;
a4 = a1;
a5 = a1;
a6 = a1;

bound = 30;

for i = 1:length(vars)
    if(strfind(char(vars{i}),'AF'))
        a1 = a1+1;
        aa = str2double(newData1.(vars{i}));
        afl0(a1, 1:18) = (aa(bound,1:18));
        
    end

    
    if(strfind(char(vars{i}),'EHR'))
        a2 = a2+1;
        aa = str2double(newData1.(vars{i}));
        herl0(a2,1:18) = (aa(bound,1:18));
    else
    
        if(strfind(char(vars{i}),'HE'))
            a3 = a3+1;
            aa = str2double(newData1.(vars{i}));
            hel0(a3,1:18) = (aa(bound,1:18));
        end
    end
    
    if(strfind(char(vars{i}),'HF'))
        a4 = a4+1;
        aa = str2double(newData1.(vars{i}));
        hfl0(a4, 1:18) = (aa(bound,1:18));
        
    end
    
    if(strfind(char(vars{i}),'KF'))
        a5 = a5+1;
        aa = str2double(newData1.(vars{i}));
        kfl0(a5,1:18) = (aa(bound,1:18));
    end
    
   if(strfind(char(vars{i}),'HAA'))
       a6 = a6+1;
       aa = str2double(newData1.(vars{i}));
       haal0(a6,1:18) = (aa(bound,1:18));
   end
   
end

hfl0 = hfl0(1:a4,:);
kfl0 = kfl0(1:a5,:);
afl0 = afl0(1:a1,:);
haal0 = haal0(1:a6,:);
herl0 = herl0(1:a2,:);
hel0 = hel0(1:a3,:);






xAE = min([a1 a4 a5 a6]);
trainSize = floor(xAE *2/3);
vec1 = [zeros(trainSize,1); zeros(trainSize,1); ones(trainSize,1); ones(trainSize,1)];
train1 = [hfl1(1:trainSize,:); kfl1(1:trainSize,:); afl1(1:trainSize,:); haal1(1:trainSize,:)];
vec1test = [zeros(a4-trainSize,1); zeros(a5-trainSize,1); ones(a1-trainSize,1); ones(a6-trainSize,1)];
test1 = [hfl1((trainSize+1):a4,:); kfl1((trainSize+1):a5,:); afl1((trainSize+1):a1,:); haal1((trainSize+1):a6,:)];
str1 = ['-b 1 -c 50'];
model1 = svmtrain(vec1, train1, str1);
resultTrain1 = svmpredict(vec1, train1, model1);
resultTest1 = svmpredict(vec1test, test1, model1);

distObj1 = [train1(1:2*trainSize,:); train1(3*trainSize+1:length(train1),:)];
distObj2 = train1(2*trainSize+1: 3*trainSize,:);
numOfElem = trainSize; 
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
        accuracy1(i,j)=svmtrain(vec1, train1, str1);   
    end
end
[value1, location1] = max(accuracy1(:));
[R2,C2] = ind2sub(size(accuracy1),location1);
str1 = ['-b 1 -c ' num2str(C2set(R2)) ' -g ' num2str(G2set(C2))];
model1 = svmtrain(vec1, train1, str1);
resultTrain1 = svmpredict(vec1, train1, model1);
resultTest1 = svmpredict(vec1test, test1, model1);





for i=1:size(hfl0,1)
    hfl2(i,:) = hfl0(i,:)-hfl(i,:);
end
for i=1:size(kfl,1)
    kfl2(i,:) = kfl0(i,:)-kfl(i,:);
end
for i=1:size(afl,1)
    afl2(i,:) = afl0(i,:)-afl(i,:);
end
for i=1:size(haal,1)
    haal2(i,:) = haal0(i,:)-haal(i,:);
end