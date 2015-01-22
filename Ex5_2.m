% question 2
figure  % figure 1
hold on
for B=1:5
    for A=1:5
        [X,Y] = fplot(@(x) (5*B*x^2)/(5*A^2+x^2),[0,80]);
        plot(X,Y,'Color',[A/5 0 0]);
    end
end
title('Evolution du terme de prédation en fonction de diverses valeurs de A et B');
xlabel('Temps');
ylabel('Effectif');