% Relative error
for i = 1:5
   abs((Y1(i) - Y2(i))/Y2(i))
end

% RK4 test
% RK4
[T,Y1] = RK4('Cauchy2',[0,885],2,1);

% Exact solution
[T,Y2] = Cauchy2_exact([0,885],1);

% Relative error
for i = 1:886
   abs((Y1(i) - Y2(i))/Y2(i))
end