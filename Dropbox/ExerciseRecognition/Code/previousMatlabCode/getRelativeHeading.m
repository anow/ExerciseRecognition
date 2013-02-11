%% Compute relative heading between 2 samples
function result = getRelativeHeading(subj, ref)
    if(subj < ref)
			subj = 360 + subj;
    end
    result = subj - ref;

    if(result > 180)
        result = result - 360;
    end
	
end