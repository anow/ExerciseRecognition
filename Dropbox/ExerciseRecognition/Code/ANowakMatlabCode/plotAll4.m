function plotAll4(inp1, inp2, inp3, inp4, inp5, inp6) 

[mean01 normal01] = getM(inp1,0);
[mean11 normal11] = getM(inp1,1);
[mean21 normal21] = getM(inp1,2);
[mean31 normal31] = getM(inp1,3);
[mean41 normal41] = getM(inp1,4);
[mean51 normal51] = getM(inp1,5);
[mean61 normal61] = getM(inp1,6);


[mean02 normal02] = getM(inp2,0);
[mean12 normal12] = getM(inp2,1);
[mean22 normal22] = getM(inp2,2);
[mean32 normal32] = getM(inp2,3);
[mean42 normal42] = getM(inp2,4);
[mean52 normal52] = getM(inp2,5);
[mean62 normal62] = getM(inp2,6);

[mean03 normal03] = getM(inp3,0);
[mean13 normal13] = getM(inp3,1);
[mean23 normal23] = getM(inp3,2);
[mean33 normal33] = getM(inp3,3);
[mean43 normal43] = getM(inp3,4);
[mean53 normal53] = getM(inp3,5);
[mean63 normal63] = getM(inp3,6);

[mean04 normal04] = getM(inp4,0);
[mean14 normal14] = getM(inp4,1);
[mean24 normal24] = getM(inp4,2);
[mean34 normal34] = getM(inp4,3);
[mean44 normal44] = getM(inp4,4);
[mean54 normal54] = getM(inp4,5);
[mean64 normal64] = getM(inp4,6);

[mean05 normal05] = getM(inp5,0);
[mean15 normal15] = getM(inp5,1);
[mean25 normal25] = getM(inp5,2);
[mean35 normal35] = getM(inp5,3);
[mean45 normal45] = getM(inp5,4);
[mean55 normal55] = getM(inp5,5);
[mean65 normal65] = getM(inp5,6);

[mean06 normal06] = getM(inp6,0);
[mean16 normal16] = getM(inp6,1);
[mean26 normal26] = getM(inp6,2);
[mean36 normal36] = getM(inp6,3);
[mean46 normal46] = getM(inp6,4);
[mean56 normal56] = getM(inp6,5);
[mean66 normal66] = getM(inp6,6);



figure, hold on,
subplot(2,4,1)
hold on
plot(normal01(:,1),normal01(:,2),'Color','red')
plot([1:1:size(mean01,1)],mean01(:,1),'x','Color','red')
plot(normal01(:,1),normal01(:,3),'Color', 'blue')
plot([1:1:size(mean01,1)],mean01(:,2),'x','Color', 'blue')
plot(normal01(:,1),normal01(:,4),'Color', 'cyan')
plot([1:1:size(mean01,1)],mean01(:,3),'x','Color', 'cyan')
plot(normal01(:,1),normal01(:,5),'Color', 'green')
plot([1:1:size(mean01,1)],mean01(:,4),'x','Color', 'green')
title('patient 1 first')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

subplot(2,4,2)
hold on
plot(normal02(:,1),normal02(:,2),'Color','red')
plot([1:1:size(mean02,1)],mean02(:,1),'x','Color','red')
plot(normal02(:,1),normal02(:,3),'Color', 'blue')
plot([1:1:size(mean02,1)],mean02(:,2),'x','Color', 'blue')
plot(normal02(:,1),normal02(:,4),'Color', 'cyan')
plot([1:1:size(mean02,1)],mean02(:,3),'x','Color', 'cyan')
plot(normal02(:,1),normal02(:,5),'Color', 'green')
plot([1:1:size(mean02,1)],mean02(:,4),'x','Color', 'green')
title('patient 1 second')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

