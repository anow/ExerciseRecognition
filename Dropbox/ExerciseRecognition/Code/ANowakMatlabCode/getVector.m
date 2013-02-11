%% computes the X, Y or Z axis of body into
% outputs vector representation in earth's frame
% axisName - 'x', 'y' or 'z'
    
function vector = getVector(quaternion, axisName)
    % short form
    q = quaternion;
    
    % construct output
    vector = zeros(1,3);
    
    switch (axisName)
        case {'x', 'X'}
            vector(1) = 2*q(2)*q(3) - 2*q(1)*q(4);
            vector(2) = q(1)*q(1) - q(2)*q(2) + q(3)*q(3) - q(4)*q(4);
            vector(3) = 2*q(3)*q(4) + 2*q(1)*q(2);
        case {'y', 'Y'}
            vector(1) = q(1)*q(1) + q(2)*q(2) - q(3)*q(3) - q(4)*q(4);
            vector(2) = 2*q(2)*q(3) + 2*q(1)*q(4);
            vector(3) = 2*q(2)*q(4) - 2*q(1)*q(3);
        case {'z', 'Z'}
            vector(1) = 2*q(2)*q(4) + 2*q(1)*q(3);
            vector(2) = 2*q(3)*q(4) - 2*q(1)*q(2);
            vector(3) = q(1)*q(1) - q(2)*q(2) - q(3)*q(3) + q(4)*q(4);
        otherwise
            disp('No such axis');
    end
end