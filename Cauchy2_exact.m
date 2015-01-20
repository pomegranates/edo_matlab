function[t,y] = Cauchy2_exact(tspan,h)
  % return the exact solution (analytical) of the Cauchy problem in
  % exercise 2
  
  % INPUT : 
  % tspan = [ti,tf] where ti is the starting point and tf the ending point
  % h step

  % OUTPUT :
  % t time
  % y exact solution

ti = tspan(1);
tf = tspan(2);
t = (ti:h:tf);
n = length(t);
if t(n) < tf
t(n+1) = tf;
n = n+1;
end
y = 2 * ones(1,n);
for i = 2:n
    y(i) = (40/13)*exp(0.8*t(i)) - (14/13)*exp(-0.5*t(i));
end