function res = getNotAverage(inp,sensor)

%array = dataset(:, 2:6);
in = inp(:,2:6);

a = find( in(:, 1) == sensor );
res = [(a/50), in(a,2:5)];
    
