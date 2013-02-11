%% Parse csv into raw data by individual nodes
% data - the imported csv data
% varheader (string) - the name of the variable assigned in workspace

% e.g. >> csv2nodes(data, 'node');
% generates variables 'node_0' to 'node_6' for a typical 7 node dataset

function csv2nodes(data, varheader)
    tempData = zeros(size(data,1));
    
    for i=0:7
        %% filter data based on field 2 (node id)
        tempData = data( data(:, 2) == i, :);
        
        if(size(tempData,1) > 0)
            %% generate variable names
            varname = genvarname([varheader '_' num2str(i)]);
            varnameYPR = genvarname(['ypr' num2str(i)]);
            
            %% assign variable in workspace
            assignin('base', varname, tempData);           
            
            %% calculate YPR for each node
            assignin('base', varnameYPR, quaternionToYpr_array(tempData));
        end
    end
    
end

