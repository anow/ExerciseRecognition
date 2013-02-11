%% Computes the magnitude of a 3D vector
function result = VectorMagnitude(Vector)

    result = sqrt(Vector(1)*Vector(1)...
        + Vector(2)*Vector(2)...
        + Vector(3)*Vector(3));
    
    
end