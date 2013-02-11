%% Computes the relative heading between 2 nodes
% subj - subject node YPRs (from csv2nodes)
% ref - reference node (from csv2nodes)
% always returns -180<x<180, 
% -ve result = anti-clockwise from reference
% +ve result = clockwise from reference

function result = getRelativeHeading_YPR(subj, ref)
    count = size(subj,1);
    if(size(ref,1) < count)
        count = size(ref,1);
    end
    
    result = zeros(count,2);
    for i=1:count
        result(i,1) = subj(i,1);
        result(i,2) = getRelativeHeading(subj(i,2), ref(i,2));
    end
    
end