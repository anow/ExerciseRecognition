function plotAll4(inp1, inp2, inp3, inp4, inp5, inp6) 

reducedInp1 = getAverage(inp1);
nonreduced01 = getNotAverage(inp1,0);
nonreduced11 = getNotAverage(inp1,1);
nonreduced21 = getNotAverage(inp1,2);
nonreduced31 = getNotAverage(inp1,3);
nonreduced41 = getNotAverage(inp1,4);
nonreduced51 = getNotAverage(inp1,5);
nonreduced61 = getNotAverage(inp1,6);
redSize1 = size(reducedInp1,1);


reducedInp2 = getAverage(inp2);
nonreduced02 = getNotAverage(inp2,0);
nonreduced12 = getNotAverage(inp2,1);
nonreduced22 = getNotAverage(inp2,2);
nonreduced32 = getNotAverage(inp2,3);
nonreduced42 = getNotAverage(inp2,4);
nonreduced52 = getNotAverage(inp2,5);
nonreduced62 = getNotAverage(inp2,6);
redSize2 = size(reducedInp2,1);

reducedInp3 = getAverage(inp3);
nonreduced03 = getNotAverage(inp3,0);
nonreduced13 = getNotAverage(inp3,1);
nonreduced23 = getNotAverage(inp3,2);
nonreduced33 = getNotAverage(inp3,3);
nonreduced43 = getNotAverage(inp3,4);
nonreduced53 = getNotAverage(inp3,5);
nonreduced63 = getNotAverage(inp3,6);
redSize3 = size(reducedInp3,1);

reducedInp4 = getAverage(inp4);
nonreduced04 = getNotAverage(inp4,0);
nonreduced14 = getNotAverage(inp4,1);
nonreduced24 = getNotAverage(inp4,2);
nonreduced34 = getNotAverage(inp4,3);
nonreduced44 = getNotAverage(inp4,4);
nonreduced54 = getNotAverage(inp4,5);
nonreduced64 = getNotAverage(inp4,6);
redSize4 = size(reducedInp4,1);


reducedInp5 = getAverage(inp5);
nonreduced05 = getNotAverage(inp5,0);
nonreduced15 = getNotAverage(inp5,1);
nonreduced25 = getNotAverage(inp5,2);
nonreduced35 = getNotAverage(inp5,3);
nonreduced45 = getNotAverage(inp5,4);
nonreduced55 = getNotAverage(inp5,5);
nonreduced65 = getNotAverage(inp5,6);
redSize5 = size(reducedInp5,1);


reducedInp6 = getAverage(inp6);
nonreduced06 = getNotAverage(inp6,0);
nonreduced16 = getNotAverage(inp6,1);
nonreduced26 = getNotAverage(inp6,2);
nonreduced36 = getNotAverage(inp6,3);
nonreduced46 = getNotAverage(inp6,4);
nonreduced56 = getNotAverage(inp6,5);
nonreduced66 = getNotAverage(inp6,6);
redSize6 = size(reducedInp6,1);



figure, hold on,
subplot(2,4,1)
hold on,
title('patient 1 first')
plot(nonreduced01(:,1),nonreduced01(:,2:5),'.')
plot(reducedInp1([1:7:redSize1],:))
ylabel('Quaternion values')
xlabel('Time (s)')
set(gca,'YTick',-1:0.5:1)
hold off;

subplot(2,4,2)
hold on,
title('patient 1 second')
plot(nonreduced02(:,1),nonreduced02(:,2:5),'.')
plot(reducedInp2([1:7:redSize2],:))
ylabel('Quaternion values')
xlabel('Time (s)')
set(gca,'YTick',-1:0.5:1)
hold off;

subplot(2,4,3)
hold on,
title('patient 2 first')
plot(nonreduced03(:,1),nonreduced03(:,2:5),'.')
plot(reducedInp3([1:7:redSize3],:))
ylabel('Quaternion values')
xlabel('Time (s)')
set(gca,'YTick',-1:0.5:1)
hold off;

subplot(2,4,4)
hold on,
title('patient 2 second')
plot(nonreduced04(:,1),nonreduced04(:,2:5),'.')
plot(reducedInp4([1:7:redSize4],:))
ylabel('Quaternion values')
xlabel('Time (s)')
set(gca,'YTick',-1:0.5:1)
hold off;

subplot(2,4,5)
hold on,
title('patient 3 first')
plot(nonreduced05(:,1),nonreduced05(:,2:5),'.')
plot(reducedInp5([1:7:redSize5],:))
ylabel('Quaternion values')
xlabel('Time (s)')
set(gca,'YTick',-1:0.5:1)
hold off;

