%% Calculates angle moved by an axis
    % calculates the absolute angle between
    % start and end axes of the node
    % using dot product
    
    % node - quaternion data from an individual node (from csv2nodes)
    % varargin:
    %   Vnormal (vector) = restrict in plane specified by normal vector
    %   'horizontal' = angle with horizontal plane
    %   'vertical' = angle with vertical plane
    
function readings = axis_movement(node, axis, varargin)
    
    %% obtain quaternion at start of exercise
    Qstart = node(1, 3:6);
    Vstart = getVector(Qstart, axis);
    
    %% determine if plane restriction is desired
    restrictInPlane = 0;
    vertical = 0;
    inplanevertical=0;
    inplanehorizontal=0;
    
    if(nargin > 2)
        if(size(varargin{1},2) == 3)
            Vnormal = varargin{1};
            restrictInPlane = 1;
            
            if(size(varargin,2) == 2)
                if(strcmp(varargin{2}, 'vertical'))
                    Vstart = [0,0,1];
                    inplanevertical = 1;
                elseif(strcmp(varargin{2},'horizontal'))
                    Vstart = [0,0,1];
                    inplanehorizontal = 1;
                else
                    error('invalid input: only vertical or horizontal allowed');
                end
            end
            
        elseif(strcmp(varargin{1}, 'horizontal'))
            % horizontal plane is normal to vertical
            Vnormal = [0,0,1];
            restrictInPlane = 1;
        elseif(strcmp(varargin{1}, 'vertical'))
            vertical = 1;
        else
            error('Argument Error');
        end
    end
    

    
    % get projection of start vector if required
    if(restrictInPlane == 1 && inplanevertical == 0 && inplanehorizontal == 0)
        Vtemp = cross(Vstart, Vnormal);
        Vstart = cross(Vnormal, Vtemp);
    end
    
    %% init readings for speed
    readings = zeros(size(node,1)-1, 2);
    
    %% calc dot angle for subsequent readings
    for i=1:size(node,1)-1
        % put time stamp
        readings(i,1) = node(i+1,1);
        
        % get quaternion at i
        Qnow = node(i, 3:6);
        
        % get vector
        Vnow = getVector(Qnow, axis);
        
        % get angle
        if(vertical == 1)
            readings(i,2) = rad2deg(atan2(Vnow(3),(sqrt(Vnow(1)*Vnow(1) + Vnow(2)*Vnow(2))))) + 90;
        elseif(restrictInPlane == 0)
            readings(i,2) = angleBetween(Vstart, Vnow);
        else
            Vtemp = cross(Vnow, Vnormal);
            Vproj = cross(Vnormal, Vtemp);
            
            if(inplanevertical == 1)
                readings(i,2) = angleBetween(Vstart, Vproj);
            elseif(inplanehorizontal == 1)
                readings(i,2) = angleBetween(Vstart, Vproj) + 90;
            else
                readings(i,2) = angleBetween(Vstart, Vproj);
            end;
        end
    end
end