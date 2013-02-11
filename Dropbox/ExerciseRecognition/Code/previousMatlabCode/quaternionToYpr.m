%% Compute Yaw, Pitch and Roll from Quaternion
% Note: Quaternion should be values 2:5

function ypr = quaternionToYpr(qin)
    q(1:4) = qin(2:5);
    
    % projection of y axis 
    gx = q(1)*q(1) + q(2)*q(2) - q(3)*q(3) - q(4)*q(4);
    gy = 2 * (q(2)*q(3) + q(1)*q(4));
    gz = 2 * (q(2)*q(4) - q(1)*q(3));
    
    % projection of x axis
    nx = 2 * (q(2)*q(3) - q(1)*q(4));
    ny = q(1)*q(1) - q(2)*q(2) + q(3)*q(3) - q(4)*q(4);
    nz = 2 * (q(3)*q(4) + q(1)*q(2));
    
    % time stamp
    ypr(1) = qin(1);
    
    % heading
    ypr(2) = atan2(ny, nx);
    
    % elevation
    ypr(3) = atan2(nz, sqrt(nx*nx + ny*ny));
    
    % bank
    ypr(4) = atan2(gz, sqrt(gx*gx + gy*gy));
    
        
    % convert to degrees
    ypr(2) = (pi - ypr(2)) * 57.2957795131;
    ypr(3) = ypr(3) * -57.2957795131;
    ypr(4) = ypr(4) * 57.2957795131;
    
    % activity type and confirmation
%     ypr(5:8) = qin(6:9);
end