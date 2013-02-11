function res = getStandardDev2(class, orient)

[devGrad1x devGrad2x devGrad3x devGrad4x devGrad5x devGrad6x] = gradients(class, orient);

sizes = [size(devGrad1x,1) size(devGrad2x,1) size(devGrad3x,1) size(devGrad4x,1) size(devGrad5x,1) size(devGrad6x,1)];

resultSize = max(sizes);

a2 = devGrad1x(:,2:4);
a3 = devGrad2x(:,2:4);
a4 = devGrad3x(:,2:4);
a5 = devGrad4x(:,2:4);
a6 = devGrad5x(:,2:4);
a7 = devGrad6x(:,2:4);

resY = zeros(resultSize,18);

resY(1:sizes(1),1:3) = a2;
resY(1:sizes(2),4:6) = a3;
resY(1:sizes(3),7:9) = a4;
resY(1:sizes(4),10:12) = a5;
resY(1:sizes(5),13:15) = a6;
resY(1:sizes(6),16:18) = a7;


for i=1:size(resY,1)
    for j=1:size(resY,2)
        if(isnan(resY(i,j)))
            resY(i,j) = 0;
        end
    end
end

resNew = var(resY);

m = nanmax(resNew);
res = resNew./m;

for i=1:18
    if(isnan(res(i)))
        res(i) = 0;
    end
end