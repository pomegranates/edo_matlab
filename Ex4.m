%question 2
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
plot(T,Y(:,2),'-ro')
toc

figure %draw on figure 2
tic
hold on
for i=1:30,
    for j=1:30
    [T,Y] = ode45(@(t,y) sheeps_rabbits(t,y),[0 10],[3*i/30 3*j/30]);
    plot(Y(:,1),Y(:,2),'Color',[0 0.8 0])
    end
end
[T,Y] = ode45(@(t,y) sheeps_rabbits(t,y),[0 10],[1 1]);
plot(Y(:,1),Y(:,2),'-xr','Markersize',10)
plot([0 3], [1.5 0],'-r','LineWidth',2);
plot([0 2], [2 0],'-r','LineWidth',2);
toc
[L,M]=meshgrid(0:0.1:3,0:0.1:3);
x1=L.*(3-L)-2.*L.*M;
x2=M.*(2-M)-L.*M;
norm=sqrt(x1.^2+x2.^2);
x1norm=x1./norm;
x2norm=x2./norm;
h=quiver(L,M,x1norm,x2norm,'Color',[0.5 0.5 0.5]);
xlim([0 3]);
ylim([0 3]);
