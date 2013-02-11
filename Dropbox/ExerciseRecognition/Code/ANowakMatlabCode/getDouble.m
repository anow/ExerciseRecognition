function res = getDouble(inp)

data1 = zeros(size(inp,1), size(inp,2));
for i=1:size(data1,1)
    for j=1:size(data1,2)
        data1(i,j) = str2double(inp(i,j));
    end
end

res(1,1) = cell2mat(inp(1,1));
res(1,7) = cell2mat(inp(1,7));
res(1,13) = cell2mat(inp(1,13));

