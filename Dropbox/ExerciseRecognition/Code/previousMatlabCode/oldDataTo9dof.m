%% Extracts pre-quaternion data and apply calibration offsets
% data - data array from a single node

function dataRaw = oldDataTo9dof(data)
    
    dataRaw = zeros(size(data,1),9);
    
    for i=1:size(data,1)
        % extract ID
        nodeID = data(i,2);
        
        % get gyro offsets
        warning('Ensure gyro offsets are up to data');
        gyroOffset = getGyroOffset(nodeID);

        % accelerometer
        dataRaw(i,1) = data(i,3);
        dataRaw(i,2) = data(i,4);
        dataRaw(i,3) = data(i,5);

        % gyroscope (apply offsets)
        dataRaw(i,4) = (data(i,6) - gyroOffset(1)) / 14.375;
        dataRaw(i,5) = (data(i,7) - gyroOffset(2)) / 14.375;
        dataRaw(i,6) = (data(i,8) - gyroOffset(3)) / 14.375;

        % compass
        dataRaw(i,7) = data(i,9);
        dataRaw(i,8) = data(i,10);
        dataRaw(i,9) = data(i,11);
        
        % time
        dataRaw(i,10) = data(i,1);
    end
    
    
end