subplot(2,4,6)
hold on,
title('patient 3 second')
plot(nonreduced06(:,1),nonreduced06(:,2:5),'.')
plot(reducedInp6([1:7:redSize6],:))
ylabel('Quaternion values')
xlabel('Time (s)')
set(gca,'YTick',-1:0.5:1)
hold off;

hold off;


figure, hold on;
subplot(2,4,1)
hold on,
plot(nonreduced11(:,1),nonreduced11(:,2:5),'.')
plot(reducedInp1([2:7:redSize1],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('patient 1 first')
set(gca,'YTick',-1:0.5:1)
hold off;

subplot(2,4,2)
hold on,
plot(nonreduced12(:,1),nonreduced12(:,2:5),'.')
plot(reducedInp2([2:7:redSize2],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('patient 1 second')
set(gca,'YTick',-1:0.5:1)
hold off;

subplot(2,4,3)
hold on,
plot(nonreduced13(:,1),nonreduced13(:,2:5),'.')
plot(reducedInp3([2:7:redSize3],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('patient 2 first')
set(gca,'YTick',-1:0.5:1)
hold off;

subplot(2,4,4)
hold on,
plot(nonreduced14(:,1),nonreduced14(:,2:5),'.')
plot(reducedInp4([2:7:redSize4],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('patient 2 second')
set(gca,'YTick',-1:0.5:1)
hold off;

subplot(2,4,5)
hold on,
plot(nonreduced15(:,1),nonreduced15(:,2:5),'.')
plot(reducedInp5([2:7:redSize5],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('patient 3 first')
set(gca,'YTick',-1:0.5:1)
hold off;

subplot(2,4,6)
hold on,
plot(nonreduced16(:,1),nonreduced16(:,2:5),'.')
plot(reducedInp6([2:7:redSize6],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('patient 3 second')
set(gca,'YTick',-1:0.5:1)
hold off;
hold off;


figure, hold on;
subplot(2,4,1)
hold on,
plot(nonreduced21(:,1),nonreduced21(:,2:5),'.')
plot(reducedInp1([3:7:redSize1],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('patient 1 first')
set(gca,'YTick',-1:0.5:1)
hold off;

subplot(2,4,2)
hold on,
plot(nonreduced22(:,1),nonreduced22(:,2:5),'.')
plot(reducedInp2([3:7:redSize2],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('patient 1 second')
set(gca,'YTick',-1:0.5:1)
hold off;

subplot(2,4,3)
hold on,
plot(nonreduced23(:,1),nonreduced23(:,2:5),'.')
plot(reducedInp3([3:7:redSize3],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('patient 2 first')
set(gca,'YTick',-1:0.5:1)
hold off;

subplot(2,4,4)
hold on,
plot(nonreduced24(:,1),nonreduced24(:,2:5),'.')
plot(reducedInp4([3:7:redSize4],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('patient 2 second')
set(gca,'YTick',-1:0.5:1)
hold off;

subplot(2,4,5)
hold on,
plot(nonreduced25(:,1),nonreduced25(:,2:5),'.')
plot(reducedInp5([3:7:redSize5],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('patient 3 first')
set(gca,'YTick',-1:0.5:1)
hold off;

subplot(2,4,6)
hold on,
plot(nonreduced26(:,1),nonreduced26(:,2:5),'.')
plot(reducedInp6([3:7:redSize6],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('patient 3 second')
set(gca,'YTick',-1:0.5:1)
hold off;
hold off;


figure, hold on;
subplot(2,4,1)
hold on,
plot(nonreduced31(:,1),nonreduced31(:,2:5),'.')
plot(reducedInp1([4:7:redSize1],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('patient 1 first')
set(gca,'YTick',-1:0.5:1)
hold off;

subplot(2,4,2)
hold on,
plot(nonreduced32(:,1),nonreduced32(:,2:5),'.')
plot(reducedInp2([4:7:redSize2],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('patient 1 second')
set(gca,'YTick',-1:0.5:1)
hold off;

subplot(2,4,3)
hold on,
plot(nonreduced33(:,1),nonreduced33(:,2:5),'.')
plot(reducedInp3([4:7:redSize3],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('patient 2 first')
set(gca,'YTick',-1:0.5:1)
hold off;

subplot(2,4,4)
hold on,
plot(nonreduced34(:,1),nonreduced34(:,2:5),'.')
plot(reducedInp4([4:7:redSize4],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('patient 2 second')
set(gca,'YTick',-1:0.5:1)
hold off;

subplot(2,4,5)
hold on,
plot(nonreduced35(:,1),nonreduced35(:,2:5),'.')
plot(reducedInp5([4:7:redSize5],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('patient 3 first')
set(gca,'YTick',-1:0.5:1)
hold off;

subplot(2,4,6)
hold on,
plot(nonreduced36(:,1),nonreduced36(:,2:5),'.')
plot(reducedInp6([4:7:redSize6],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('patient 3 second')
set(gca,'YTick',-1:0.5:1)
hold off;
hold off;


figure, hold on;
subplot(2,4,1)
hold on,
plot(nonreduced41(:,1),nonreduced41(:,2:5),'.')
plot(reducedInp1([5:7:redSize1],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('patient 1 first')
set(gca,'YTick',-1:0.5:1)
hold off;

subplot(2,4,2)
hold on,
plot(nonreduced42(:,1),nonreduced42(:,2:5),'.')
plot(reducedInp2([5:7:redSize2],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('patient 1 second')
set(gca,'YTick',-1:0.5:1)
hold off;

subplot(2,4,3)
hold on,
plot(nonreduced43(:,1),nonreduced43(:,2:5),'.')
plot(reducedInp3([5:7:redSize3],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('patient 2 first')
set(gca,'YTick',-1:0.5:1)
hold off;

subplot(2,4,4)
hold on,
plot(nonreduced44(:,1),nonreduced44(:,2:5),'.')
plot(reducedInp4([5:7:redSize4],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('patient 2 second')
set(gca,'YTick',-1:0.5:1)
hold off;

subplot(2,4,5)
hold on,
plot(nonreduced45(:,1),nonreduced45(:,2:5),'.')
plot(reducedInp5([5:7:redSize5],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('patient 3 first')
set(gca,'YTick',-1:0.5:1)
hold off;

subplot(2,4,6)
hold on,
plot(nonreduced46(:,1),nonreduced46(:,2:5),'.')
plot(reducedInp6([5:7:redSize6],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('patient 3 second')
set(gca,'YTick',-1:0.5:1)
hold off;
hold off;

figure, hold on;
subplot(2,4,1)
hold on,
plot(nonreduced51(:,1),nonreduced51(:,2:5),'.')
plot(reducedInp1([6:7:redSize1],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('patient 1 first')
set(gca,'YTick',-1:0.5:1)
hold off;

subplot(2,4,2)
hold on,
plot(nonreduced52(:,1),nonreduced52(:,2:5),'.')
plot(reducedInp2([6:7:redSize2],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('patient 1 second')
set(gca,'YTick',-1:0.5:1)
hold off;

subplot(2,4,3)
hold on,
plot(nonreduced53(:,1),nonreduced53(:,2:5),'.')
plot(reducedInp3([6:7:redSize3],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('patient 2 first')
set(gca,'YTick',-1:0.5:1)
hold off;

subplot(2,4,4)
hold on,
plot(nonreduced54(:,1),nonreduced54(:,2:5),'.')
plot(reducedInp4([6:7:redSize4],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('patient 2 second')
set(gca,'YTick',-1:0.5:1)
hold off;

subplot(2,4,5)
hold on,
plot(nonreduced55(:,1),nonreduced55(:,2:5),'.')
plot(reducedInp5([6:7:redSize5],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('patient 3 first')
set(gca,'YTick',-1:0.5:1)
hold off;

subplot(2,4,6)
hold on,
plot(nonreduced56(:,1),nonreduced56(:,2:5),'.')
plot(reducedInp6([6:7:redSize6],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('patient 3 second')
set(gca,'YTick',-1:0.5:1)
hold off;


figure, hold on;
subplot(2,4,1)
hold on,
plot(nonreduced61(:,1),nonreduced61(:,2:5),'.')
plot(reducedInp1([7:7:redSize1],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('patient 1 first')
set(gca,'YTick',-1:0.5:1)
hold off;

subplot(2,4,2)
hold on,
plot(nonreduced62(:,1),nonreduced62(:,2:5),'.')
plot(reducedInp2([7:7:redSize2],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('patient 1 second')
set(gca,'YTick',-1:0.5:1)
hold off;

subplot(2,4,3)
hold on,
plot(nonreduced63(:,1),nonreduced63(:,2:5),'.')
plot(reducedInp3([7:7:redSize3],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('patient 2 first')
set(gca,'YTick',-1:0.5:1)
hold off;

subplot(2,4,4)
hold on,
plot(nonreduced64(:,1),nonreduced64(:,2:5),'.')
plot(reducedInp4([7:7:redSize4],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('patient 2 second')
set(gca,'YTick',-1:0.5:1)
hold off;

subplot(2,4,5)
hold on,
plot(nonreduced65(:,1),nonreduced65(:,2:5),'.')
plot(reducedInp5([7:7:redSize5],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('patient 3 first')
set(gca,'YTick',-1:0.5:1)
hold off;

subplot(2,4,6)
hold on,
plot(nonreduced66(:,1),nonreduced66(:,2:5),'.')
plot(reducedInp6([7:7:redSize6],:))
ylabel('Quaternion values')
xlabel('Time (s)')
title('patient 3 second')
set(gca,'YTick',-1:0.5:1)
hold off;
hold off;
