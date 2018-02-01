
clc
clear
close all
% Damped resonant
% Sigle dof spring mass damper system
% Choose analysis type, 1=free, 2=forced, 3=damped
% Choose MATLAB solver
 

solver=45 ;
analysis=1;
y0=[0.02;0];
t0=0;
tinc=0.01;
tend=4;
tspan=t0:tinc:tend;
% tspan=[0 3];
global F m c k
k=2e3; 
m=20;
F=2;
c=50;
omega=sqrt(k/m);
% omega=14;
%omegad=omega*sqrt(1-zeta^2);
RelTol=1e-9;
AbsTol=1e-10; 
syms s;
s=dsolve('D2u+50/20*Du+2000/20*u=0','Du(0)=0','u(0)=0.02');
pretty(s);
tt=0:tinc:tend;
xn=subs(s,tt); 
tic
options = odeset('AbsTol',AbsTol,'RelTol',RelTol,'Refine' ,'on','OutputFcn',@ OutputFcn,'Stats','on');
% [T,Y]=ode45(@(t,y) sdof(F,m,k,omega,c,t,y,analysis),tspan,y0,options);

    display('Integrator: ode45 (Matlab), options:');
    [T,Y1]=ode45(@(t,y) sdof(F,m,k,omega,c,t,y,analysis,solver),tspan,y0,options);

    display('Integrator: ode15s (Matlab), options:')
    [T,Y2]=ode15s(@(t,y) sdof(F,m,k,omega,c,t,y,analysis,solver),tspan,y0,options);

    display('Integrator: ode23s (Matlab), options:')
    [T,Y3]=ode23s(@(t,y) sdof(F,m,k,omega,c,t,y,analysis,solver),tspan,y0,options);

    display('Integrator: ode23t (Matlab), options:')
    [T,Y4]=ode113(@(t,y) sdof(F,m,k,omega,c,t,y,analysis,solver),tspan,y0,options);

toc

% plot(T,Y1(:,1),'m*-', T, Y2(:,1), 'bd:', T, Y3(:,1),'g--', T, Y4(:,1), 'r:',tt,vpa(xn),'k', 'MarkerSize', 2, 'LineWidth', 1 );
% legend('ode45', 'ode15s','ode23s','ode113','analytical');

err45=vpa(xn)'-Y1(:,1);
err15s=vpa(xn)'-Y2(:,1);
err23s=vpa(xn)'-Y3(:,1);
err113=vpa(xn)'-Y4(:,1);
plot(T,err45,'m*-', T, err15s, 'bd:', T, err23s,'g--', T, err113, 'MarkerSize', 2, 'LineWidth', 1 );
legend('err45', 'err15s','err23s','err113');
title('Errors given by MATLAB solvers');
xlabel('time');
ylabel('Displacement'); grid on;

