% R=2;
% K=100;
% 
% % question 1
% figure  % figure 1
% hold on
% tic
% for i=0:12,
%     [T,Y] = ode45(@(t,y) grasshopper_grow(t,y,R,K),[0 10],[i*10]);
%     plot(T,Y)
% end
% toc
% 
% % question 2
% figure  % figure 2
% hold on
% for B=1:5
%     for A=1:5
%         fplot(@(x) (5*B*x^2)/(5*A^2+x^2),[0,50]);
%     end
% end
% 
% % question 5
% % include alpha and lambda if switching back to effective population
% r=A*R/B;
% k=K/A;
% figure  % figure 3
% hold on
% x = 0:25;
% y1 = x./(1+x.*x);
% plot(x,y1,'-g')
% for r=0.1:0.1:1   
%     y2 = r.*(1-(x./k));
%     P = InterX([x;y1],[x;y2]);
%     plot(x,y2,P(1,:),P(2,:),'ro')
% end
% ylim([-0.5 1]);
% figure  % figure 4
% hold on
% x = 0:35;
% y1 = x./(1+x.*x);
% plot(x,y1,'-g')
% for k=5:5:30
%     y2 = r.*(1-(x./k));
%     P = InterX([x;y1],[x;y2]);
%     plot(x,y2,P(1,:),P(2,:),'ro')
% end
% ylim([-1 1.5]);
% 
% 
%looking for critical values ; starting with r
figure
hold on
x = 0:100;
y1 = x./(1+x.*x);
tic
for k=1:0.1:30 
    c = 0;
    start = 0;
    finish = 5;
    r_crit = start;
    while (c<5) 
        step = 1/20*(finish-start);
        for r=start:step:finish
            y2 = r.*(1-(x./k));
            P = InterX([x;y1],[x;y2]);
            if (length(P)>2)
                r_crit = r;
            end
        end
        start = r_crit - step;
        finish = r_crit + step;
        c = c+1;
    end
    plot(k,r_crit,'rx','Markersize',5);
end
toc

% looking for critical values ; now with k
% figure
% hold on
% tic
% for r=0.1:0.1:2 
%     c = 0;
%     start = 0;
%     finish = 200;
%     k_crit = start;
%     while (c<10) 
%         step = 1/20*(finish-start);
%         for k=start:step:finish
%             y2 = r.*(1-(x./k));
%             P = InterX([x;y1],[x;y2]);
%             if (length(P)>1)
%                 k_crit = k;
%             end
%         end
%         start = k_crit - step;
%         finish = k_crit + step;
%         c = c+1;
%     end
%     plot(r,k_crit,'rx','Markersize',5);
% end
% toc

% question 6
figure
hold on
x = 0:70;
y1 = x.*0;
tic
for r=0.05:0.01:1.2
    for k=5:0.5:30
        y2 = r.*(1-(x./k)) - (x./(1+x.*x));
        P = InterX([x;y1],[x;y2]);
        R = r*ones(length(P(1,:)),1);
        K = k*ones(length(P(1,:)),1);
        plot3(R,K,P(1,:),'rx');
    end
end
xlabel('r');
ylabel('k');
zlabel('x');
toc

% zoom on critical zone of the previous plot
% 3 equilibriums for 0.2<r<0.6 (approximately) if k>7
figure
hold on
x = 0:50;
y1 = x.*0;
tic
for r=0.3:0.01:0.65
    for k=5:0.1:10
        y2 = r.*(1-(x./k)) - (x./(1+x.*x));
        P = InterX([x;y1],[x;y2]);
        R = r*ones(length(P(1,:)),1);
        K = k*ones(length(P(1,:)),1);
        plot3(R,K,P(1,:),'rx');
    end
end
xlabel('r');
ylabel('k');
zlabel('x');
toc

