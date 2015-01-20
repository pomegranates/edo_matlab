% Smaller h test
figure
hold on

% RK4
[T,Y1] = Euler('Cauchy2',[0,10],2,0.1);
plot(T,Y1)

% Exact solution
[T,Y2] = Cauchy2_exact([0,10],0.1);
plot(T,Y2,'r-')

% Relative error
for i = 1:11
   abs((Y1(i) - Y2(i))/Y2(i))
end