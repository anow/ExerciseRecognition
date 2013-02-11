%% Prevents interpreting negative numbers

function y = sbin2dec(x)
        if(str2num(x(1))==0)
            y = bin2dec(x(2:end));
        else
            y = bin2dec(x(2:end)) - 2 ^ (length(x) - 1);
        end
end