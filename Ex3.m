figure %draw on figure 1
tic
[T,Y] = ode45(@(t,y) Cauchy3(t,y),[0 20],[1]);
toc
hold on
plot(T,Y,'-x')
fplot(@(x) exp(-x^2/2),[0,20], '-ro')
figure
tic
[t,y] = Euler('Cauchy3',[0,25],1,0.5);
plot(t,y,'-x')
figure
[t,y] = Midpoint('Cauchy3',[0,25],1,0.5);
plot(t,y,'-x')
toc
figure
[t,y] = RK4('Cauchy3',[0,25],1,0.5);
plot(t,y,'-x')
toc