subplot(2,4,3)
hold on
plot(normal03(:,1),normal03(:,2),'Color','red')
plot([1:1:size(mean03,1)],mean03(:,1),'x','Color','red')
plot(normal03(:,1),normal03(:,3),'Color', 'blue')
plot([1:1:size(mean03,1)],mean03(:,2),'x','Color', 'blue')
plot(normal03(:,1),normal03(:,4),'Color', 'cyan')
plot([1:1:size(mean03,1)],mean03(:,3),'x','Color', 'cyan')
plot(normal03(:,1),normal03(:,5),'Color', 'green')
plot([1:1:size(mean03,1)],mean03(:,4),'x','Color', 'green')
title('patient 2 first')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

subplot(2,4,4)
hold on
plot(normal04(:,1),normal04(:,2),'Color','red')
plot([1:1:size(mean04,1)],mean04(:,1),'x','Color','red')
plot(normal04(:,1),normal04(:,3),'Color', 'blue')
plot([1:1:size(mean04,1)],mean04(:,2),'x','Color', 'blue')
plot(normal04(:,1),normal04(:,4),'Color', 'cyan')
plot([1:1:size(mean04,1)],mean04(:,3),'x','Color', 'cyan')
plot(normal04(:,1),normal04(:,5),'Color', 'green')
plot([1:1:size(mean04,1)],mean04(:,4),'x','Color', 'green')
title('patient 2 second')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

subplot(2,4,5)
hold on
plot(normal05(:,1),normal05(:,2),'Color','red')
plot([1:1:size(mean05,1)],mean05(:,1),'x','Color','red')
plot(normal05(:,1),normal05(:,3),'Color', 'blue')
plot([1:1:size(mean05,1)],mean05(:,2),'x','Color', 'blue')
plot(normal05(:,1),normal05(:,4),'Color', 'cyan')
plot([1:1:size(mean05,1)],mean05(:,3),'x','Color', 'cyan')
plot(normal05(:,1),normal05(:,5),'Color', 'green')
plot([1:1:size(mean05,1)],mean05(:,4),'x','Color', 'green')
title('patient 3 first')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

subplot(2,4,6)
hold on
plot(normal06(:,1),normal06(:,2),'Color','red')
plot([1:1:size(mean06,1)],mean06(:,1),'x','Color','red')
plot(normal06(:,1),normal06(:,3),'Color', 'blue')
plot([1:1:size(mean06,1)],mean06(:,2),'x','Color', 'blue')
plot(normal06(:,1),normal06(:,4),'Color', 'cyan')
plot([1:1:size(mean06,1)],mean06(:,3),'x','Color', 'cyan')
plot(normal06(:,1),normal06(:,5),'Color', 'green')
plot([1:1:size(mean06,1)],mean06(:,4),'x','Color', 'green')
title('patient 3 second')
h = legend('s','s mean', 'x','x mean', 'y','y mean', 'z','z mean')
set(h,'Interpreter','none')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

hold off;




figure, hold on;
subplot(2,4,1)
hold on
plot(normal11(:,1),normal11(:,2),'Color','red')
plot([1:1:size(mean11,1)],mean11(:,1),'x','Color','red')
plot(normal11(:,1),normal11(:,3),'Color', 'blue')
plot([1:1:size(mean11,1)],mean11(:,2),'x','Color', 'blue')
plot(normal11(:,1),normal11(:,4),'Color', 'cyan')
plot([1:1:size(mean11,1)],mean11(:,3),'x','Color', 'cyan')
plot(normal11(:,1),normal11(:,5),'Color', 'green')
plot([1:1:size(mean11,1)],mean11(:,4),'x','Color', 'green')
title('patient 1 first')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

subplot(2,4,2)
hold on
plot(normal12(:,1),normal12(:,2),'Color','red')
plot([1:1:size(mean12,1)],mean12(:,1),'x','Color','red')
plot(normal12(:,1),normal12(:,3),'Color', 'blue')
plot([1:1:size(mean12,1)],mean12(:,2),'x','Color', 'blue')
plot(normal12(:,1),normal12(:,4),'Color', 'cyan')
plot([1:1:size(mean12,1)],mean12(:,3),'x','Color', 'cyan')
plot(normal12(:,1),normal12(:,5),'Color', 'green')
plot([1:1:size(mean12,1)],mean12(:,4),'x','Color', 'green')
title('patient 1 second')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

