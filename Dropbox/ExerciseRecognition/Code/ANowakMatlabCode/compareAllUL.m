function [rTrain rTest] = compareAllUL(bss)

% load all upper limb data
newData1 = load('-mat', 'allOldPatients.mat');
vars = fieldnames(newData1);

rTest = zeros(bss,3);
rTrain = zeros(bss,3);

for bs = 1:bss
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

    % import all first rows of data
    for i = 1:length(vars)
        if(strmatch('ae', char(vars{i})))
            a1 = a1+1;
            ae(a1,:) = getNextRows(newData1.(vars{i}), bs);

        end

        if(strmatch('ai', char(vars{i})))
            a2 = a2+1;
            ai(a2,:) = getNextRows(newData1.(vars{i}), bs);

        end

       if(strmatch('ef', char(vars{i})))
           a3 = a3+1;
            ef(a3,:) = getNextRows(newData1.(vars{i}), bs);

       end

           if(strmatch('fp', char(vars{i})))
               a4 = a4+1;
            fp(a4,:) = getNextRows(newData1.(vars{i}), bs);

        end

        if(strmatch('fs', char(vars{i})))
            a5 = a5+1;
            fs(a5,:) = getNextRows(newData1.(vars{i}), bs);

        end

       if(strmatch('sa', char(vars{i})))
           a6 = a6+1;
            sa(a6,:) = getNextRows(newData1.(vars{i}), bs);

       end

       if(strmatch('se', char(vars{i})))
           a7 = a7+1;
            se(a7,:) = getNextRows(newData1.(vars{i}), bs);

        end

        if(strmatch('sf', char(vars{i})))
            a8 = a8+1;
            sf(a8,:) = getNextRows(newData1.(vars{i}), bs);

        end

       if(strmatch('we', char(vars{i})))
           a9 = a9+1;
            we(a9,:) = getNextRows(newData1.(vars{i}), bs);

       end

        if(strmatch('wf', char(vars{i})))
              a10 = a10+1;
            wf(a10,:) = getNextRows(newData1.(vars{i}), bs);
        end

        if(strmatch('wr', char(vars{i})))
            a11 = a11+1;
            wr(a11,:) = getNextRows(newData1.(vars{i}), bs);

        end

       if(strmatch('wu', char(vars{i})))
           a12 = a12+1;
            wu(a12,:) = getNextRows(newData1.(vars{i}), bs);

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


train1 = [ae(1:trainSize,:); ai(1:trainSize,:); fp(1:5,:);fs(1:trainSize,:); ef(1:trainSize,:);sa(1:trainSize,:);se(1:trainSize,:);sf(1:trainSize,:); we(1:trainSize,:);wf(1:trainSize,:);wr(1:trainSize,:);wu(1:trainSize,:)];
test1 = [ae((trainSize+1):xAE,:); ai((trainSize+1):xAI,:); fp(6:8,:);fs((trainSize+1):xFS,:); ef((trainSize+1):xEF,:); sa((trainSize+1):xSA,:);se((trainSize+1):xSE,:);sf((trainSize+1):xSF,:);we((trainSize+1):xWE,:);wf((trainSize+1):xWF,:);wr((trainSize+1):xWR,:);wu((trainSize+1):xWU,:)];


% Position 0 svm
vec0 = [zeros(3*trainSize+5,1); ones(8*trainSize,1)];
vec0test = [zeros(xAE-trainSize,1); zeros(xAI-trainSize,1); zeros(3,1);zeros(xFS-trainSize,1); ones(xEF-trainSize,1); ones(xSA-trainSize,1);ones(xSE-trainSize,1);ones(xSF-trainSize,1);ones(xWE-trainSize,1);ones(xWF-trainSize,1);ones(xWR-trainSize,1);ones(xWU-trainSize,1)];

model0 = svmtrain(vec0, train1);
resultTrain0 = svmpredict(vec0, train1, model0);
resultTest0 = svmpredict(vec0test, test1, model0);



% Position 1 svm
vec1 = [ones(3*trainSize+5,1); zeros(4*trainSize,1); ones(4*trainSize,1)];
vec1test = [ones(xAE-trainSize,1); ones(xAI-trainSize,1); ones(3,1);ones(xFS-trainSize,1); zeros(xSA-trainSize,1);zeros(xSE-trainSize,1);zeros(xEF-trainSize,1);zeros(xSF-trainSize,1);ones(xWE-trainSize,1);ones(xWF-trainSize,1);ones(xWR-trainSize,1);ones(xWU-trainSize,1)];

model1 = svmtrain(vec1, train1);
resultTrain1 = svmpredict(vec1, train1, model1);
resultTest1 = svmpredict(vec1test, test1, model1);



% Position 2 svm
vec2 = [ones(7*trainSize+5,1); zeros(4*trainSize,1)];
vec2test = [ones(xAE-trainSize,1); ones(xAI-trainSize,1); ones(3,1);ones(xFS-trainSize,1); ones(xSA-trainSize,1);ones(xSE-trainSize,1);ones((xEF-trainSize,1);ones(xSF-trainSize,1);zeros(xWE-trainSize,1);zeros(xWF-trainSize,1);zeros(xWR-trainSize,1);zeros(xWU-trainSize,1)];

model2 = svmtrain(vec2, train1);
resultTrain2 = svmpredict(vec2, train1, model2);
resultTest2 = svmpredict(vec2test, test1, model2);


rTest(bs,:) = [countError(resultTest0,vec0test) countError(resultTest1,vec1test) countError(resultTest2,vec2test)];
rTrain(bs,:) = [countError(resultTrain0,vec0) countError(resultTrain1,vec1) countError(resultTrain2,vec2)];
end
