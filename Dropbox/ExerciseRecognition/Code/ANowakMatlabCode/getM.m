function [res1 res2] = getM(inp1, sensor)

in = inp1(:,2:6);
blocs = floor(size(inp1,1)/50);
res1 = zeros(blocs,4);
zz = size(find(in(1:blocs*50,1)==sensor),1);
res2 = zeros(zz,5);
kk = 1;

for i=1:blocs
    a = find( in(((i-1)*50+1):i*50, 1) == sensor );
    if(isempty(a))
    else
        aa = in(((i-1)*50+a),2:5);
        
        k = size(a,1)
        a2 = mean(aa);
        
        res2(kk:(kk+k-1),:) =  [(i-1)+a/50 aa];
        if(i==blocs)
            res2(zz,:) = [blocs aa(size(aa,1),:)];
        else
            kk = kk+k;
        end
        res1(i,:) = a2;
    end
    
end

%     a = find( in((blocs*50+1):size(inp1,1), 1) == sensor );
%     if(isempty(a))
%         sprintf('empty a')
%     else
%         aa = in((blocs*50+a),2:5);
%         k = size(a,1);
%         a2 = mean(aa);
%         
%         res2(kk:(kk+k-1),:) = [blocs+a/50 aa];
%         res2(zz,:) = [blocs+1 aa(size(aa,1),:)]
%         res1(blocs+1,:) = a2
%     end

    