%% Contains pre-calibrated gyro offset values
% these are the values read when gyro is stationary

function offset = getGyroOffset(ID)
    
    switch(ID)
        case 0
            offset = [ 62 -1 -3];
        case 1
            offset = [ 28 19 4];
        case 2
            offset = [ 59 7 5];
        case 3
            offset = [ 35 2 2];
        case 4
            offset = [ -17 -5 14];
        case 5
            offset = [ 35 -15 -4];
        case 6
            offset = [ -7 -21 0];
        otherwise
            offset = [0 0 0];
    end
end