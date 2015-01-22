function dy = invasion(t,y,r,K)
dy = r*y*(1-(y/K)) - (y^2)/(1+y^2);