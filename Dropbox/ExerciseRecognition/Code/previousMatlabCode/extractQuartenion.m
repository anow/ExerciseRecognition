function q = extractQuartenion(qin)
    % extract time
    q(1) = qin(1);
    
    % extracts the quartenion
    q(2:5) = qin(3:6);
    
    % activity type and confirmation
%     q(6:9) = qin(7:10);
end