r=2;
K=100;
for i=1:100,
    [T,Y] = ode45(@(t,y) grasshopper_grow(t,y,r,K),[0 120],[1 1]);
end