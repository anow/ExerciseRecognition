function [cl1 cl2 cl3 cl4 cl5 cl6] = gradients(in, axis)

%% Converts a series of quartenion data into a series of gradients
% input should be an entire set of data quaternion from a single node

%% pre-allocate space
    newin = sortrows(in,2);
    res = zeros(size(newin,1), 4);
    vec = zeros(size(newin,1), 3);
    res(:,1) = newin(:,2);


    for i = 1:size(res,1)
        %% extract the quaternion from a single line
        vec(i,:) = getVector(newin(i,3:6),axis);
        res(i,2:4) = gradient(vec(i,:)); 
    end
    
in0 = size( find( in( :, 2) == 0 ), 1);
in1 = size( find( in( :, 2) == 1 ), 1);
in2 = size( find( in( :, 2) == 2 ), 1);
in3 = size( find( in( :, 2) == 3 ), 1);
in4 = size( find( in( :, 2) == 4 ), 1);
in5 = size( find( in( :, 2) == 5 ), 1);
%±±in6 = size( find( in( :, 2) == 6 ), 1);

% sizes of subclasses of input data
sizes = [(in0+in1) (in0+in1+in2) (in0+in1+in2+in3) (in0+in1+in2+in3+in4) (in0+in1+in2+in3+in4+in5) size(res,1)];

cl1 = res(sizes(1)+1 : sizes(2),:);
cl2 = res(sizes(2)+1 : sizes(3),:);
cl3 = res(sizes(3)+1 : sizes(4),:);
cl4 = res(sizes(4)+1 : sizes(5),:);
cl5 = res(sizes(5)+1 : sizes(6),:);
cl6 = res(sizes(6)+1 : size(sizes),:);

