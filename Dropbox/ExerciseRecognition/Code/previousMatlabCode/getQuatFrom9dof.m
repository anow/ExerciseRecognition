%% Calculates quaternion based on a series of data
% sampleRate - sampling frequency in millis (default = 40ms)

function quart = getQuatFrom9dof(data, sampleRate)
    
    if(nargin < 2)
        warning('Default sample rate of 40ms used');
        sampleRate = 40;
    end
    
    twoKp = 2.0 * 0.5;
    twoKi = 2.0 * 0.1;
    
    % initialize
    quart(1,1) = 1.0;
    quart(1,2) = 0.0;
    quart(1,3) = 0.0;
    quart(1,4) = 0.0;
    quart(1,5) = 0;
    
    integralFBx = 0.0;
    integralFBy = 0.0;
    integralFBz = 0.0;
    
    for i=1:size(data,1)
        % load data from previous loop
        q(1) = quart(i,1);
        q(2) = quart(i,2);
        q(3) = quart(i,3);
        q(4) = quart(i,4);
        
        % pre calc aux variables
        q0q0 = q(1) * q(1);
        q0q1 = q(1) * q(2);
        q0q2 = q(1) * q(3);
        q0q3 = q(1) * q(4);
        q1q1 = q(2) * q(2);
        q1q2 = q(2) * q(3);
        q1q3 = q(2) * q(4);
        q2q2 = q(3) * q(3);
        q2q3 = q(3) * q(4);
        q3q3 = q(4) * q(4);
        
        % extract raw readings
        ax = data(i,1);
        ay = data(i,2);
        az = data(i,3);
        
        gx = data(i,4) * 0.01745329252;
        gy = data(i,5) * 0.01745329252;
        gz = data(i,6) * 0.01745329252;
        
        mx = data(i,8);
        my = -data(i,7);
        mz = data(i,9);
        
        % time stamp
        quart(i,5) = data(i,10);
        
        if(mx ~= 0 && my ~= 0 && mz ~= 0)
            rNorm = 1/sqrt(mx*mx + my*my + mz*mz);
            mx = mx * rNorm;
            my = my * rNorm;
            mz = mz * rNorm;
            
            hx = 2*(mx * (0.5-q2q2-q3q3) + my * (q1q2-q0q3) + mz * (q1q3+q0q2));
            hy = 2*(mx * (q1q2+q0q3) + my * (0.5-q1q1-q3q3) + mz * (q2q3-q0q1));
            bx = sqrt(hx*hx + hy*hy);
            bz = 2*(mx * (q1q3-q0q2) + my * (q2q3+q0q1) + mz * (0.5-q1q1-q2q2));
            
            halfwx = bx * (0.5-q2q3-q3q3) + bz * (q1q3-q0q2);
            halfwy = bx * (q1q2-q0q3) + bz * (q0q1+q2q3);
            halfwz = bx * (q0q2-q1q3) + bz * (0.5-q1q1-q2q2);
            
            halfex = my*halfwz - mz*halfwy;
            halfey = mz*halfwx - mx*halfwz;
            halfez = mx*halfwy - my*halfwx;            
        end
        
        if(ax ~= 0 && ay ~= 0 && az ~= 0)
            rNorm = 1/sqrt(ax*ax + ay*ay + az*az);
            ax = ax * rNorm;
            ay = ay * rNorm;
            az = az * rNorm;
            
            halfvx = q1q3 - q0q2;
            halfvy = q0q1 + q2q3;
            halfvz = q0q0 - 0.5 + q3q3;
            
            halfex = halfex + ay * halfvz - az * halfvy;
            halfey = halfey + az * halfvx - ax * halfvz;
            halfez = halfez + ax * halfvy - ay * halfvx;
        end
        
        if(halfex ~= 0 && halfey ~= 0 && halfez ~= 0)
            if(twoKi > 0)
               integralFBx = integralFBx + (twoKi * halfex * 1/25);
               integralFBy = integralFBy + (twoKi * halfey * 1/25);
               integralFBz = integralFBz + (twoKi * halfez * 1/25);
               gx = gx + integralFBx;
               gy = gy + integralFBy;
               gz = gz + integralFBz;
            else
                integralFBx = 0;
                integralFBy = 0;
                integralFBz = 0;
            end
            
            gx = gx + twoKp * halfex;
            gy = gy + twoKp * halfey;
            gz = gz + twoKp * halfez;
        end
        
        gx = gx * (0.5 * sampleRate/1000);
        gy = gy * (0.5 * sampleRate/1000);
        gz = gz * (0.5 * sampleRate/1000);
        
        qa = q(1);
        qb = q(2);
        qc = q(3);
        
        q(1) = q(1) + (-qb * gx - qc * gy - q(4) * gz);
        q(2) = q(2) + (qa * gx + qc * gz - q(4) * gy);
        q(3) = q(3) + (qa * gy - qb * gz + q(4) * gx);
        q(4) = q(4) + (qa * gz + qb * gy - qc * gx);
        
        rNorm = 1/sqrt(q(1)*q(1) + q(2)*q(2) + q(3)*q(3) + q(4)*q(4));
        q(1) = q(1) * rNorm;
        q(2) = q(2) * rNorm;
        q(3) = q(3) * rNorm;
        q(4) = q(4) * rNorm;
        
        % load back into array
        quart(i+1,1) = q(1);
        quart(i+1,2) = q(2);
        quart(i+1,3) = q(3);
        quart(i+1,4) = q(4);
       
    end
    
    
end
