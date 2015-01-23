% question 6
figure
hold on
x = 0:70;
y1 = x.*0;
tic
for r=0.05:0.01:1.2
    for k=5:0.5:30
        y2 = r.*(1-(x./k)) - (x./(1+(x.*x)));
        P = InterX([x;y1],[x;y2]);
        R = r*ones(length(P(1,:)),1);
        K = k*ones(length(P(1,:)),1);
        plot3(R,K,P(1,:),'rx');
    end
end
xlim([0.1 1.2])
title('Surface d''equation f(x,k,r) = 0');
xlabel('r');
ylabel('k');
zlabel('x');
toc

% zoom on critical zone of the previous plot
figure
hold on
x = 0:50;
y1 = x.*0;
tic
for r=0.4:0.01:0.7
    for k=4:0.1:10
        y2 = r.*(1-(x./k)) - (x./(1+x.*x));
        P = InterX([x;y1],[x;y2]);
        R = r*ones(length(P(1,:)),1);
        K = k*ones(length(P(1,:)),1);
        plot3(R,K,P(1,:),'rx');
    end
end
xlim([0.4 0.7])
title('Surface d''equation f(x,k,r) = 0');
xlabel('r');
ylabel('k');
zlabel('x');
toc