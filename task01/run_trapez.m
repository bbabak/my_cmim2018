% basic composite TR
clc;
clear
close all
format long
fun=@(x) (2*x + cos(2*sqrt(x)));
b=10;
a=-10;
up_limit=b;
low_limit=a;
no_splits=200;
h=(b-a)/no_splits;
x = linspace(a,b,no_splits);
tic
result = integral_trapezoid( fun, low_limit, up_limit, no_splits );
toc
fprintf( 'Area given by Trapezoidal Rule = %f',result)