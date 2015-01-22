% question 1
figure  % figure 1
hold on
tic
R=2;
K=100;
for i=0:12,
    [T,Y] = ode45(@(t,y) grasshopper_grow(t,y,R,K),[0 5],i*10);
    plot(T,Y,'Color',[0 0.6 0])
end
title('Evolution du terme de croissance');
xlabel('Temps');
ylabel('Effectif');
toc