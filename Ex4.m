%question 2
figure %draw on figure 1
tic
hold on
for i=1:5,
    for j=1:5
    [T,Y] = ode45(@(t,y) sheeps_rabbits(t,y),[0 20],[3*i/5 3*j/5]);
    plot(T,Y(:,1),'-x','Markersize',7)
    plot(T,Y(:,2),'-or','Markersize',3)
    end
end
[T,Y] = ode45(@(t,y) sheeps_rabbits(t,y),[0 20],[1 1]);
plot(T,Y(:,1),'-x','Markersize',7)
plot(T,Y(:,2),'-or','Markersize',3)
toc

figure %draw on figure 2
tic
hold on
for i=1:30,
    for j=1:30
    [T,Y] = ode45(@(t,y) sheeps_rabbits(t,y),[0 10],[3*i/30 3*j/30]);
    plot(Y(:,1),Y(:,2))
    end
end
[T,Y] = ode45(@(t,y) sheeps_rabbits(t,y),[0 10],[1 1]);
plot(Y(:,1),Y(:,2),'-xr','Markersize',10)
plot([0 3], [1.5 0],'-r','LineWidth',2);
plot([0 2], [2 0],'-r','LineWidth',2);
toc