subplot(2,4,3)
hold on
plot(normal13(:,1),normal13(:,2),'Color','red')
plot([1:1:size(mean13,1)],mean13(:,1),'x','Color','red')
plot(normal13(:,1),normal13(:,3),'Color', 'blue')
plot([1:1:size(mean13,1)],mean13(:,2),'x','Color', 'blue')
plot(normal13(:,1),normal13(:,4),'Color', 'cyan')
plot([1:1:size(mean13,1)],mean13(:,3),'x','Color', 'cyan')
plot(normal13(:,1),normal13(:,5),'Color', 'green')
plot([1:1:size(mean13,1)],mean13(:,4),'x','Color', 'green')
title('patient 2 first')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

subplot(2,4,4)
hold on
plot(normal14(:,1),normal14(:,2),'Color','red')
plot([1:1:size(mean14,1)],mean14(:,1),'x','Color','red')
plot(normal14(:,1),normal14(:,3),'Color', 'blue')
plot([1:1:size(mean14,1)],mean14(:,2),'x','Color', 'blue')
plot(normal14(:,1),normal14(:,4),'Color', 'cyan')
plot([1:1:size(mean14,1)],mean14(:,3),'x','Color', 'cyan')
plot(normal14(:,1),normal14(:,5),'Color', 'green')
plot([1:1:size(mean14,1)],mean14(:,4),'x','Color', 'green')
title('patient 2 second')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

subplot(2,4,5)
hold on
plot(normal15(:,1),normal15(:,2),'Color','red')
plot([1:1:size(mean15,1)],mean15(:,1),'x','Color','red')
plot(normal15(:,1),normal15(:,3),'Color', 'blue')
plot([1:1:size(mean15,1)],mean15(:,2),'x','Color', 'blue')
plot(normal15(:,1),normal15(:,4),'Color', 'cyan')
plot([1:1:size(mean15,1)],mean15(:,3),'x','Color', 'cyan')
plot(normal15(:,1),normal15(:,5),'Color', 'green')
plot([1:1:size(mean15,1)],mean15(:,4),'x','Color', 'green')
title('patient 3 first')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

subplot(2,4,6)
hold on
plot(normal16(:,1),normal16(:,2),'Color','red')
plot([1:1:size(mean16,1)],mean16(:,1),'x','Color','red')
plot(normal16(:,1),normal16(:,3),'Color', 'blue')
plot([1:1:size(mean16,1)],mean16(:,2),'x','Color', 'blue')
plot(normal16(:,1),normal16(:,4),'Color', 'cyan')
plot([1:1:size(mean16,1)],mean16(:,3),'x','Color', 'cyan')
plot(normal16(:,1),normal16(:,5),'Color', 'green')
plot([1:1:size(mean16,1)],mean16(:,4),'x','Color', 'green')
title('patient 3 second')
legend('s','s mean', 'x','x mean', 'y','y mean', 'z','z mean')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

hold off;


figure, hold on,
subplot(2,4,1)
hold on
plot(normal21(:,1),normal21(:,2),'Color','red')
plot([1:1:size(mean21,1)],mean21(:,1),'x','Color','red')
plot(normal21(:,1),normal21(:,3),'Color', 'blue')
plot([1:1:size(mean21,1)],mean21(:,2),'x','Color', 'blue')
plot(normal21(:,1),normal21(:,4),'Color', 'cyan')
plot([1:1:size(mean21,1)],mean21(:,3),'x','Color', 'cyan')
plot(normal21(:,1),normal21(:,5),'Color', 'green')
plot([1:1:size(mean21,1)],mean21(:,4),'x','Color', 'green')
title('patient 1 first')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

subplot(2,4,2)
hold on
plot(normal22(:,1),normal22(:,2),'Color','red')
plot([1:1:size(mean22,1)],mean22(:,1),'x','Color','red')
plot(normal22(:,1),normal22(:,3),'Color', 'blue')
plot([1:1:size(mean22,1)],mean22(:,2),'x','Color', 'blue')
plot(normal22(:,1),normal22(:,4),'Color', 'cyan')
plot([1:1:size(mean22,1)],mean22(:,3),'x','Color', 'cyan')
plot(normal22(:,1),normal22(:,5),'Color', 'green')
plot([1:1:size(mean22,1)],mean22(:,4),'x','Color', 'green')
title('patient 1 second')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

