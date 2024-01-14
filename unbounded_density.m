% Balanced density its derivative is not bounded

clear all
clc
% x=0:.001:3;
f= @(x) exp(-x).*(1+sin(exp(x.*2))/2);
fplot(f,[0 3])
