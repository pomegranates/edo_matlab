r=2;
K=100;
% question 1
figure  % figure 1
hold on
tic
for i=0:12,
    [T,Y] = ode45(@(t,y) grasshopper_grow(t,y,r,K),[0 10],[i*10]);
    plot(T,Y)
end
toc
% question 2
figure  % figure 2
hold on
for b=1:5
    for a=1:5
        fplot(@(x) (5*b*x^2)/(5*a^2+x^2),[0,50]);
    end
end
% question 5
% TODO : plot C and P to get intersection points, with different r and k
% values