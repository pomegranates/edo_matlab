% Time steps
h(1) = 1/10;
h(2) = 1/50;
h(3) = 1/250;

for i = 1:3
    figure %figure i
    hold on
    
    % Exact solution
    [T,Y1] = Cauchy1_exact([0,4],h(i));
    plot(T,Y1,'r-x')

    % Explicit Euler method
    [T,Y2] = Euler('Cauchy1',[0,4],2,h(i))
    plot(T,Y2)

    % Implicit Euler method
    [T,Y3] = Cauchy1_implicit([0,4],h(i));
    plot(T,Y3,'g-')
end