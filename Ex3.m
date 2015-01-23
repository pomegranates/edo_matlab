figure %draw on figure 1
tic
[T,Y] = ode45(@(t,y) Cauchy3(t,y),[0 25],[1]);
toc
hold on
plot(T,Y,'-x')
fplot(@(x) exp(-x^2/2),[0,25], '-ro')

title('Chronique');
    
xlabel('t');
ylabel('x');

legend('Solveur ode45', 'Solution exacte', 'Location', 'Best')

figure %draw on figure 2
tic
[t,y] = Euler('Cauchy3',[0,10000],1,0.5);

plot(t,y,'-x')

title('Simulation avec la méthode Euler explicite');
    
xlabel('t');
ylabel('x');

figure %draw on figure 3
[t,y] = Midpoint('Cauchy3',[0,25],1,0.5);

plot(t,y,'-x')

title('Simulation avec la méthode des points milieux');
    
xlabel('t');
ylabel('x');

figure %draw on figure 4
[t,y] = RK4('Cauchy3',[0,25],1,0.5);

plot(t,y,'-x')

title('Simulation avec la méthode RK4');
    
xlabel('t');
ylabel('x');
