function errRes = countError(col1, col2)
% function counts dissimilarities between to columns and divides it by
% number of rows returning resulting error
% Input:
% col1, col2 -two columns of equal size to compare
% 
% Output:
% errRes - result of comparison


err = 0;
for i=1:size(col1,1)
   if(col1(i) ~= col2(i))
       err = err+1;
   end
end
errRes = (1 - err/size(col1,1))*100;