function res1 = getTimestamps(input)

smallest = min(input(:,1));
res1 = zeros(1,14);
for i=0:6
  ccc = find(input(:,2)==i);
  if(size(ccc)>0)
    res1(1,(2*i+1)) = input(ccc(1),1) - smallest;  
    res1(1,(2*i+2)) = ccc(1); 
  else
    res1(1,(2*i+1)) = 0; 
    res1(1,(2*i+2)) = 0;
  end
end

[m ix] = sort(res1(1,[2 4 6 8 10 12 14]));
res1(1, [2 4 6 8 10 12 14]) = ix;