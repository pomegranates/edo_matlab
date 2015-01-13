function dy = grasshopper_grow(t,y,r,K)
dy = r*y*(1-y/K);