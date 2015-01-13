function[t,y] = Euler (dydt,tspan,y0,h)
  %[t,y] = Eulode (dydt,tspan,y0,h)
  % uses explicit version of Euler to solve considered EDO
  
  % INPUT : 
  % dydt = name of the Matlab file evaluating EDO
  % tspan = [ti,tf] where ti is the starting point and tf the ending point
  % y0 initial value
  % h step

  % OUTPUT :
  % t time
  % y approximate solutions by using Euler method

ti = tspan(1);
tf = tspan(2);
t = (ti:h:tf);
n = length(t);
if t(n) < tf
t(n+1) = tf;
n = n+1;
end
y = y0 * ones(1,n);
for i = 1:n-1
y(i+1) = y(i) + feval (dydt, t(i), y(i))*(t(i+1)-t(i));
end


% the function called by dydt must be defined in a separate m file starting by
% function dydt = diffeq(t,y)
% dydt = 4*exp(0.8*t)-0.5*y;               (for instance (?))

% for instance :
% >> [t,y] = Eulode(dydt,[0,4],2,1);       THIS DOESN'T WORK !!!
% >> disp([t,y]);
% or
% >> [t,y] = Eulode('diffeq',[0,4],2,1);   THIS ONE IS OK !
% >> disp([t,y]);
% or
% >> [t,y] = Eulode(@diffeq,[0,4],2,1);
% >> disp([t,y]);
