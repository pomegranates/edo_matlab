function[t,y] = Cauchy1_exact(tspan,h)
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
y =  ones(1,n);
for i = 2:n
    y(i) = (4/5)*exp(-200*t(i)) + (1/5);
end