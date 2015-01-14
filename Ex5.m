R=2;
K=100;


% question 1
figure  % figure 1
hold on
tic
for i=0:12,
    [T,Y] = ode45(@(t,y) grasshopper_grow(t,y,R,K),[0 5],[i*10]);
    plot(T,Y)
end
toc

% question 2
figure  % figure 2
hold on
for B=1:5
    for A=1:5
        fplot(@(x) (5*B*x^2)/(5*A^2+x^2),[0,50]);
    end
end

% question 5
% include alpha and lambda if switching back to effective population
r=A*R/B;
k=K/A;
figure  % figure 3
hold on
x = 0:25;
y1 = (x.*x)./(1+x.*x);
plot(x,y1,'-g')
k=20;
for r=0.1:0.1:1   
    y2 = r.*x.*(1-(x./k));
    P = InterX([x;y1],[x;y2]);
    plot(x,y2,P(1,:),P(2,:),'ro')
end
ylim([-3 5]);
figure  % figure 4
hold on
x = 0:30;
y1 = (x.*x)./(1+x.*x);
plot(x,y1,'-g')
r=5;
for k=5:5:25
    y2 = r.*x.*(1-(x./k));
    P = InterX([x;y1],[x;y2]);
    plot(x,y2,P(1,:),P(2,:),'ro')
end
ylim([-10 32])
%TODO : get critical values of r and k !


% question 6
%TODO : plot surface f(x,k,r)=0 with x,k and r coordinates ?
figure
hold on
x = 0:100;
y1 = x.*0;
tic
for r=1:0.1:5
    for k=1:0.1:4
        y2 = r.*x.*(1-(x./k)) - ((x.*x)./(1+x.*x));
        P = InterX([x;y1],[x;y2]);
        P(:,1) = [];          % we don't care about the intersection (0;0)
        R = r*ones(length(P(1,:)),1);
        K = k*ones(length(P(1,:)),1);
        plot3(P(1,:),R,K,'rx');
    end
end
xlabel('x');
ylabel('r');
zlabel('k');
toc

