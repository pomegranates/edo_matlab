%looking for critical values of r
figure
hold on
x = 0:100;
y1 = x./(1+x.*x);
tic
% for several values of k
for k=1:0.1:30 
    % we look for the critical value of r
    % i.e. the value for which there's more than one equilibrium
    c = 0;    
    start = 0;
    finish = 5;
    r_crit = finish;
    while (c<8)           % times the calculation is done (~precision)
        step = 1/10*(finish-start);            % adaptative step
        for r=start:step:finish
            y2 = r.*(1-(x./k));
            P = InterX([x;y1],[x;y2]);
            % one intersection = 2 values on P
            % (both coordinates of the point)
            if (length(P)>2 && r<r_crit)   
                r_crit = r;
            end
        end
        % new interval to increase precision on r_crit
        start = r_crit - step;
        finish = r_crit + step;
        c = c+1;
    end
    if (r_crit < 3)       % plot if one critical value has been found
        plot(k,r_crit,'rx','Markersize',5);
    end
end
toc
ylim([0.1 0.6]);
title('Valeur critique inférieure de r, en fonction de k');
xlabel('k');
ylabel('r1');

% same as before but starting from the end
figure
hold on
x = 0:100;
y1 = x./(1+x.*x);
tic
for k=1:0.1:30 
    c = 0;    
    start = 5;
    finish = 0;
    r_crit = finish;
    while (c<8)           
        step = 1/10*(finish-start);           
        for r=start:step:finish
            y2 = r.*(1-(x./k));
            P = InterX([x;y1],[x;y2]);
            if (length(P)>2 && r>r_crit)   
                r_crit = r;
            end
        end
        start = r_crit + step;
        finish = r_crit - step;
        c = c+1;
    end
    if (r_crit > 0)       
        plot(k,r_crit,'rx','Markersize',5);
    end
end
toc
ylim([0.1 0.6]);
title('Valeur critique supérieure de r, en fonction de k');
xlabel('k');
ylabel('r2');


% zoom on critical zone of the previous plot
figure
hold on
x = 0:100;
y1 = x./(1+x.*x);
tic
for k=7.45:0.001:7.55 
    c = 0;    
    start = 5;
    finish = 0;
    r_crit = finish;
    while (c<8)           
        step = 1/10*(finish-start);           
        for r=start:step:finish
            y2 = r.*(1-(x./k));
            P = InterX([x;y1],[x;y2]);
            if (length(P)>2 && r>r_crit)   
                r_crit = r;
            end
        end
        start = r_crit + step;
        finish = r_crit - step;
        c = c+1;
    end
    if (r_crit > 0)       
        plot(k,r_crit,'rx','Markersize',5);
    end
end
toc
xlim([7.45 7.55]);
title('Valeur critique supérieure de r, en fonction de k');
xlabel('k');
ylabel('r2');