figure %draw on figure 1
tic
[T,Y] = ode45(@(t,y) van_der_pol(t,y,1),[0 20],[1 1]); %question 2.a
toc
plot(T,Y(:,1),'-x')
figure %draw on figure 2
tic
[T,Y] = ode23s(@(t,y) van_der_pol(t,y,1000),[0 6000],[1 1]); %question 2.b
toc
plot(T,Y(:,1),'-o')
figure %draw on figure 3
hold on
tic
[T,Y] = ode45(@(t,y) van_der_pol(t,y,1000),[0 30],[1 1]);
toc
plot(T,Y(:,1),'-x')
tic
[T,Y] = ode23s(@(t,y) van_der_pol(t,y,1000),[0 30],[1 1]);
toc
plot(T,Y(:,1),'-o')
figure %draw on figure 4
hold on
tic
for i=1:100,
    [T,Y] = ode15s(@(t,y) van_der_pol(t,y,i),[0 120],[1 1]);
    I = i*ones(length(T),1);
    plot3(T,I,Y(:,1),'-x')
end
toc