subplot(2,4,3)
hold on
plot(normal23(:,1),normal23(:,2),'Color','red')
plot([1:1:size(mean23,1)],mean23(:,1),'x','Color','red')
plot(normal23(:,1),normal23(:,3),'Color', 'blue')
plot([1:1:size(mean23,1)],mean23(:,2),'x','Color', 'blue')
plot(normal23(:,1),normal23(:,4),'Color', 'cyan')
plot([1:1:size(mean23,1)],mean23(:,3),'x','Color', 'cyan')
plot(normal23(:,1),normal23(:,5),'Color', 'green')
plot([1:1:size(mean23,1)],mean23(:,4),'x','Color', 'green')
title('patient 2 first')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

subplot(2,4,4)
hold on
plot(normal24(:,1),normal24(:,2),'Color','red')
plot([1:1:size(mean24,1)],mean24(:,1),'x','Color','red')
plot(normal24(:,1),normal24(:,3),'Color', 'blue')
plot([1:1:size(mean24,1)],mean24(:,2),'x','Color', 'blue')
plot(normal24(:,1),normal24(:,4),'Color', 'cyan')
plot([1:1:size(mean24,1)],mean24(:,3),'x','Color', 'cyan')
plot(normal24(:,1),normal24(:,5),'Color', 'green')
plot([1:1:size(mean24,1)],mean24(:,4),'x','Color', 'green')
title('patient 2 second')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

subplot(2,4,5)
hold on
plot(normal25(:,1),normal25(:,2),'Color','red')
plot([1:1:size(mean25,1)],mean25(:,1),'x','Color','red')
plot(normal25(:,1),normal25(:,3),'Color', 'blue')
plot([1:1:size(mean25,1)],mean25(:,2),'x','Color', 'blue')
plot(normal25(:,1),normal25(:,4),'Color', 'cyan')
plot([1:1:size(mean25,1)],mean25(:,3),'x','Color', 'cyan')
plot(normal25(:,1),normal25(:,5),'Color', 'green')
plot([1:1:size(mean25,1)],mean25(:,4),'x','Color', 'green')
title('patient 3 first')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

subplot(2,4,6)
hold on
plot(normal26(:,1),normal26(:,2),'Color','red')
plot([1:1:size(mean26,1)],mean26(:,1),'x','Color','red')
plot(normal26(:,1),normal26(:,3),'Color', 'blue')
plot([1:1:size(mean26,1)],mean26(:,2),'x','Color', 'blue')
plot(normal26(:,1),normal26(:,4),'Color', 'cyan')
plot([1:1:size(mean26,1)],mean26(:,3),'x','Color', 'cyan')
plot(normal26(:,1),normal26(:,5),'Color', 'green')
plot([1:1:size(mean26,1)],mean26(:,4),'x','Color', 'green')
title('patient 3 second')
legend('s','s mean', 'x','x mean', 'y','y mean', 'z','z mean')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

hold off;


figure, hold on,
subplot(2,4,1)
hold on
plot(normal31(:,1),normal31(:,2),'Color','red')
plot([1:1:size(mean31,1)],mean31(:,1),'x','Color','red')
plot(normal31(:,1),normal31(:,3),'Color', 'blue')
plot([1:1:size(mean31,1)],mean31(:,2),'x','Color', 'blue')
plot(normal31(:,1),normal31(:,4),'Color', 'cyan')
plot([1:1:size(mean31,1)],mean31(:,3),'x','Color', 'cyan')
plot(normal31(:,1),normal31(:,5),'Color', 'green')
plot([1:1:size(mean31,1)],mean31(:,4),'x','Color', 'green')
title('patient 1 first')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

