%% Converts a series of data into a series of YPR
% input should be an entire set of data quaternion from a single node

function ypr_array = quaternionToYpr_array(q)
	%% pre-allocate space
    ypr_array = zeros(size(q,1),8);

    for i = 1:size(q,1)
        %% extract the quaternion from a single line
        extractedQ = extractQuartenion(q(i,:));
        
        %% calculate the YPR from the quaternion
        temp = quaternionToYpr(extractedQ);
        
        ypr_array(i,1:size(temp,2)) = temp;
    end
end