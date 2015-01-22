%question 2
% headcounts
figure %draw on figure 1
tic
hold on
for i=1:1:3,
    for j=1:3
    [T,Y] = ode45(@(t,y) sheeps_rabbits(t,y),[0 20],[i-0.5 j-0.5]);
    plot(T,Y(:,1),'Color',[i/4 j/4 0],'Marker','x')
    plot(T,Y(:,2),'Color',[i/4 j/4 0])
    end
end
[T,Y] = ode45(@(t,y) sheeps_rabbits(t,y),[0 20],[1 1]);
plot(T,Y(:,1),'-rx')
plot(T,Y(:,2),'Color',[0.8 0 0])
title('Chroniques pour différentes conditions initiales');
xlabel('Temps');
ylabel('Effectifs');
legend('Lapins','Moutons','Location','Best');
toc

% phase portrait
figure %draw on figure 2
tic
hold on
plot([0 3], [1.5 0],'-r','LineWidth',2);
plot([0 2], [2 0],'-r','LineWidth',2);
plot(Y(:,1),Y(:,2),'-xr','Markersize',10)
for i=1:30,
    for j=1:30
    [T,Y] = ode45(@(t,y) sheeps_rabbits(t,y),[0 10],[3*i/30 3*j/30]);
    plot(Y(:,1),Y(:,2),'Color',[0 0.8 0])
    end
end
[T,Y] = ode45(@(t,y) sheeps_rabbits(t,y),[0 10],[1 1]);
[L,M] = meshgrid(0:0.1:3,0:0.1:3);
y1 = L.*(3-L)-2.*L.*M;
y2 = M.*(2-M)-L.*M;
norm = sqrt(y1.^2+y2.^2);
norm_y1 = y1./norm;
norm_y2 = y2./norm;
quiver(L,M,norm_y1,norm_y2,'Color',[0.5 0.5 0.5]);
xlim([0 3]);
ylim([0 3]);
plot([0 3], [1.5 0],'-r','LineWidth',2);
plot([0 2], [2 0],'-r','LineWidth',2);
plot(Y(:,1),Y(:,2),'-xr','Markersize',10)
title('Portrait de phase');
xlabel('Lapins');
ylabel('Moutons');
legend('Isoclines','Location','NorthEast');
toc
