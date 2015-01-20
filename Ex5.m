R=2;
K=100;

% question 1
figure  % figure 1
hold on
tic
for i=0:12,
    [T,Y] = ode45(@(t,y) grasshopper_grow(t,y,R,K),[0 5],i*10);
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
y1 = x./(1+x.*x);
plot(x,y1,'-g')
for r=0.1:0.1:1   
    y2 = r.*(1-(x./k));
    P = InterX([x;y1],[x;y2]);
    plot(x,y2,P(1,:),P(2,:),'ro')
end
ylim([-0.5 1]);
figure  % figure 4
hold on
x = 0:35;
y1 = x./(1+x.*x);
plot(x,y1,'-g')
for k=5:5:30
    y2 = r.*(1-(x./k));
    P = InterX([x;y1],[x;y2]);
    plot(x,y2,P(1,:),P(2,:),'ro')
end
ylim([-1 1.5]);
 
 
% %looking for critical values of r
% figure
% hold on
% x = 0:100;
% y1 = x./(1+x.*x);
% tic
% % for several values of k
% for k=1:0.1:30 
%     % we look for the critical value of r
%     % i.e. the value for which there's more than one equilibrium
%     c = 0;    
%     start = 0;
%     finish = 5;
%     r_crit = finish;
%     while (c<8)           % times the calculation is done (~precision)
%         step = 1/10*(finish-start);            % adaptative step
%         for r=start:step:finish
%             y2 = r.*(1-(x./k));
%             P = InterX([x;y1],[x;y2]);
%             % one intersection = 2 values on P
%             % (both coordinates of the point)
%             if (length(P)>2 && r<r_crit)   
%                 r_crit = r;
%             end
%         end
%         % new interval to increase precision on r_crit
%         start = r_crit - step;
%         finish = r_crit + step;
%         c = c+1;
%     end
%     if (r_crit < 3)       % plot if one critical value has been found
%         plot(k,r_crit,'rx','Markersize',5);
%     end
% end
% toc
% 
% % same as before but starting from the end
% figure
% hold on
% x = 0:100;
% y1 = x./(1+x.*x);
% tic
% for k=1:0.1:30 
%     c = 0;    
%     start = 5;
%     finish = 0;
%     r_crit = finish;
%     while (c<8)           
%         step = 1/10*(finish-start);           
%         for r=start:step:finish
%             y2 = r.*(1-(x./k));
%             P = InterX([x;y1],[x;y2]);
%             if (length(P)>2 && r>r_crit)   
%                 r_crit = r;
%             end
%         end
%         start = r_crit + step;
%         finish = r_crit - step;
%         c = c+1;
%     end
%     if (r_crit > 0)       
%         plot(k,r_crit,'rx','Markersize',5);
%     end
% end
% toc
% 
% % zoom on critical zone of the previous plot
% figure
% hold on
% x = 0:100;
% y1 = x./(1+x.*x);
% tic
% for k=7.45:0.001:7.55 
%     c = 0;    
%     start = 5;
%     finish = 0;
%     r_crit = finish;
%     while (c<8)           
%         step = 1/10*(finish-start);           
%         for r=start:step:finish
%             y2 = r.*(1-(x./k));
%             P = InterX([x;y1],[x;y2]);
%             if (length(P)>2 && r>r_crit)   
%                 r_crit = r;
%             end
%         end
%         start = r_crit + step;
%         finish = r_crit - step;
%         c = c+1;
%     end
%     if (r_crit > 0)       
%         plot(k,r_crit,'rx','Markersize',5);
%     end
% end
% toc


% % question 6
% figure
% hold on
% x = 0:70;
% y1 = x.*0;
% tic
% for r=0.05:0.01:1.2
%     for k=5:0.5:30
%         y2 = r.*(1-(x./k)) - (x./(1+x.*x));
%         P = InterX([x;y1],[x;y2]);
%         R = r*ones(length(P(1,:)),1);
%         K = k*ones(length(P(1,:)),1);
%         plot3(R,K,P(1,:),'rx');
%     end
% end
% xlim([0.1 1.2])
% xlabel('r');
% ylabel('k');
% zlabel('x');
% toc

% % zoom on critical zone of the previous plot
% figure
% hold on
% x = 0:50;
% y1 = x.*0;
% tic
% for r=0.4:0.01:0.7
%     for k=4:0.1:10
%         y2 = r.*(1-(x./k)) - (x./(1+x.*x));
%         P = InterX([x;y1],[x;y2]);
%         R = r*ones(length(P(1,:)),1);
%         K = k*ones(length(P(1,:)),1);
%         plot3(R,K,P(1,:),'rx');
%     end
% end
% xlabel('r');
% ylabel('k');
% zlabel('x');
% toc

% question 7
% example of phase portraits, with 3 equilibriums
% for k=10 and r=0.4
figure
tic
hold on
r = 0.4;
k = 10;
for i=1:0.1:10
    [T,Y] = ode45(@(t,y) invasion(t,y,r,k),[0 70],i);
    plot(T,Y)
end
toc

% for k=50 and r=0.05
figure
tic
hold on
r = 0.05;
k = 50;
for i=1:1:50
    [T,Y] = ode45(@(t,y) invasion(t,y,r,k),[0 100],i);
    plot(T,Y)
end
toc


%for k=50 and r=0.1
figure
tic
hold on
r = 0.1;
k = 50;
for i=1:1:50
    [T,Y] = ode45(@(t,y) invasion(t,y,r,k),[0 100],i);
    plot(T,Y)
end
toc
x = 0:100;
y1 = x.*0;
y2 = r.*(1-(x./k)) - (x./(1+x.*x));
P = InterX([x;y1],[x;y2]);
P(1,2)
plot([0 100], [P(1,2) P(1,2)],'-r','LineWidth',2);


