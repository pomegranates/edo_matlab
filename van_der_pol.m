function dy = van_der_pol(t,y,mu)
dy = zeros(2,1);
dy(1) = y(2);
dy(2) = mu*(1 - y(1)^2)*y(2) - y(1);