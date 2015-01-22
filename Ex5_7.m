% question 7
% example of headcounts of grasshoppers
% for k=10 and r=0.4
figure
tic
hold on
r = 0.4;
k = 10;
x = 0:100;
y1 = x.*0;
y2 = r*x.*(1-(x./k)) - (x.*x./(1+x.*x));
P = InterX([x;y1],[x;y2]);
plot([0 70], [P(1,1) P(1,1)],'Color',[0.8 0 0],'LineWidth',2);
plot([0 70], [P(1,2) P(1,2)],'Color',[0 0.8 0],'LineWidth',2);
plot([0 70], [P(1,3) P(1,3)],'Color',[0.8 0 0],'LineWidth',2);
for i=0:0.1:10
    [T,Y] = ode45(@(t,y) invasion(t,y,r,k),[0 70],i);
    plot(T,Y)
end
plot([0 70], [P(1,1) P(1,1)],'Color',[0.8 0 0],'LineWidth',2);
plot([0 70], [P(1,2) P(1,2)],'Color',[0 0.8 0],'LineWidth',2);
plot([0 70], [P(1,3) P(1,3)],'Color',[0.8 0 0],'LineWidth',2);
title('Chroniques pour r = 0.4 et k = 10');
xlabel('Temps');
ylabel('Effectif');
legend('Equilibre stable','Equilibre instable','Location','Best');
toc

% for k=50 and r=0.05
figure
tic
hold on
r = 0.05;
k = 50;
for i=0:1:50
    [T,Y] = ode45(@(t,y) invasion(t,y,r,k),[0 100],i);
    plot(T,Y)
end
toc
title('Chroniques pour r = 0.05 et k = 50');
xlabel('Temps');
ylabel('Effectif');


%for k=50 and r=0.1
figure
tic
hold on
r = 0.1;
k = 50;
x = 0:100;
y1 = x.*0;
y2 = r*x.*(1-(x./k)) - (x.*x./(1+x.*x));
P = InterX([x;y1],[x;y2]);
plot([0 100], [P(1,1) P(1,1)],'Color',[0.8 0 0],'LineWidth',2);
plot([0 100], [P(1,2) P(1,2)],'Color',[0 0.8 0],'LineWidth',2);
plot([0 100], [P(1,3) P(1,3)],'Color',[0.8 0 0],'LineWidth',2);
for i=0:1:50
    [T,Y] = ode45(@(t,y) invasion(t,y,r,k),[0 100],i);
    plot(T,Y)
end
toc
plot([0 100], [P(1,1) P(1,1)],'Color',[0.8 0 0],'LineWidth',2);
plot([0 100], [P(1,2) P(1,2)],'Color',[0 0.8 0],'LineWidth',2);
plot([0 100], [P(1,3) P(1,3)],'Color',[0.8 0 0],'LineWidth',2);
title('Chroniques pour r = 0.1 et k = 50');
xlabel('Temps');
ylabel('Effectif');
legend('Equilibre stable','Equilibre instable','Location','Best');
