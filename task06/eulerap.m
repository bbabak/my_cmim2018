clear;
clc;
syms x y z alpha beta gamma phi1 phi2 phi3 t xdot ydot zdot phi1dot phi2dot phi3dot xdotdot ydotdot zdotdot phi1dotdot phi2dotdot phi3dotdot;
R1=[cos(alpha) -sin(alpha) 0;sin(alpha) cos(alpha) 0;0 0 1];
R2=[1 0 0; 0 cos(beta) -sin(beta);0 sin(beta) cos(beta)];
R3=[cos(gamma) -sin(gamma) 0;sin(gamma) cos(gamma) 0;0 0 1];
R=R1*R2*R3;
trR=trace(R);
e0=cos(beta/2)*cos((alpha+gamma)/2);
e1=sin(beta/2)*cos((alpha-gamma)/2);
e2=sin(beta/2)*sin((alpha-gamma)/2);
e3=cos(beta/2)*sin((alpha+gamma)/2);
e=[e0 e1 e2 e3];
vpa(subs(R,[alpha beta gamma],[45 45 45]));
vpa(subs(e,[alpha beta gamma],[90 30 -90]));
C=[x^2+y+sqrt(z)+sin(phi1);x*y+x*z+y*sin(phi3)+t^3;sin(phi2)+x^(3/2)+t];
q=[x y z phi1 phi2 phi3];
Cq=jacobian(C,q);
Ct=diff(C,t);
Ctt=diff(C,t,2);
qdot=[xdot ydot zdot phi1dot phi2dot phi3dot];
Cdot=Cq*qdot.'+Ct;
qdotdot=[xdotdot ydotdot zdotdot phi1dotdot phi2dotdot phi3dotdot];
Cqt=diff(Cq,t);
Cdotdot=Cq*qdotdot.'+jacobian(Cq*qdot.',q)*qdot.'+2*Cqt*qdot.'+Ctt;
%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%
clear 
clc
syms r phi h0 c real
c = 3;
h0 = 4;
fun = @(phi) c/cos(phi)-h0/sin(phi);
dfun = @(phi) c*sin(phi)/(cos(phi))^2+h0*cos(phi)/(sin(phi))^2;
phi0 = pi/4;
[xr, flag] = NewtonRaphson(fun, dfun, phi0);
