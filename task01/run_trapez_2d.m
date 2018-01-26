% 2D Trapezoidal Integral
clc;
clear
close all
format long
n = 200;
a=-0.5;
b=0.5;
c=-0.5;
d=0.5;
x = linspace(a,b,n);
y = linspace(c,d,n);
[xx,yy] = meshgrid(x,y);
fun = sin(yy-xx)+exp(xx+yy); 
tic
 result = trapezoidal_rule_double_integral(x, y, fun);
toc
fprintf( 'Area given by 2D Trapezoidal Rule = %f',result)
