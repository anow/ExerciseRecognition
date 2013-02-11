function plotAll(inp) 

reducedInp = getAverage(inp);
nonreduced0 = getNotAverage(inp,0);
nonreduced1 = getNotAverage(inp,1);
nonreduced2 = getNotAverage(inp,2);
nonreduced3 = getNotAverage(inp,3);
nonreduced4 = getNotAverage(inp,4);
nonreduced5 = getNotAverage(inp,5);
nonreduced6 = getNotAverage(inp,6);

redSize = size(reducedInp,1);

figure, hold on,
title('Patient 00 arm internal rotation'),

subplot(2,4,1)
hold on,
title('sensor 0')
plot(nonreduced0(:,1),nonreduced0(:,2:5),'.')
plot(reducedInp([1:7:redSize],:))
ylabel('Quaternion values')
xlabel('Time (s)')
hold off;

subplot(2,4,2)
hold on,
plot(nonreduced1(:,1),nonreduced1(:,2:5),'.')
plot(reducedInp([2:7:redSize],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('sensor 1')
hold off;

subplot(2,4,3)
hold on,
plot(nonreduced2(:,1),nonreduced2(:,2:5),'.')
plot(reducedInp([3:7:redSize],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('sensor 2')
hold off;

subplot(2,4,4)
hold on,
plot(nonreduced3(:,1),nonreduced3(:,2:5),'.')
plot(reducedInp([4:7:redSize],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('sensor 3')
hold off;

subplot(2,4,5)
hold on,
plot(nonreduced4(:,1),nonreduced4(:,2:5),'.')
plot(reducedInp([5:7:redSize],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('sensor 4')
hold off;


subplot(2,4,6)
hold on,
plot(nonreduced5(:,1),nonreduced5(:,2:5),'.')
plot(reducedInp([6:7:redSize],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('sensor 5')
hold off;


subplot(2,4,7)
hold on,
plot(nonreduced6(:,1),nonreduced6(:,2:5),'.')
plot(reducedInp([7:7:redSize],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('sensor 6')
legend('s','x','y','z')
hold off;