subplot(2,4,2)
hold on
plot(normal32(:,1),normal32(:,2),'Color','red')
plot([1:1:size(mean32,1)],mean32(:,1),'x','Color','red')
plot(normal32(:,1),normal32(:,3),'Color', 'blue')
plot([1:1:size(mean32,1)],mean32(:,2),'x','Color', 'blue')
plot(normal32(:,1),normal32(:,4),'Color', 'cyan')
plot([1:1:size(mean32,1)],mean32(:,3),'x','Color', 'cyan')
plot(normal32(:,1),normal32(:,5),'Color', 'green')
plot([1:1:size(mean32,1)],mean32(:,4),'x','Color', 'green')
title('patient 1 second')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

subplot(2,4,3)
hold on
plot(normal33(:,1),normal33(:,2),'Color','red')
plot([1:1:size(mean33,1)],mean33(:,1),'x','Color','red')
plot(normal33(:,1),normal33(:,3),'Color', 'blue')
plot([1:1:size(mean33,1)],mean33(:,2),'x','Color', 'blue')
plot(normal33(:,1),normal33(:,4),'Color', 'cyan')
plot([1:1:size(mean33,1)],mean33(:,3),'x','Color', 'cyan')
plot(normal33(:,1),normal33(:,5),'Color', 'green')
plot([1:1:size(mean33,1)],mean33(:,4),'x','Color', 'green')
title('patient 2 first')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

subplot(2,4,4)
hold on
plot(normal34(:,1),normal34(:,2),'Color','red')
plot([1:1:size(mean34,1)],mean34(:,1),'x','Color','red')
plot(normal34(:,1),normal34(:,3),'Color', 'blue')
plot([1:1:size(mean34,1)],mean34(:,2),'x','Color', 'blue')
plot(normal34(:,1),normal34(:,4),'Color', 'cyan')
plot([1:1:size(mean34,1)],mean34(:,3),'x','Color', 'cyan')
plot(normal34(:,1),normal34(:,5),'Color', 'green')
plot([1:1:size(mean34,1)],mean34(:,4),'x','Color', 'green')
title('patient 2 second')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

subplot(2,4,5)
hold on
plot(normal35(:,1),normal35(:,2),'Color','red')
plot([1:1:size(mean35,1)],mean35(:,1),'x','Color','red')
plot(normal35(:,1),normal35(:,3),'Color', 'blue')
plot([1:1:size(mean35,1)],mean35(:,2),'x','Color', 'blue')
plot(normal35(:,1),normal35(:,4),'Color', 'cyan')
plot([1:1:size(mean35,1)],mean35(:,3),'x','Color', 'cyan')
plot(normal35(:,1),normal35(:,5),'Color', 'green')
plot([1:1:size(mean35,1)],mean35(:,4),'x','Color', 'green')
title('patient 3 first')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

subplot(2,4,6)
hold on
plot(normal36(:,1),normal36(:,2),'Color','red')
plot([1:1:size(mean36,1)],mean36(:,1),'x','Color','red')
plot(normal36(:,1),normal36(:,3),'Color', 'blue')
plot([1:1:size(mean36,1)],mean36(:,2),'x','Color', 'blue')
plot(normal36(:,1),normal36(:,4),'Color', 'cyan')
plot([1:1:size(mean36,1)],mean36(:,3),'x','Color', 'cyan')
plot(normal36(:,1),normal36(:,5),'Color', 'green')
plot([1:1:size(mean36,1)],mean36(:,4),'x','Color', 'green')
title('patient 3 second')
legend('s','s mean', 'x','x mean', 'y','y mean', 'z','z mean')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

hold off;


figure, hold on,
subplot(2,4,1)
hold on
plot(normal41(:,1),normal41(:,2),'Color','red')
plot([1:1:size(mean41,1)],mean41(:,1),'x','Color','red')
plot(normal41(:,1),normal41(:,3),'Color', 'blue')
plot([1:1:size(mean41,1)],mean41(:,2),'x','Color', 'blue')
plot(normal41(:,1),normal41(:,4),'Color', 'cyan')
plot([1:1:size(mean41,1)],mean41(:,3),'x','Color', 'cyan')
plot(normal41(:,1),normal41(:,5),'Color', 'green')
plot([1:1:size(mean41,1)],mean41(:,4),'x','Color', 'green')
title('patient 1 first')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

