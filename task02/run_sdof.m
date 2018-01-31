clear all; close all;
clc
% Damped resonant
% Sigle dof spring mass damper system
% Choose analysis type, 1=free, 2=forced, 3=damped
% Choose MATLAB solver
solver=45 ;
analysis=3;
y0=[0;0];
t0=0;
tinc=0.01;
tend=4;
tspan=t0:tinc:tend;
% tspan=[0 3];
k=2e3; 
m=10;
F=2;
c=0.01;
omega=sqrt(k/m);
% omega=14;
%omegad=omega*sqrt(1-zeta^2);
RelTol=1e-3;
AbsTol=1e-6; 
syms s;
s=dsolve('D2u+50/20*Du+2000/20*u=0','Du(0)=0','u(0)=0.02');
pretty(s);
tt=0:tinc:tend;
xn=subs(s,tt); 
tic
options = odeset('AbsTol',AbsTol,'RelTol',RelTol,'OutputFcn',@ OutputFcn,'Stats','on');
% [T,Y]=ode45(@(t,y) sdof(F,m,k,omega,c,t,y,analysis),tspan,y0,options);
if solver == 45
    display('Integrator: ode45 (Matlab), options:');
    [T,Y]=ode45(@(t,y) sdof(F,m,k,omega,c,t,y,analysis,solver),tspan,y0,options);
elseif solver == 15
    display('Integrator: ode15s (Matlab), options:');
    [T,Y]=ode15s(@(t,y) sdof(F,m,k,omega,c,t,y,analysis,solver),tspan,y0,options);
elseif solver == 23
    display('Integrator: ode23s (Matlab), options:');
    [T,Y]=ode23s(@(t,y) sdof(F,m,k,omega,c,t,y,analysis,solver),tspan,y0,options);
elseif solver == 24
    display('Integrator: ode23t (Matlab), options:');
    [T,Y]=ode23t(@(t,y) sdof(F,m,k,omega,c,t,y,analysis,solver),tspan,y0,options);
end
toc
% plot(T,Y(:,1),'m*-', T2, Y2(:,1), 'bd:', T3, Y3(:,1),'g--', T4, Y4(:,1), 'r:',tt,vpa(xn),'k', 'MarkerSize', 2, 'LineWidth', 0.5 );
% legend('ode45', 'ode15s','ode23s','ode24t','analytical');

% plot(T1,Y1(:,1),'m*-', T2, Y2(:,1), 'bd:', T3, Y3(:,1),'g--', T4, Y4(:,1), 'r:',tt,vpa(xn),'k', 'MarkerSize', 2, 'LineWidth', 0.5 );
% legend('ode45', 'ode15s','ode23s','ode24t','analytical');

% err45=vpa(xn)'-Y1(:,1);
% err15s=vpa(xn)'-Y2(:,1);
% err23s=vpa(xn)'-Y3(:,1);
% err23t=vpa(xn)'-Y4(:,1);
% plot(T1,err45,'m*-', T2, err15s, 'bd:', T3, err23s,'g--', T4, err23t, 'MarkerSize', 2, 'LineWidth', 1 );
% legend('err45', 'err15s','err23s','err24t');

plot(T,Y(:,1),'m*-', T, Y(:,2), 'bd:', 'MarkerSize', 2, 'LineWidth', 0.5 );
title(['Single DOF Spring-Mass-Damper System: ', ' M = ' num2str(m),...
   '[kg]' '; C = ' num2str(c), '[N.s^2/m^2]', '; K = ' num2str(k), '[N/m]']);
xlabel('time T');
ylabel('Displacement & Velocity'); grid on;
axis tight;

hold on;
Acceleration=F*sin(omega*T)/m-(c/m)*Y(:,2)-(k/m)*Y(:,1);
plot(T,Acceleration,'co--', 'MarkerSize', 2, 'LineWidth', 0.5 );
legend('Acceleration', 'Velocity','Displacement');
hold off;
% plot(T,Y(:,1),'b');
% hold on;
% plot(t,u(:,1),'r*--', t, u(:,2), 'bd:', 'MarkerSize', 2, 'LineWidth', 0.5);
