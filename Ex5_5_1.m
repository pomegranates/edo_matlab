% question 5
R=2;
K=100;
A=5;
B=5;
r=A*R/B;
k=K/A;
% influence of r
figure  % figure 1
hold on
x = 0:25;
y1 = x./(1+x.*x);
plot(x,y1,'Color',[0 0.6 0])
for r=0.1:0.1:1   
    y2 = r.*(1-(x./k));
    P = InterX([x;y1],[x;y2]);
    plot(x,y2,P(1,:),P(2,:),'ro')
end
ylim([-0.3 1]);
title('Influence de r sur le nombre de points d''intersection');
xlabel('x');
ylabel('y');
legend(' y = x / (1+x^2)',' y = r (1-x/k)','Point d''intersection','Location','Best');
% influence of k
figure  % figure 2
hold on
x = 0:35;
y1 = x./(1+x.*x);
plot(x,y1,'Color',[0 0.6 0])
for k=5:5:30
    y2 = r.*(1-(x./k));
    P = InterX([x;y1],[x;y2]);
    plot(x,y2,P(1,:),P(2,:),'ro')
end
ylim([-1 1.5]);
title('Influence de k sur le nombre de points d''intersection');
xlabel('x');
ylabel('y');
legend(' y = x / (1+x^2)',' y = r (1-x/k)','Point d''intersection','Location','Best');