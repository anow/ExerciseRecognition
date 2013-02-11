function [rTrain rTest] = compExeLastRow()

newData1 = load('-mat', 'allOldPatients.mat');
vars = fieldnames(newData1);

rTest = zeros(30,12);
rTrain = zeros(30,12);

for m=1: 30
    
ae = zeros(50,24);
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
    
    
for i = 1:length(vars)
    if(strmatch('ae', char(vars{i})))
        a1 = a1+1;
        aa = newData1.(vars{i});
        ae(a1,:) = getNextRows(aa,m*25);
        
    end
    
    if(strmatch('ai', char(vars{i})))
        a2 = a2+1;
         aa = newData1.(vars{i});
        ai(a2,:) = getNextRows(aa,m*25);
        
    end
    
   if(strmatch('ef', char(vars{i})))
       a3 = a3+1;
        aa = newData1.(vars{i});
        ef(a3,:) = getNextRows(aa,m*25);
        
   end
    
       if(strmatch('fp', char(vars{i})))
           a4 = a4+1;
            aa = newData1.(vars{i});
        fp(a4,:) = getNextRows(aa,m*25);
        
    end
    
    if(strmatch('fs', char(vars{i})))
        a5 = a5+1;
         aa = newData1.(vars{i});
        fs(a5,:) = getNextRows(aa,m*25);
        
    end
    
   if(strmatch('sa', char(vars{i})))
       a6 = a6+1;
        aa = newData1.(vars{i});
        sa(a6,:) = getNextRows(aa,m*25);
        
   end
    
   if(strmatch('se', char(vars{i})))
       a7 = a7+1;
        aa = newData1.(vars{i});
        se(a7,:) = getNextRows(aa,m*25);
        
    end
    
    if(strmatch('sf', char(vars{i})))
        a8 = a8+1;
         aa = newData1.(vars{i});
        sf(a8,:) = getNextRows(aa,m*25);
        
    end
    
   if(strmatch('we', char(vars{i})))
       a9 = a9+1;
        aa = newData1.(vars{i});
        we(a9,:) = getNextRows(aa,m*25);
        
   end
   
      if(strmatch('wf', char(vars{i})))
          a10 = a10+1;
           aa = newData1.(vars{i});
        wf(a10,:) = getNextRows(aa,m*25);
        
    end
    
    if(strmatch('wr', char(vars{i})))
        a11 = a11+1;
         aa = newData1.(vars{i});
        wr(a11,:) = getNextRows(aa,m*25);
        
    end
    
   if(strmatch('wu', char(vars{i})))
       a12 = a12+1;
        aa = newData1.(vars{i});
        wu(a12,:) = getNextRows(aa,m*25);

    end
   
end


ae = ae(1:a1,:);
ai = ai(1:a2,:);
ef = ef(1:a3,:);
fp = fp(1:a4,:);
fs = fs(1:a5,:);
sa = sa(1:a6,:);
se = se(1:a7,:);
sf = sf(1:a8,:);
we = we(1:a9,:);
wf = wf(1:a10,:);
wr = wr(1:a11,:);
wu = wu(1:a12,:);



[xAE y] = size(ae);
[xAI ~] = size(ai);
[xEF ~] = size(ef);
[xFP ~] = size(fp);
[xFS ~] = size(fs);
[xSA ~] = size(sa);
[xSE ~] = size(se);
[xSF ~] = size(sf);
[xWE ~] = size(we);
[xWF ~] = size(wf);
[xWR ~] = size(wr);
[xWU ~] = size(wu);
trainSize = floor(xAE *2/3);

%% Position 0

