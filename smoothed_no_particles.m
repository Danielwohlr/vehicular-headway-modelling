x=-10:0.1:10;
 
y1 = @(x) 1/sqrt(2*pi)*exp(-1/2.*(x+8).^2);
y2 = @(x) 1/sqrt(2*pi)*exp(-1/2.*(x).^2);
y3 = @(x) 1/sqrt(2*pi)*exp(-1/2.*(x-8).^2);
ff1=[ y1(x(1:end))];
ff2=[ y2(x(1:end))];
ff3=[ y3(x(1:end))];
 

f = @(x) 1/sqrt(2*pi)*exp(-1/2.*(x+8).^2)+ 1/sqrt(2*pi)*exp(-1/2.*(x).^2)+1/sqrt(2*pi)*exp(-1/2.*(x-8).^2);
ff=[ f(x(1:end))];
% x=x';
% ff = ff';
% T=table(x,ff);
l=cumsum(ff)*0.1;
plot(x,l)
hold on
plot(x,ff1)
plot(x,ff2)
plot(x,ff3)
l=l';
x=x';
ff1=ff1';
ff2=ff2';
ff3=ff3';
T=table(x,l);
Z=table(x,ff1);
U=table(x,ff2);
I=table(x,ff3);