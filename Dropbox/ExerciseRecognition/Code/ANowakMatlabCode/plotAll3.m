function plotAll3(inp) 

[mean0 normal0] = getM(inp,0);
[mean1 normal1] = getM(inp,1);
[mean2 normal2] = getM(inp,2);
[mean3 normal3] = getM(inp,3);
[mean4 normal4] = getM(inp,4);
[mean5 normal5] = getM(inp,5);
[mean6 normal6] = getM(inp,6);


figure, hold on,
title('Patient 00 arm internal rotation'),

subplot(2,4,1)
hold on
plot(normal0(:,1),normal0(:,2),'Color','red')
plot([1:1:size(mean0,1)],mean0(:,1),'x','Color','red')
plot(normal0(:,1),normal0(:,3),'Color', 'blue')
plot([1:1:size(mean0,1)],mean0(:,2),'x','Color', 'blue')
plot(normal0(:,1),normal0(:,4),'Color', 'cyan')
plot([1:1:size(mean0,1)],mean0(:,3),'x','Color', 'cyan')
plot(normal0(:,1),normal0(:,5),'Color', 'green')
plot([1:1:size(mean0,1)],mean0(:,4),'x','Color', 'green')
title('sensor 0')
ylim([-1 1])
legend('s','s mean', 'x','x mean', 'y','y mean', 'z','z mean')
ylabel('Quaternion values')
xlabel('Time (s)')
hold off;

subplot(2,4,2)
hold on
plot(normal1(:,1),normal1(:,2),'Color','red')
plot([1:1:size(mean1,1)],mean1(:,1),'x','Color','red')
plot(normal1(:,1),normal1(:,3),'Color', 'blue')
plot([1:1:size(mean1,1)],mean1(:,2),'x','Color', 'blue')
plot(normal1(:,1),normal1(:,4),'Color', 'cyan')
plot([1:1:size(mean1,1)],mean1(:,3),'x','Color', 'cyan')
plot(normal1(:,1),normal1(:,5),'Color', 'green')
plot([1:1:size(mean1,1)],mean1(:,4),'x','Color', 'green')
title('sensor 1')
ylim([-1 1])
ylabel('Quaternion values')
xlabel('Time (s)')
hold off;

subplot(2,4,3)
hold on
plot(normal2(:,1),normal2(:,2),'Color','red')
plot([1:1:size(mean2,1)],mean2(:,1),'x','Color','red')
plot(normal2(:,1),normal2(:,3),'Color', 'blue')
plot([1:1:size(mean2,1)],mean2(:,2),'x','Color', 'blue')
plot(normal2(:,1),normal2(:,4),'Color', 'cyan')
plot([1:1:size(mean2,1)],mean2(:,3),'x','Color', 'cyan')
plot(normal2(:,1),normal2(:,5),'Color', 'green')
plot([1:1:size(mean2,1)],mean2(:,4),'x','Color', 'green')
title('sensor 2')
ylim([-1 1])
ylabel('Quaternion values')
xlabel('Time (s)')
hold off;

subplot(2,4,4)
hold on
plot(normal3(:,1),normal3(:,2),'Color','red')
plot([1:1:size(mean3,1)],mean3(:,1),'x','Color','red')
plot(normal3(:,1),normal3(:,3),'Color', 'blue')
plot([1:1:size(mean3,1)],mean3(:,2),'x','Color', 'blue')
plot(normal3(:,1),normal3(:,4),'Color', 'cyan')
plot([1:1:size(mean3,1)],mean3(:,3),'x','Color', 'cyan')
plot(normal3(:,1),normal3(:,5),'Color', 'green')
plot([1:1:size(mean3,1)],mean3(:,4),'x','Color', 'green')
title('sensor 3')
ylim([-1 1])
ylabel('Quaternion values')
xlabel('Time (s)')
hold off;

subplot(2,4,5)
hold on
plot(normal4(:,1),normal4(:,2),'Color','red')
plot([1:1:size(mean4,1)],mean4(:,1),'x','Color','red')
plot(normal4(:,1),normal4(:,3),'Color', 'blue')
plot([1:1:size(mean4,1)],mean4(:,2),'x','Color', 'blue')
plot(normal4(:,1),normal4(:,4),'Color', 'cyan')
plot([1:1:size(mean4,1)],mean4(:,3),'x','Color', 'cyan')
plot(normal4(:,1),normal4(:,5),'Color', 'green')
plot([1:1:size(mean4,1)],mean4(:,4),'x','Color', 'green')
title('sensor 4')
ylim([-1 1])
ylabel('Quaternion values')
xlabel('Time (s)')
hold off;


subplot(2,4,6)
hold on
plot(normal5(:,1),normal5(:,2),'Color','red')
plot([1:1:size(mean5,1)],mean5(:,1),'x','Color','red')
plot(normal5(:,1),normal5(:,3),'Color', 'blue')
plot([1:1:size(mean5,1)],mean5(:,2),'x','Color', 'blue')
plot(normal5(:,1),normal5(:,4),'Color', 'cyan')
plot([1:1:size(mean5,1)],mean5(:,3),'x','Color', 'cyan')
plot(normal5(:,1),normal5(:,5),'Color', 'green')
plot([1:1:size(mean5,1)],mean5(:,4),'x','Color', 'green')
title('sensor 5')
ylim([-1 1])
ylabel('Quaternion values')
xlabel('Time (s)')
hold off;


subplot(2,4,7)
hold on
plot(normal6(:,1),normal6(:,2),'Color','red')
plot([1:1:size(mean6,1)],mean6(:,1),'x','Color','red')
plot(normal6(:,1),normal6(:,3),'Color', 'blue')
plot([1:1:size(mean6,1)],mean6(:,2),'x','Color', 'blue')
plot(normal6(:,1),normal6(:,4),'Color', 'cyan')
plot([1:1:size(mean6,1)],mean6(:,3),'x','Color', 'cyan')
plot(normal6(:,1),normal6(:,5),'Color', 'green')
plot([1:1:size(mean6,1)],mean6(:,4),'x','Color', 'green')
title('sensors')
ylim([-1 1])
ylabel('Quaternion values')
xlabel('Time (s)')
hold off;