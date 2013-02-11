%% Calculates angle between two vectors in degrees
% uses scalar product
% angle is always the smaller angle (<= 180)
function angle_deg = angleBetween(VectStart, VectEnd)

    mStart = VectorMagnitude(VectStart);
    mEnd = VectorMagnitude(VectEnd);
    
    angle_rad = acos(dot(VectStart, VectEnd) / (mStart * mEnd));
    angle_deg = rad2deg(angle_rad);
    
end