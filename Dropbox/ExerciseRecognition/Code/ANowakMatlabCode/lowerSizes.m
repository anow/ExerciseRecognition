function sizes = lowerSizes()
newData1 = load('-mat', 'correctPatients.mat');

% Create new variables in the base workspace from those fields.
vars = fieldnames(newData1);

rowNum = 1;


sY = 100;
sX = 1;

herl0 = zeros(sY, sX);
herlS = herl0;
helS = herl0;
hflS = herl0;
kflS = herl0;
aflS = herl0;
haalS = herl0;

a1 = 0;
a2 = a1;
a3 = a1;
a4 = a1;
a5 = a1;
a6 = a1;


for i = 1:length(vars)
    if(strfind(char(vars{i}),'AF'))
        a1 = a1+1;
        aa = str2double(newData1.(vars{i}));
        aflS(a1, 1) = size(aa,1);
        
    end

    
    if(strfind(char(vars{i}),'EHR'))
        a2 = a2+1;
        aa = str2double(newData1.(vars{i}));
        herlS(a2,1) = size(aa,1);
    else
    
        if(strfind(char(vars{i}),'HE'))
            a3 = a3+1;
            aa = str2double(newData1.(vars{i}));
            helS(a3,1) = size(aa,1);
        end
    end
    
    if(strfind(char(vars{i}),'HF'))
        a4 = a4+1;
        aa = str2double(newData1.(vars{i}));
        hflS(a4, 1) = size(aa,1);
        
    end
    
    if(strfind(char(vars{i}),'KF'))
        a5 = a5+1;
        aa = str2double(newData1.(vars{i}));
        kflS(a5,1) = size(aa,1);
    end
    
   if(strfind(char(vars{i}),'HAA'))
       a6 = a6+1;
       aa = str2double(newData1.(vars{i}));
       haalS(a6,1) = size(aa,1);
   end
   
end

hflS = hflS(1:a4,:);
kflS = kflS(1:a5,:);
aflS = aflS(1:a1,:);
haalS = haalS(1:a6,:);
herlS = herlS(1:a2,:);
helS = helS(1:a3,:);

res = [min(hflS)/50 max(hflS)/50 median(hflS)/50; min(kflS)/50 max(kflS)/50 median(kflS)/50; min(aflS)/50 max(aflS)/50 median(aflS)/50; min(haalS)/50 max(haalS)/50 median(haalS)/50; min(herlS)/50 max(herlS)/50 median(herlS)/50;min(helS)/50 max(helS)/50 median(helS)/50;]


