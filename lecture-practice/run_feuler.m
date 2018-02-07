clc
clear
close all
dt= 1e-3;
tk = 1;
y0=1;
r=0.5;
n0=5;
test_fun = @(t,y) r*y;
[t,y] = odeFE ( test_fun, [dt,tk] ,y0);
 yexact = y0*exp(r*t);
  
 plot(T, Y-Yexact);
 