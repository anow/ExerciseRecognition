function [rTest rTrain] = howMuch2(newData1, rowNum)

vars = fieldnames(newData1);

sY = 100;
sX = 18;

herl0 = zeros(sY, sX);
hfl0 = herl0;
kfl0 = herl0;
afl0 = herl0;
haal0 = herl0;

a1 = 0;
a4 = a1;
a5 = a1;
a6 = a1;


for i = 1:length(vars)
    if(strfind(char(vars{i}),'AF'))
        a1 = a1+1;
        aa = str2double(newData1.(vars{i}));
       if (size(aa,1)<rowNum)
            rowN = size(aa,1);
        else
            rowN = rowNum;
       end
        afl(a1, 1:18) = (aa(rowN,1:18));
        
    end
    
    if(strfind(char(vars{i}),'HF'))
        a4 = a4+1;
        aa = str2double(newData1.(vars{i}));
       if (size(aa,1)<rowNum)
            rowN = size(aa,1);
        else
            rowN = rowNum;
       end
        hfl(a4, 1:18) = (aa(rowN,1:18));
        
    end
    
    if(strfind(char(vars{i}),'KF'))
        a5 = a5+1;
        aa = str2double(newData1.(vars{i}));
       if (size(aa,1)<rowNum)
            rowN = size(aa,1);
        else
            rowN = rowNum;
       end
        kfl(a5,1:18) = (aa(rowN,1:18));
    end
    
   if(strfind(char(vars{i}),'HAA'))
       a6 = a6+1;
       aa = str2double(newData1.(vars{i}));
       if (size(aa,1)<rowNum)
            rowN = size(aa,1);
        else
            rowN = rowNum;
       end
       haal(a6,1:18) = (aa(rowN,1:18));
   end
   
end

hfl = hfl(1:a4,:);
kfl = kfl(1:a5,:);
afl = afl(1:a1,:);
haal = haal(1:a6,:);


hfl = [hfl(:,3:6) hfl(:,9:12) hfl(:,15:18)];
kfl = [kfl(:,3:6) kfl(:,9:12) kfl(:,15:18)];
afl = [afl(:,3:6) afl(:,9:12) afl(:,15:18)];
haal = [haal(:,3:6) haal(:,9:12) haal(:,15:18)];



rTest = zeros(3,1);
rTrain= zeros(3,1);
% recognize afl
xAE = min([a1 a4 a5 a6]);
trainSize = floor(xAE *2/3);

vec1 = [ones(trainSize,1); zeros(trainSize,1); zeros(trainSize,1); zeros(trainSize,1)];
train1 = [afl(1:trainSize,:); hfl(1:trainSize,:); kfl(1:trainSize,:); haal(1:trainSize,:)];
vec1test = [ones(a1-trainSize,1); zeros(a4-trainSize,1); zeros(a5-trainSize,1); zeros(a6-trainSize,1)];
test1 = [afl((trainSize+1):a1,:); hfl((trainSize+1):a4,:); kfl((trainSize+1):a5,:); haal((trainSize+1):a6,:)];
str1 = ['-b 1 -c 5 -g 5.6341'];
model1 = svmtrain(vec1, train1, str1);
resultTrain1 = svmpredict(vec1, train1, model1);
resultTest1 = svmpredict(vec1test, test1, model1);

 
rTest(1,1) = 100 -sum(abs(resultTest1-vec1test))/size(resultTest1,1)*100;
rTrain(1,1) = 100 -sum(abs(resultTrain1-vec1))/size(resultTrain1,1)*100;


% recognize haal
vec1 = [zeros(trainSize,1); zeros(trainSize,1);zeros(trainSize,1); ones(trainSize,1)];
train1 = [afl(1:trainSize,:); hfl(1:trainSize,:); kfl(1:trainSize,:); haal(1:trainSize,:)];
vec1test = [zeros(a1-trainSize,1); zeros(a4-trainSize,1); zeros(a5-trainSize,1); ones(a6-trainSize,1)];
test1 = [afl((trainSize+1):a1,:); hfl((trainSize+1):a4,:); kfl((trainSize+1):a5,:); haal((trainSize+1):a6,:)];
str1 = ['-b 1 -c 200 -g 1.5951'];
model1 = svmtrain(vec1, train1, str1);
resultTrain1 = svmpredict(vec1, train1, model1);
resultTest1 = svmpredict(vec1test, test1, model1);


rTest(2,1) = 100 -sum(abs(resultTest1-vec1test))/size(resultTest1,1)*100;
rTrain(2,1) = 100 -sum(abs(resultTrain1-vec1))/size(resultTrain1,1)*100;


% recognize hfl kfl
vec1 = [zeros(trainSize,1); ones(trainSize,1); zeros(trainSize,1); zeros(trainSize,1)];
train1 = [afl(1:trainSize,:); hfl(1:trainSize,:); kfl(1:trainSize,:); haal(1:trainSize,:)];
vec1test = [zeros(a1-trainSize,1); ones(a4-trainSize,1); zeros(a5-trainSize,1); zeros(a6-trainSize,1)];
test1 = [afl((trainSize+1):a1,:); hfl((trainSize+1):a4,:); kfl((trainSize+1):a5,:); haal((trainSize+1):a6,:)];
str1 = ['-b 1 -c 121 -g 0.22272'];
model1 = svmtrain(vec1, train1, str1);
resultTrain1 = svmpredict(vec1, train1, model1);
resultTest1 = svmpredict(vec1test, test1, model1);


rTest(3,1) = 100 -sum(abs(resultTest1-vec1test))/size(resultTest1,1)*100;
rTrain(3,1) = 100 -sum(abs(resultTrain1-vec1))/size(resultTrain1,1)*100;