subplot(2,4,2)
hold on
plot(normal42(:,1),normal42(:,2),'Color','red')
plot([1:1:size(mean42,1)],mean42(:,1),'x','Color','red')
plot(normal42(:,1),normal42(:,3),'Color', 'blue')
plot([1:1:size(mean42,1)],mean42(:,2),'x','Color', 'blue')
plot(normal42(:,1),normal42(:,4),'Color', 'cyan')
plot([1:1:size(mean42,1)],mean42(:,3),'x','Color', 'cyan')
plot(normal42(:,1),normal42(:,5),'Color', 'green')
plot([1:1:size(mean42,1)],mean42(:,4),'x','Color', 'green')
title('patient 1 second')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

subplot(2,4,3)
hold on
plot(normal43(:,1),normal43(:,2),'Color','red')
plot([1:1:size(mean43,1)],mean43(:,1),'x','Color','red')
plot(normal43(:,1),normal43(:,3),'Color', 'blue')
plot([1:1:size(mean43,1)],mean43(:,2),'x','Color', 'blue')
plot(normal43(:,1),normal43(:,4),'Color', 'cyan')
plot([1:1:size(mean43,1)],mean43(:,3),'x','Color', 'cyan')
plot(normal43(:,1),normal43(:,5),'Color', 'green')
plot([1:1:size(mean43,1)],mean43(:,4),'x','Color', 'green')
title('patient 2 first')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

subplot(2,4,4)
hold on
plot(normal44(:,1),normal44(:,2),'Color','red')
plot([1:1:size(mean44,1)],mean44(:,1),'x','Color','red')
plot(normal44(:,1),normal44(:,3),'Color', 'blue')
plot([1:1:size(mean44,1)],mean44(:,2),'x','Color', 'blue')
plot(normal44(:,1),normal44(:,4),'Color', 'cyan')
plot([1:1:size(mean44,1)],mean44(:,3),'x','Color', 'cyan')
plot(normal44(:,1),normal44(:,5),'Color', 'green')
plot([1:1:size(mean44,1)],mean44(:,4),'x','Color', 'green')
title('patient 2 second')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

subplot(2,4,5)
hold on
plot(normal45(:,1),normal45(:,2),'Color','red')
plot([1:1:size(mean45,1)],mean45(:,1),'x','Color','red')
plot(normal45(:,1),normal45(:,3),'Color', 'blue')
plot([1:1:size(mean45,1)],mean45(:,2),'x','Color', 'blue')
plot(normal45(:,1),normal45(:,4),'Color', 'cyan')
plot([1:1:size(mean45,1)],mean45(:,3),'x','Color', 'cyan')
plot(normal45(:,1),normal45(:,5),'Color', 'green')
plot([1:1:size(mean45,1)],mean45(:,4),'x','Color', 'green')
title('patient 3 first')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

subplot(2,4,6)
hold on
plot(normal46(:,1),normal46(:,2),'Color','red')
plot([1:1:size(mean46,1)],mean46(:,1),'x','Color','red')
plot(normal46(:,1),normal46(:,3),'Color', 'blue')
plot([1:1:size(mean46,1)],mean46(:,2),'x','Color', 'blue')
plot(normal46(:,1),normal46(:,4),'Color', 'cyan')
plot([1:1:size(mean46,1)],mean46(:,3),'x','Color', 'cyan')
plot(normal46(:,1),normal46(:,5),'Color', 'green')
plot([1:1:size(mean46,1)],mean46(:,4),'x','Color', 'green')
title('patient 3 second')
legend('s','s mean', 'x','x mean', 'y','y mean', 'z','z mean')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

hold off;



figure, hold on,
subplot(2,4,1)
hold on
plot(normal51(:,1),normal51(:,2),'Color','red')
plot([1:1:size(mean51,1)],mean51(:,1),'x','Color','red')
plot(normal51(:,1),normal51(:,3),'Color', 'blue')
plot([1:1:size(mean51,1)],mean51(:,2),'x','Color', 'blue')
plot(normal51(:,1),normal51(:,4),'Color', 'cyan')
plot([1:1:size(mean51,1)],mean51(:,3),'x','Color', 'cyan')
plot(normal51(:,1),normal51(:,5),'Color', 'green')
plot([1:1:size(mean51,1)],mean51(:,4),'x','Color', 'green')
title('patient 1 first')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

