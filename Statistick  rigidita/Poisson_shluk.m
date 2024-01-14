y = [0: 0.01 :10];

g = @(y) y.^0;
gg = g(y);

h = @(y) 2*y.^0;
hh = h(y);

k = @(y) 0.5*y.^0;
kk = k(y);
clear k h g
plot(y,gg)
hold on
plot(y,hh)
plot(y,kk)
hold off