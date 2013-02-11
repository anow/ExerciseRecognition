function res = remove0(inp)

% ind = find((inp(:,1)>0) || (inp(:,1)<0))

ind = find(inp(:,1)==0)

for i=1:size(ind)
    if (inp(ind(i))== zeros(1,size(inp,2)))
        inp(ind(i)) = [];
    end
end

res = inp;