subplot(2,4,2)
hold on
plot(normal52(:,1),normal52(:,2),'Color','red')
plot([1:1:size(mean52,1)],mean52(:,1),'x','Color','red')
plot(normal52(:,1),normal52(:,3),'Color', 'blue')
plot([1:1:size(mean52,1)],mean52(:,2),'x','Color', 'blue')
plot(normal52(:,1),normal52(:,4),'Color', 'cyan')
plot([1:1:size(mean52,1)],mean52(:,3),'x','Color', 'cyan')
plot(normal52(:,1),normal52(:,5),'Color', 'green')
plot([1:1:size(mean52,1)],mean52(:,4),'x','Color', 'green')
title('patient 1 second')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

subplot(2,4,3)
hold on
plot(normal53(:,1),normal53(:,2),'Color','red')
plot([1:1:size(mean53,1)],mean53(:,1),'x','Color','red')
plot(normal53(:,1),normal53(:,3),'Color', 'blue')
plot([1:1:size(mean53,1)],mean53(:,2),'x','Color', 'blue')
plot(normal53(:,1),normal53(:,4),'Color', 'cyan')
plot([1:1:size(mean53,1)],mean53(:,3),'x','Color', 'cyan')
plot(normal53(:,1),normal53(:,5),'Color', 'green')
plot([1:1:size(mean53,1)],mean53(:,4),'x','Color', 'green')
title('patient 2 first')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

subplot(2,4,4)
hold on
plot(normal54(:,1),normal54(:,2),'Color','red')
plot([1:1:size(mean54,1)],mean54(:,1),'x','Color','red')
plot(normal54(:,1),normal54(:,3),'Color', 'blue')
plot([1:1:size(mean54,1)],mean54(:,2),'x','Color', 'blue')
plot(normal54(:,1),normal54(:,4),'Color', 'cyan')
plot([1:1:size(mean54,1)],mean54(:,3),'x','Color', 'cyan')
plot(normal54(:,1),normal54(:,5),'Color', 'green')
plot([1:1:size(mean54,1)],mean54(:,4),'x','Color', 'green')
title('patient 2 second')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

subplot(2,4,5)
hold on
plot(normal55(:,1),normal55(:,2),'Color','red')
plot([1:1:size(mean55,1)],mean55(:,1),'x','Color','red')
plot(normal55(:,1),normal55(:,3),'Color', 'blue')
plot([1:1:size(mean55,1)],mean55(:,2),'x','Color', 'blue')
plot(normal55(:,1),normal55(:,4),'Color', 'cyan')
plot([1:1:size(mean55,1)],mean55(:,3),'x','Color', 'cyan')
plot(normal55(:,1),normal55(:,5),'Color', 'green')
plot([1:1:size(mean55,1)],mean55(:,4),'x','Color', 'green')
title('patient 3 first')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

subplot(2,4,6)
hold on
plot(normal56(:,1),normal56(:,2),'Color','red')
plot([1:1:size(mean56,1)],mean56(:,1),'x','Color','red')
plot(normal56(:,1),normal56(:,3),'Color', 'blue')
plot([1:1:size(mean56,1)],mean56(:,2),'x','Color', 'blue')
plot(normal56(:,1),normal56(:,4),'Color', 'cyan')
plot([1:1:size(mean56,1)],mean56(:,3),'x','Color', 'cyan')
plot(normal56(:,1),normal56(:,5),'Color', 'green')
plot([1:1:size(mean56,1)],mean56(:,4),'x','Color', 'green')
title('patient 3 second')
legend('s','s mean', 'x','x mean', 'y','y mean', 'z','z mean')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

hold off;

