% basic composite TR
clc;
clear
close all
f=@(x) (2 + sin(2*sqrt(x)));
b=10;
a=-10;
n=0.5;
h=(b-a)/n;
A=0;
while (a<b)
    A= A+(h/2)*(f(a)+f(a+h));
    a=a+h;
end
fprintf( 'Area given by Trapezoidal Rule = %f',A)

