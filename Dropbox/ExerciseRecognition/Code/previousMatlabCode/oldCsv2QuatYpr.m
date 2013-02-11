%% Converts pre-quaternion CSVs to quaternions and YPR
% based on sensor fusion algorithm
% only compatible with smartphone output. 
% assumes all accelerometer, gyroscope and compass readings are available
% Please edit 'oldDataTo9dof' to make it compatible to other systems

function oldCsv2QuatYpr(data, varheader)
    tempData = zeros(size(data,1));
    
    for i=0:7
        tempData = data( data(:, 2) == i, :);
        
        if(size(tempData,1) > 0)
            varname = genvarname([varheader '_' num2str(i)]);
            assignin('base', varname, tempData);
            
            rawData = oldDataTo9dof(tempData);
            quat = getQuatFrom9dof(rawData);
            ypr = quaternionToYpr_array(quat);
            
            % output the values
            varname = genvarname([varheader '_quat_' num2str(i)]);
            assignin('base', varname, quat);
            varname = genvarname([varheader '_ypr_' num2str(i)]);
            assignin('base', varname, ypr);
           
        end
    end
    
end