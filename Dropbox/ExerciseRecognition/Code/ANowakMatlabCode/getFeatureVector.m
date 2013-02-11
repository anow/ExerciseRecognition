% returns feature vector
% every row is another patient
% every column consist of:
%   every 4 column is quaternion from sensor
%   every 28 columns are measurements from all 7 sensors
%   columns 1:28 mean measurements after 25% of records for this
%   patient,exercise
%   columns 29:56 mean measurements after half of exercise is done
%   columns 57:84 after 75% of exercise
%   columns 85:112 last records for exercise


function res = getFeatureVector(inp)
[x y] = size(inp);

x1 = floor(x/4);
x2 = floor(x/2);
x3 = floor(3*x/4);

res = zeros(112,1);


sensors1 = zeros(7,4);
for i=1:7
    k = find(inp(x1:x2,2) ==(i-1));
    if(size(k,1)>0)
        sensors1(i,:) = inp(k(1),3:6);
    end
end

res(1:28,1) = [sensors1(1,:) sensors1(2,:) sensors1(3,:) sensors1(4,:) sensors1(5,:) sensors1(6,:) sensors1(7,:) ];


sensors1 = zeros(7,4);
for i=1:7
    k = find(inp(x2:x3,2) ==(i-1));
    if(size(k,1)>0)
        sensors1(i,:) = inp(k(1),3:6);
    end
end

res(29:56,1) = [sensors1(1,:) sensors1(2,:) sensors1(3,:) sensors1(4,:) sensors1(5,:) sensors1(6,:) sensors1(7,:) ];


sensors1 = zeros(7,4);
sensors2 = zeros(7,4);
for i=1:7
    k = find(inp(x3:x,2) ==(i-1));
    if(size(k,1)>0)
        sensors1(i,:) = inp(k(1),3:6);
        sensors2(i,:) = inp(k(size(k,1)),3:6);
    end
end

res(57:84,1) = [sensors1(1,:) sensors1(2,:) sensors1(3,:) sensors1(4,:) sensors1(5,:) sensors1(6,:) sensors1(7,:) ];


res(85:112,1) = [sensors2(1,:) sensors2(2,:) sensors2(3,:) sensors2(4,:) sensors2(5,:) sensors2(6,:) sensors2(7,:) ];