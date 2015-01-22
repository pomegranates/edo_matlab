function[t,y] = Cauchy1_implicit(tspan,h)
  % return the implicit Euler method applied to the Cauchy problem in
  % exercise 1
  
  % INPUT : 
  % tspan = [ti,tf] where ti is the starting point and tf the ending point
  % h step

  % OUTPUT :
  % t time
  % y implicit approximation

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
    y(i) = 9/(5*(1+200*h)^t(i)) + (1/5);
end