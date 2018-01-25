function out = trapezoidal_rule_double_integral(x, y, fun)

 out = trapz(y,trapz(x,fun,1),2);
 