train1 = [ef(1:trainSize,:);sa(1:trainSize,:);se(1:trainSize,:);sf(1:trainSize,:); ae(1:trainSize,:); ai(1:trainSize,:); fp(1:5,:);fs(1:trainSize,:);we(1:trainSize,:);wf(1:trainSize,:);wr(1:trainSize,:);wu(1:trainSize,:)];
vec1 = [zeros(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(5,1); ones(trainSize,1); ones(trainSize,1);ones(trainSize,1);ones(trainSize,1);ones(trainSize,1)];

vec1test = [zeros(xAE-trainSize,1); ones(xAI-trainSize,1); ones(xEF-trainSize,1);ones(xFS-trainSize,1); ones(xSA-trainSize,1);ones(xSE-trainSize,1);ones(3,1);ones(xSF-trainSize,1);ones(xWE-trainSize,1);ones(xWF-trainSize,1);ones(xWR-trainSize,1);ones(xWU-trainSize,1)];
test1 = [ef((trainSize+1):xEF,:); sa((trainSize+1):xSA,:);se((trainSize+1):xSE,:);sf((trainSize+1):xSF,:);ae((trainSize+1):xAE,:); ai((trainSize+1):xAI,:); fp(6:8,:);fs((trainSize+1):xFS,:);we((trainSize+1):xWE,:);wf((trainSize+1):xWF,:);wr((trainSize+1):xWR,:);wu((trainSize+1):xWU,:)];

    str5 = ['-b 1 -c 0.33333 -g 0.0031119'];
    model5 = svmtrain(vec1, train1, str5);
    resultTrain1 = svmpredict(vec1, train1, model5);
    resultTest1 = svmpredict(vec1test, test1, model5);
    
    
    rTest(m,1) = (100 -sum(abs(resultTest1-vec1test))/size(resultTest1,1)*100);
    rTrain(m,1) = (100 -sum(abs(resultTrain1-vec1))/size(resultTrain1,1)*100);

    

train1 = [ef(1:trainSize,:);sa(1:trainSize,:);se(1:trainSize,:);sf(1:trainSize,:); ae(1:trainSize,:); ai(1:trainSize,:); fp(1:5,:);fs(1:trainSize,:);we(1:trainSize,:);wf(1:trainSize,:);wr(1:trainSize,:);wu(1:trainSize,:)];
vec1 = [ones(trainSize,1); zeros(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(5,1); ones(trainSize,1); ones(trainSize,1);ones(trainSize,1);ones(trainSize,1);ones(trainSize,1)];

vec1test = [ones(xAE-trainSize,1); zeros(xAI-trainSize,1); ones(xEF-trainSize,1);ones(xFS-trainSize,1); ones(xSA-trainSize,1);ones(xSE-trainSize,1);ones(3,1);ones(xSF-trainSize,1);ones(xWE-trainSize,1);ones(xWF-trainSize,1);ones(xWR-trainSize,1);ones(xWU-trainSize,1)];
test1 = [ef((trainSize+1):xEF,:); sa((trainSize+1):xSA,:);se((trainSize+1):xSE,:);sf((trainSize+1):xSF,:);ae((trainSize+1):xAE,:); ai((trainSize+1):xAI,:); fp(6:8,:);fs((trainSize+1):xFS,:);we((trainSize+1):xWE,:);wf((trainSize+1):xWF,:);wr((trainSize+1):xWR,:);wu((trainSize+1):xWU,:)];


    str5 = ['-b 1 -c 125 -g 0.2242'];
    model5 = svmtrain(vec1, train1, str5);
    resultTrain1 = svmpredict(vec1, train1, model5);
    resultTest1 = svmpredict(vec1test, test1, model5);
    
    
    rTest(m,2) = (100 -sum(abs(resultTest1-vec1test))/size(resultTest1,1)*100);
    rTrain(m,2) = (100 -sum(abs(resultTrain1-vec1))/size(resultTrain1,1)*100);

    

train1 = [ef(1:trainSize,:);sa(1:trainSize,:);se(1:trainSize,:);sf(1:trainSize,:); ae(1:trainSize,:); ai(1:trainSize,:); fp(1:5,:);fs(1:trainSize,:);we(1:trainSize,:);wf(1:trainSize,:);wr(1:trainSize,:);wu(1:trainSize,:)];
vec1 = [ones(trainSize,1); ones(trainSize,1); zeros(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(5,1); ones(trainSize,1); ones(trainSize,1);ones(trainSize,1);ones(trainSize,1);ones(trainSize,1)];

vec1test = [ones(xAE-trainSize,1); ones(xAI-trainSize,1); zeros(xEF-trainSize,1);ones(xFS-trainSize,1); ones(xSA-trainSize,1);ones(xSE-trainSize,1);ones(3,1);ones(xSF-trainSize,1);ones(xWE-trainSize,1);ones(xWF-trainSize,1);ones(xWR-trainSize,1);ones(xWU-trainSize,1)];
test1 = [ef((trainSize+1):xEF,:); sa((trainSize+1):xSA,:);se((trainSize+1):xSE,:);sf((trainSize+1):xSF,:);ae((trainSize+1):xAE,:); ai((trainSize+1):xAI,:); fp(6:8,:);fs((trainSize+1):xFS,:);we((trainSize+1):xWE,:);wf((trainSize+1):xWF,:);wr((trainSize+1):xWR,:);wu((trainSize+1):xWU,:)];

 
    str5 = ['-b 1 -c 361 -g 0.044051'];
    model5 = svmtrain(vec1, train1, str5);
    resultTrain1 = svmpredict(vec1, train1, model5);
    resultTest1 = svmpredict(vec1test, test1, model5);
    
    
    rTest(m,3) = (100 -sum(abs(resultTest1-vec1test))/size(resultTest1,1)*100);
    rTrain(m,3) = (100 -sum(abs(resultTrain1-vec1))/size(resultTrain1,1)*100);

    
% train1 = [ef(1:trainSize,:);sa(1:trainSize,:);se(1:trainSize,:);sf(1:trainSize,:); ae(1:trainSize,:); ai(1:trainSize,:); fp(1:5,:);fs(1:trainSize,:);we(1:trainSize,:);wf(1:trainSize,:);wr(1:trainSize,:);wu(1:trainSize,:)];
% vec1 = [ones(trainSize,1); ones(trainSize,1); ones(trainSize,1); zeros(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(5,1); ones(trainSize,1); ones(trainSize,1);ones(trainSize,1);ones(trainSize,1);ones(trainSize,1)];
% 
% vec1test = [ones(xAE-trainSize,1); ones(xAI-trainSize,1); ones(xEF-trainSize,1);zeros(xFS-trainSize,1); ones(xSA-trainSize,1);ones(xSE-trainSize,1);ones(3,1);ones(xSF-trainSize,1);ones(xWE-trainSize,1);ones(xWF-trainSize,1);ones(xWR-trainSize,1);ones(xWU-trainSize,1)];
% test1 = [ef((trainSize+1):xEF,:); sa((trainSize+1):xSA,:);se((trainSize+1):xSE,:);sf((trainSize+1):xSF,:);ae((trainSize+1):xAE,:); ai((trainSize+1):xAI,:); fp(6:8,:);fs((trainSize+1):xFS,:);we((trainSize+1):xWE,:);wf((trainSize+1):xWF,:);wr((trainSize+1):xWR,:);wu((trainSize+1):xWU,:)];
% 
%     str5 = ['-b 1 -c ' num2str(C2set(R2)) ' -g ' num2str(G2set(C2))];
%     model5 = svmtrain(vec1, train1, str5);
%     resultTrain1 = svmpredict(vec1, train1, model5);
%     resultTest1 = svmpredict(vec1test, test1, model5);
%     
%     
%     rTest(m,4) = (100 -sum(abs(resultTest1-vec1test))/size(resultTest1,1)*100);
%     rTrain(m,4) = (100 -sum(abs(resultTrain1-vec1))/size(resultTrain1,1)*100);






%% Position 1

train1 = [ef(1:trainSize,:);sa(1:trainSize,:);se(1:trainSize,:);sf(1:trainSize,:); ae(1:trainSize,:); ai(1:trainSize,:); fp(1:5,:);fs(1:trainSize,:);we(1:trainSize,:);wf(1:trainSize,:);wr(1:trainSize,:);wu(1:trainSize,:)];
vec1 = [ones(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(trainSize,1); zeros(trainSize,1); ones(trainSize,1); ones(5,1); ones(trainSize,1); ones(trainSize,1);ones(trainSize,1);ones(trainSize,1);ones(trainSize,1)];

vec1test = [ones(xAE-trainSize,1); ones(xAI-trainSize,1); ones(xEF-trainSize,1);ones(xFS-trainSize,1); zeros(xSA-trainSize,1);ones(xSE-trainSize,1);ones(3,1);ones(xSF-trainSize,1);ones(xWE-trainSize,1);ones(xWF-trainSize,1);ones(xWR-trainSize,1);ones(xWU-trainSize,1)];
test1 = [ef((trainSize+1):xEF,:); sa((trainSize+1):xSA,:);se((trainSize+1):xSE,:);sf((trainSize+1):xSF,:);ae((trainSize+1):xAE,:); ai((trainSize+1):xAI,:); fp(6:8,:);fs((trainSize+1):xFS,:);we((trainSize+1):xWE,:);wf((trainSize+1):xWF,:);wr((trainSize+1):xWR,:);wu((trainSize+1):xWU,:)];

    str5 = ['-b 1 -c 0.33333 -g 0.0031344'];
    model5 = svmtrain(vec1, train1, str5);
    resultTrain1 = svmpredict(vec1, train1, model5);
    resultTest1 = svmpredict(vec1test, test1, model5);
    
    
    rTest(m,5) = 100 -sum(abs(resultTest1-vec1test))/size(resultTest1,1)*100;
    rTrain(m,5) = 100 -sum(abs(resultTrain1-vec1))/size(resultTrain1,1)*100;

    
train1 = [ef(1:trainSize,:);sa(1:trainSize,:);se(1:trainSize,:);sf(1:trainSize,:); ae(1:trainSize,:); ai(1:trainSize,:); fp(1:5,:);fs(1:trainSize,:);we(1:trainSize,:);wf(1:trainSize,:);wr(1:trainSize,:);wu(1:trainSize,:)];
vec1 = [ones(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(trainSize,1); zeros(trainSize,1); ones(5,1); ones(trainSize,1); ones(trainSize,1);ones(trainSize,1);ones(trainSize,1);ones(trainSize,1)];

vec1test = [ones(xAE-trainSize,1); ones(xAI-trainSize,1); ones(xEF-trainSize,1);ones(xFS-trainSize,1); ones(xSA-trainSize,1);zeros(xSE-trainSize,1);ones(3,1);ones(xSF-trainSize,1);ones(xWE-trainSize,1);ones(xWF-trainSize,1);ones(xWR-trainSize,1);ones(xWU-trainSize,1)];
test1 = [ef((trainSize+1):xEF,:); sa((trainSize+1):xSA,:);se((trainSize+1):xSE,:);sf((trainSize+1):xSF,:);ae((trainSize+1):xAE,:); ai((trainSize+1):xAI,:); fp(6:8,:);fs((trainSize+1):xFS,:);we((trainSize+1):xWE,:);wf((trainSize+1):xWF,:);wr((trainSize+1):xWR,:);wu((trainSize+1):xWU,:)];

    str5 = ['-b 1 -c 0.33333 -g 0.0021252'];
    model5 = svmtrain(vec1, train1, str5);
    resultTrain1 = svmpredict(vec1, train1, model5);
    resultTest1 = svmpredict(vec1test, test1, model5);
    
    
    rTest(m,6) = 100 -sum(abs(resultTest1-vec1test))/size(resultTest1,1)*100;
    rTrain(m,6) = 100 -sum(abs(resultTrain1-vec1))/size(resultTrain1,1)*100;

    
train1 = [ef(1:trainSize,:);sa(1:trainSize,:);se(1:trainSize,:);sf(1:trainSize,:); ae(1:trainSize,:); ai(1:trainSize,:); fp(1:5,:);fs(1:trainSize,:);we(1:trainSize,:);wf(1:trainSize,:);wr(1:trainSize,:);wu(1:trainSize,:)];
vec1 = [ones(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(trainSize,1); zeros(5,1); ones(trainSize,1); ones(trainSize,1);ones(trainSize,1);ones(trainSize,1);ones(trainSize,1)];

vec1test = [ones(xAE-trainSize,1); ones(xAI-trainSize,1); ones(xEF-trainSize,1);ones(xFS-trainSize,1); ones(xSA-trainSize,1);ones(xSE-trainSize,1);zeros(3,1);ones(xSF-trainSize,1);ones(xWE-trainSize,1);ones(xWF-trainSize,1);ones(xWR-trainSize,1);ones(xWU-trainSize,1)];
test1 = [ef((trainSize+1):xEF,:); sa((trainSize+1):xSA,:);se((trainSize+1):xSE,:);sf((trainSize+1):xSF,:);ae((trainSize+1):xAE,:); ai((trainSize+1):xAI,:); fp(6:8,:);fs((trainSize+1):xFS,:);we((trainSize+1):xWE,:);wf((trainSize+1):xWF,:);wr((trainSize+1):xWR,:);wu((trainSize+1):xWU,:)];

    str5 = ['-b 1 -c 0.047619 -g 4.5115e-06'];
    model5 = svmtrain(vec1, train1, str5);
    resultTrain1 = svmpredict(vec1, train1, model5);
    resultTest1 = svmpredict(vec1test, test1, model5);
    
    
    rTest(m,7) = (100 -sum(abs(resultTest1-vec1test))/size(resultTest1,1)*100);
    rTrain(m,7) = (100 -sum(abs(resultTrain1-vec1))/size(resultTrain1,1)*100);

    
% train1 = [ef(1:trainSize,:);sa(1:trainSize,:);se(1:trainSize,:);sf(1:trainSize,:); ae(1:trainSize,:); ai(1:trainSize,:); fp(1:5,:);fs(1:trainSize,:);we(1:trainSize,:);wf(1:trainSize,:);wr(1:trainSize,:);wu(1:trainSize,:)];
% vec1 = [ones(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(5,1); zeros(trainSize,1); ones(trainSize,1);ones(trainSize,1);ones(trainSize,1);ones(trainSize,1)];
% 
% vec1test = [ones(xAE-trainSize,1); ones(xAI-trainSize,1); ones(xEF-trainSize,1);ones(xFS-trainSize,1); ones(xSA-trainSize,1);ones(xSE-trainSize,1);ones(3,1);zeros(xSF-trainSize,1);ones(xWE-trainSize,1);ones(xWF-trainSize,1);ones(xWR-trainSize,1);ones(xWU-trainSize,1)];
% test1 = [ef((trainSize+1):xEF,:); sa((trainSize+1):xSA,:);se((trainSize+1):xSE,:);sf((trainSize+1):xSF,:);ae((trainSize+1):xAE,:); ai((trainSize+1):xAI,:); fp(6:8,:);fs((trainSize+1):xFS,:);we((trainSize+1):xWE,:);wf((trainSize+1):xWF,:);wr((trainSize+1):xWR,:);wu((trainSize+1):xWU,:)];
% 
%     str5 = ['-b 1 -c ' num2str(C2set(R2)) ' -g ' num2str(G2set(C2))];
%     model5 = svmtrain(vec1, train1, str5);
%     resultTrain1 = svmpredict(vec1, train1, model5);
%     resultTest1 = svmpredict(vec1test, test1, model5);
%     
%     
%     rTest(m,9) = 100 -sum(abs(resultTest1-vec1test))/size(resultTest1,1)*100;
%     rTrain(m,9) = 100 -sum(abs(resultTrain1-vec1))/size(resultTrain1,1)*100;

train1 = [ef(1:trainSize,:);sa(1:trainSize,:);se(1:trainSize,:);sf(1:trainSize,:); ae(1:trainSize,:); ai(1:trainSize,:); fp(1:5,:);fs(1:trainSize,:);we(1:trainSize,:);wf(1:trainSize,:);wr(1:trainSize,:);wu(1:trainSize,:)];
vec1 = [ones(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(5,1); ones(trainSize,1); zeros(trainSize,1);ones(trainSize,1);ones(trainSize,1);ones(trainSize,1)];

vec1test = [ones(xAE-trainSize,1); ones(xAI-trainSize,1); ones(xEF-trainSize,1);ones(xFS-trainSize,1); ones(xSA-trainSize,1);ones(xSE-trainSize,1);ones(3,1);ones(xSF-trainSize,1);zeros(xWE-trainSize,1);ones(xWF-trainSize,1);ones(xWR-trainSize,1);ones(xWU-trainSize,1)];
test1 = [ef((trainSize+1):xEF,:); sa((trainSize+1):xSA,:);se((trainSize+1):xSE,:);sf((trainSize+1):xSF,:);ae((trainSize+1):xAE,:); ai((trainSize+1):xAI,:); fp(6:8,:);fs((trainSize+1):xFS,:);we((trainSize+1):xWE,:);wf((trainSize+1):xWF,:);wr((trainSize+1):xWR,:);wu((trainSize+1):xWU,:)];

    str5 = ['-b 1 -c 0.33333 -g 0.0017188'];
    model5 = svmtrain(vec1, train1, str5);
    resultTrain1 = svmpredict(vec1, train1, model5);
    resultTest1 = svmpredict(vec1test, test1, model5);
    
    
    rTest(m,9) = 100 -sum(abs(resultTest1-vec1test))/size(resultTest1,1)*100;
    rTrain(m,9) = 100 -sum(abs(resultTrain1-vec1))/size(resultTrain1,1)*100;
    

    
train1 = [ef(1:trainSize,:);sa(1:trainSize,:);se(1:trainSize,:);sf(1:trainSize,:); ae(1:trainSize,:); ai(1:trainSize,:); fp(1:5,:);fs(1:trainSize,:);we(1:trainSize,:);wf(1:trainSize,:);wr(1:trainSize,:);wu(1:trainSize,:)];
vec1 = [ones(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(5,1); ones(trainSize,1); ones(trainSize,1);zeros(trainSize,1);ones(trainSize,1);ones(trainSize,1)];

vec1test = [ones(xAE-trainSize,1); ones(xAI-trainSize,1); ones(xEF-trainSize,1);ones(xFS-trainSize,1); ones(xSA-trainSize,1);ones(xSE-trainSize,1);ones(3,1);ones(xSF-trainSize,1);ones(xWE-trainSize,1);zeros(xWF-trainSize,1);ones(xWR-trainSize,1);ones(xWU-trainSize,1)];
test1 = [ef((trainSize+1):xEF,:); sa((trainSize+1):xSA,:);se((trainSize+1):xSE,:);sf((trainSize+1):xSF,:);ae((trainSize+1):xAE,:); ai((trainSize+1):xAI,:); fp(6:8,:);fs((trainSize+1):xFS,:);we((trainSize+1):xWE,:);wf((trainSize+1):xWF,:);wr((trainSize+1):xWR,:);wu((trainSize+1):xWU,:)];

    str5 = ['-b 1 -c 0.33333 -g 0.0031887'];
    model5 = svmtrain(vec1, train1, str5);
    resultTrain1 = svmpredict(vec1, train1, model5);
    resultTest1 = svmpredict(vec1test, test1, model5);
    
    
    rTest(m,10) = 100 -sum(abs(resultTest1-vec1test))/size(resultTest1,1)*100;
    rTrain(m,10) = 100 -sum(abs(resultTrain1-vec1))/size(resultTrain1,1)*100;



train1 = [ef(1:trainSize,:);sa(1:trainSize,:);se(1:trainSize,:);sf(1:trainSize,:); ae(1:trainSize,:); ai(1:trainSize,:); fp(1:5,:);fs(1:trainSize,:);we(1:trainSize,:);wf(1:trainSize,:);wr(1:trainSize,:);wu(1:trainSize,:)];
vec1 = [ones(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(5,1); ones(trainSize,1); ones(trainSize,1);ones(trainSize,1);zeros(trainSize,1);ones(trainSize,1)];

vec1test = [ones(xAE-trainSize,1); ones(xAI-trainSize,1); ones(xEF-trainSize,1);ones(xFS-trainSize,1); ones(xSA-trainSize,1);ones(xSE-trainSize,1);ones(3,1);ones(xSF-trainSize,1);ones(xWE-trainSize,1);ones(xWF-trainSize,1);zeros(xWR-trainSize,1);ones(xWU-trainSize,1)];
test1 = [ef((trainSize+1):xEF,:); sa((trainSize+1):xSA,:);se((trainSize+1):xSE,:);sf((trainSize+1):xSF,:);ae((trainSize+1):xAE,:); ai((trainSize+1):xAI,:); fp(6:8,:);fs((trainSize+1):xFS,:);we((trainSize+1):xWE,:);wf((trainSize+1):xWF,:);wr((trainSize+1):xWR,:);wu((trainSize+1):xWU,:)];
    str5 = ['-b 1 -c 0.33333 -g 0.0036951'];
    model5 = svmtrain(vec1, train1, str5);
    resultTrain1 = svmpredict(vec1, train1, model5);
    resultTest1 = svmpredict(vec1test, test1, model5);
    
    
    rTest(m,11) = 100 -sum(abs(resultTest1-vec1test))/size(resultTest1,1)*100;
    rTrain(m,11) = 100 -sum(abs(resultTrain1-vec1))/size(resultTrain1,1)*100;



% train1 = [ef(1:trainSize,:);sa(1:trainSize,:);se(1:trainSize,:);sf(1:trainSize,:); ae(1:trainSize,:); ai(1:trainSize,:); fp(1:5,:);fs(1:trainSize,:);we(1:trainSize,:);wf(1:trainSize,:);wr(1:trainSize,:);wu(1:trainSize,:)];
% vec1 = [ones(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(trainSize,1); ones(5,1); ones(trainSize,1); ones(trainSize,1);ones(trainSize,1);ones(trainSize,1);zeros(trainSize,1)];
% 
% vec1test = [ones(xAE-trainSize,1); ones(xAI-trainSize,1); ones(xEF-trainSize,1);ones(xFS-trainSize,1); ones(xSA-trainSize,1);ones(xSE-trainSize,1);ones(3,1);ones(xSF-trainSize,1);ones(xWE-trainSize,1);ones(xWF-trainSize,1);ones(xWR-trainSize,1);zeros(xWU-trainSize,1)];
% test1 = [ef((trainSize+1):xEF,:); sa((trainSize+1):xSA,:);se((trainSize+1):xSE,:);sf((trainSize+1):xSF,:);ae((trainSize+1):xAE,:); ai((trainSize+1):xAI,:); fp(6:8,:);fs((trainSize+1):xFS,:);we((trainSize+1):xWE,:);wf((trainSize+1):xWF,:);wr((trainSize+1):xWR,:);wu((trainSize+1):xWU,:)];
% 
%     str5 = ['-b 1 -c ' num2str(C2set(R2)) ' -g ' num2str(G2set(C2))];
%     model5 = svmtrain(vec1, train1, str5);
%     resultTrain1 = svmpredict(vec1, train1, model5);
%     resultTest1 = svmpredict(vec1test, test1, model5);
%     
%     
%     rTest(m,12) = 100 -sum(abs(resultTest1-vec1test))/size(resultTest1,1)*100;
%     rTrain(m,12) = 100 -sum(abs(resultTrain1-vec1))/size(resultTrain1,1)*100;

end