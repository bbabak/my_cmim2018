clc;
clear;
% Damped resonant
% Sigle dof spring mass damper system
% Choose analysis type, 1=free, 2=forced, 3=damped
% Choose MATLAB solver

solver=45;
analysis=2;
y0=[0.02;0];
t0=0;
tinc=0.01;
tend=4;
tspan=t0:tinc:tend;
k=2e3; 
m=10;
F=1;
c=5;
% omegan=sqrt(k/m);
omega=5;
%omegad=omega*sqrt(1-zeta^2);
RelTol=1e-3;
AbsTol=1e-6; 
tic
options = odeset('AbsTol',AbsTol,'RelTol',RelTol,'OutputFcn',@ OutputFcn,'Stats','on');
% [T,Y]=ode45(@(t,y) sdof(F,m,k,omega,c,t,y,analysis),tspan,y0,options);
if solver == 45
    display('Integrator: ode45 (Matlab), options:')
    [T,Y]=ode45(@(t,y) sdof(F,m,k,omega,c,t,y,analysis,solver),tspan,y0,options);
elseif solver == 15
    display('Integrator: ode15s (Matlab), options:')
    [T,Y]=ode15s(@(t,y) sdof(F,m,k,omega,c,t,y,analysis,solver),tspan,y0,options);
elseif solver == 23
    display('Integrator: ode23s (Matlab), options:')
    [T,Y]=ode23s(@(t,y) sdof(F,m,k,omega,c,t,y,analysis,solver),tspan,y0,options);
elseif solver == 24
    display('Integrator: ode23t (Matlab), options:')
    [T,Y]=ode23t(@(t,y) sdof(F,m,k,omega,c,t,y,analysis,solver),tspan,y0,options);
end
toc

plot(T,Y(:,1),'m*-', T, Y(:,2), 'bd:', 'MarkerSize', 2, 'LineWidth', 0.5 );
title(['Spring-Mass-Damper System of 2nd order ODE: ', ' M = ' num2str(m),...
   '[kg]' '; C = ' num2str(c), '[N.s^2/m^2]', '; K = ' num2str(k), '[N/m]']);
xlabel('time T');
ylabel('Displacement & Velocity'); grid on;
axis tight;

hold on;
Acceleration=-(c/m)*Y(:,2)-(k/m)*Y(:,1);
plot(T,Acceleration,'co--', 'MarkerSize', 2, 'LineWidth', 0.5 );
legend('Displacement', 'Velocity', 'Acceleration');
hold off;
% plot(T,Y(:,1),'b');
% hold on;
% plot(t,u(:,1),'r*--', t, u(:,2), 'bd:', 'MarkerSize', 2, 'LineWidth', 0.5);