figure, hold on,
subplot(2,4,1)
hold on
plot(normal61(:,1),normal61(:,2),'Color','red')
plot([1:1:size(mean61,1)],mean61(:,1),'x','Color','red')
plot(normal61(:,1),normal61(:,3),'Color', 'blue')
plot([1:1:size(mean61,1)],mean61(:,2),'x','Color', 'blue')
plot(normal61(:,1),normal61(:,4),'Color', 'cyan')
plot([1:1:size(mean61,1)],mean61(:,3),'x','Color', 'cyan')
plot(normal61(:,1),normal61(:,5),'Color', 'green')
plot([1:1:size(mean61,1)],mean61(:,4),'x','Color', 'green')
title('patient 1 first')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

subplot(2,4,2)
hold on
plot(normal62(:,1),normal62(:,2),'Color','red')
plot([1:1:size(mean62,1)],mean62(:,1),'x','Color','red')
plot(normal62(:,1),normal62(:,3),'Color', 'blue')
plot([1:1:size(mean62,1)],mean62(:,2),'x','Color', 'blue')
plot(normal62(:,1),normal62(:,4),'Color', 'cyan')
plot([1:1:size(mean62,1)],mean62(:,3),'x','Color', 'cyan')
plot(normal62(:,1),normal62(:,5),'Color', 'green')
plot([1:1:size(mean62,1)],mean62(:,4),'x','Color', 'green')
title('patient 1 second')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

subplot(2,4,3)
hold on
plot(normal63(:,1),normal63(:,2),'Color','red')
plot([1:1:size(mean63,1)],mean63(:,1),'x','Color','red')
plot(normal63(:,1),normal63(:,3),'Color', 'blue')
plot([1:1:size(mean63,1)],mean63(:,2),'x','Color', 'blue')
plot(normal63(:,1),normal63(:,4),'Color', 'cyan')
plot([1:1:size(mean63,1)],mean63(:,3),'x','Color', 'cyan')
plot(normal63(:,1),normal63(:,5),'Color', 'green')
plot([1:1:size(mean63,1)],mean63(:,4),'x','Color', 'green')
title('patient 2 first')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

subplot(2,4,4)
hold on
plot(normal64(:,1),normal64(:,2),'Color','red')
plot([1:1:size(mean64,1)],mean64(:,1),'x','Color','red')
plot(normal64(:,1),normal64(:,3),'Color', 'blue')
plot([1:1:size(mean64,1)],mean64(:,2),'x','Color', 'blue')
plot(normal64(:,1),normal64(:,4),'Color', 'cyan')
plot([1:1:size(mean64,1)],mean64(:,3),'x','Color', 'cyan')
plot(normal64(:,1),normal64(:,5),'Color', 'green')
plot([1:1:size(mean64,1)],mean64(:,4),'x','Color', 'green')
title('patient 2 second')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

subplot(2,4,5)
hold on
plot(normal65(:,1),normal65(:,2),'Color','red')
plot([1:1:size(mean65,1)],mean65(:,1),'x','Color','red')
plot(normal65(:,1),normal65(:,3),'Color', 'blue')
plot([1:1:size(mean65,1)],mean65(:,2),'x','Color', 'blue')
plot(normal65(:,1),normal65(:,4),'Color', 'cyan')
plot([1:1:size(mean65,1)],mean65(:,3),'x','Color', 'cyan')
plot(normal65(:,1),normal65(:,5),'Color', 'green')
plot([1:1:size(mean65,1)],mean65(:,4),'x','Color', 'green')
title('patient 3 first')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

subplot(2,4,6)
hold on
plot(normal66(:,1),normal66(:,2),'Color','red')
plot([1:1:size(mean66,1)],mean66(:,1),'x','Color','red')
plot(normal66(:,1),normal66(:,3),'Color', 'blue')
plot([1:1:size(mean66,1)],mean66(:,2),'x','Color', 'blue')
plot(normal66(:,1),normal66(:,4),'Color', 'cyan')
plot([1:1:size(mean66,1)],mean66(:,3),'x','Color', 'cyan')
plot(normal66(:,1),normal66(:,5),'Color', 'green')
plot([1:1:size(mean66,1)],mean66(:,4),'x','Color', 'green')
title('patient 3 second')
legend('s','s mean', 'x','x mean', 'y','y mean', 'z','z mean')
ylabel('Quaternion values')
xlabel('Time (s)')
ylim([-1 1])
hold off;

hold off;
