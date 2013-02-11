function reduced = reduceEveryNRecords(input, n)
% reduces every N records in input, (when N=25, then result is an average of measures in
% every minute for each device
% Inputs:
% input - matrix imported from .csv with columns: timestamp, device, q0, q1, q2,
% q3 and 2 columns of zeros
% n - number of records to be reduced from each device
% Output:
% reduced - matrix with reduced number of records for every device and 4
% columns: device, q0, q1, q2, q3

factor = n;

% divide input data depending on the their source (device number)
in = sortrows(input(:,2:6),1);
in0 = size( find( in( :, 1) == 0 ), 1);
in1 = size( find( in( :, 1) == 1 ), 1);
in2 = size( find( in( :, 1) == 2 ), 1);
in3 = size( find( in( :, 1) == 3 ), 1);
in4 = size( find( in( :, 1) == 4 ), 1);
in5 = size( find( in( :, 1) == 5 ), 1);
in6 = size( find( in( :, 1) == 6 ), 1);

% sizes of subclasses of input data
sizes = [in0 in1 in2 in3 in4 in5 in6];

% matrix for reduced data
reducedSizes = ceil( sizes / factor);
reduced = zeros( sum( reducedSizes ), 5);

% reduce data in each subclass by factor 
for classNumber = 1 : size( sizes, 2 )
    newClassSize = reducedSizes( classNumber );  
    
    % take mean of values except last ones (which are rest from dividing
    % number of all values by given rate)
    for j = 1 : ( newClassSize - 1 )
        reduced( sum( reducedSizes( 1 : ( classNumber - 1 ))) + j , :) = mean( in((sum( sizes( 1 : (classNumber-1))) + 1) : ( sum( sizes( 1 : (classNumber-1))) + j*factor), :));
    end
    
    % take mean of rest of values
    reduced( sum( reducedSizes( 1 : classNumber )), : ) = mean( in( floor(sum( sizes( 1 : classNumber))/ factor )*factor : sum( sizes( 1 : classNumber ) ), :) );
end
