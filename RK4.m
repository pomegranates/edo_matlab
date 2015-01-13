function[t,y] = RK4 (dydt,tspan,y0,h)
  % uses RK4 to solve considered EDO
  
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
    k1 = feval(dydt, t(i), y(i));
    k2 = feval(dydt, ( t(i)+(t(i+1)-t(i))/2 ), ( y(i)+((t(i+1)-t(i))/2)*k1 ) );
    k3 = feval(dydt, ( t(i)+(t(i+1)-t(i))/2 ), ( y(i)+((t(i+1)-t(i))/2)*k2 ) );
    k4 = feval(dydt, t(i+1), y(i)+(t(i+1)-t(i))*k3 );
    y(i+1) = y(i) + (t(i+1)-t(i))/6 * (k1 + 2*k2 + 2*k3 + k4);
end