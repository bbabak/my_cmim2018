% Symbolic solution - in appliction to frequency responce of SDOF system 
clc
clear
close all
% Define symbolic variables
syms A m omega OMEGA f zeta real 

assumeAlso(m > 0);

syms x(t)
Dx = diff(x, t);

ode = diff(x,t,2)  + zeta*omega*Dx + omega^2*x - 1/m*f*sin(OMEGA*t);

solution_forced = dsolve(ode == 0,[Dx(0) == 0, x(0) == A]);

disp(solution_forced);

% display equation variables
symvar(solution_forced)

figure('Units','inches','Position',[0 0 8 4],'PaperPositionMode','auto');

fplot(subs(solution_forced, [A,OMEGA,f,m,omega,zeta], [0,6,8,10,2,0.5]), [0, 10])

i=1;
for zeta=0:0.125:1.125
    i=i+1;
M(i)=f/sqrt(((1-(OMEGA*t/omega)^2).^2+(2*zeta(1,:)*(OMEGA*t/omega).^2)));
end
pdat=subs(M, [OMEGA,f,omega], [3,2,3]);
runplot(pdat)

hold on

grid on
xlim([0,5]);
ylim([0,7.5]);
hold off
ylabel(' Magnification Factor $$X\frac{k}{F_{0}}$$','FontUnits','points','interpreter','latex','FontWeight','bold','FontSize',12,'FontName','Times')
xlabel(' Frequency Ratio $$r=\frac{f}{f_{n}}$$','FontUnits','points','interpreter','latex','FontSize',12,'FontName','Times','Fontweight','bold')
legend({'$\zeta=0$','$\zeta=0.125$','$\zeta=0.250$','$\zeta=0.375$','$\zeta=0.500$','$\zeta=0.625$','$\zeta=0.750$','$\zeta=0.875$','$\zeta=1.0$','$\zeta=1.125$'},'FontUnits','points','interpreter','latex','FontSize',12,'FontName','Times','Location','NorthEast')
% annotation('arrow','X',[0.1,0.2],'Y',[0.1,0.3])
title('Frequency Response of System','FontUnits','points','FontWeight','bold','FontSize',12,'FontName','Times')
print -depsc2 myplot.eps
print -dpdf myplot.pdf
hold off
