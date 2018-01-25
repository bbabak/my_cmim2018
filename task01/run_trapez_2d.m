% 2D Trapezoidal Integral
clc;
clear
close all
format long
n = 200;
xmin=-0.5;
xmax=0.5;
ymin=-0.5;
ymax=0.5;
x = linspace(xmin,xmax,n);
y = linspace(ymin,ymax,n);
[xx,yy] = meshgrid(x,y);
fun = sin(yy-xx)+exp(xx+yy); 
tic
 result = trapezoidal_rule_double_integral(x, y, fun);
toc
fprintf( 'Area given by 2D Trapezoidal Rule = %f',result)
