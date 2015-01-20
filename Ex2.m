% question 3
figure
hold on

% RK4
[T,Y1] = Euler('Cauchy2',[0,4],2,1);
plot(T,Y1)

% Exact solution
[T,Y2] = Cauchy2_exact([0,4],1);
plot(T,Y2,'r-')

Y2
Y1
% Relative error
for i = 1:5
   abs((Y1(i) - Y2(i))/Y2(i))
end