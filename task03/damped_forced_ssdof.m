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

solution_free = dsolve(ode == 0,[Dx(0) == 0, x(0) == A]);

disp(solution_free);
 
disp(solution_free);
% Solve with initial conditions
% $$\left\{ \begin{array}{c}m\ddot{x}+kx=0\\x\left(0\right)=A,\,\dot{x}\left(0\right)=0\end{array}\right.$$
%
% syms A real
% solution_free_rewritten_ic = dsolve(ode == 0, [Dx(0) == 0, x(0) == A] );
% solution_free_ic = subs(solution_free_rewritten_ic);
% disp(solution_free_rewritten_ic);
% display equation variables
symvar(solution_free)
% solution_free_rewrite = simplify(subs(solution_free, sqrt(k/m), omega)); 
% disp(solution_free_rewrite)
% Plot solution
%
% figure

% figure('Units','inches','Position',[0 0 8 4],'PaperPositionMode','auto');

% fplot(subs(solution_free_rewritten, [A,OMEGA,c,f,k,m,zeta], [0,01,1,4,2,5,0.5]), [0, 10])
fplot(subs(solution_free, [A,OMEGA,f,m,omega,zeta], [0.05,6,8,10,2,0.5]), [0, 10])
% fo=2;
% zeta1=0;
% n=1;
% for i=0:0.05:10
%     A1(n)=fo/sqrt((1-i^2).^2+(2*zeta1*i).^2);
%     n=n+1;
%     disp(i)
% end
% 
% zeta2=0.125;
% n=1;
% for i=0:0.05:10
%     A2(n)=fo/sqrt((1-i^2).^2+(2*zeta2*i).^2);
%     n=n+1;
% end
% 
% zeta3=0.250;
% n=1;
% for i=0:0.05:10
%     A3(n)=fo/sqrt((1-i^2).^2+(2*zeta3*i).^2);
%     n=n+1;
% end
% 
% zeta4=0.375;
% n=1;
% for i=0:0.05:10
%     A4(n)=fo/sqrt((1-i^2).^2+(2*zeta4*i).^2);
%     n=n+1;
% end
% 
% zeta5=0.500;
% n=1;
% for i=0:0.05:10
%     A5(n)=fo/sqrt((1-i^2).^2+(2*zeta5*i).^2);
%     n=n+1;
% end
% 
% zeta6=0.625;
% n=1;
% for i=0:0.05:10
%     A6(n)=fo/sqrt((1-i^2).^2+(2*zeta6*i).^2);
%     n=n+1;
% end
% 
% zeta7=0.750;
% n=1;
% for i=0:0.05:10
%     A7(n)=fo/sqrt((1-i^2).^2+(2*zeta7*i).^2);
%     n=n+1;
% end
% 
% zeta8=0.875;
% n=1;
% for i=0:0.05:10
%     A8(n)=fo/sqrt((1-i^2).^2+(2*zeta8*i).^2);
%     n=n+1;
% end
% 
% zeta9=1;
% n=1;
% for i=0:0.05:10
%     A9(n)=fo/sqrt((1-i^2).^2+(2*zeta9*i).^2);
%     n=n+1;
% end
% zeta10=1.125;
% n=1;
% for i=0:0.05:10
%     A10(n)=fo/sqrt((1-i^2).^2+(2*zeta10*i).^2);
%     n=n+1;
% end
% syms t
% zeta=0:0.125:1.125;
% M=f/sqrt(((1-(OMEGA*t/omega)^2).^2+(2*zeta(1)*(OMEGA*t/omega).^2)));
% fplot(subs(M, [OMEGA,f,omega], [3,1,2]), [0, 5])
% hold on
% M=f/sqrt(((1-(OMEGA*t/omega)^2).^2+(2*zeta(2)*(OMEGA*t/omega).^2)));
% fplot(subs(M, [OMEGA,f,omega], [3,1,2]), [0, 5])
% hold on
% M=f/sqrt(((1-(OMEGA*t/omega)^2).^2+(2*zeta(3)*(OMEGA*t/omega).^2)));
% fplot(subs(M, [OMEGA,f,omega], [3,1,2]), [0, 5])
% hold on
% M=f/sqrt(((1-(OMEGA*t/omega)^2).^2+(2*zeta(4)*(OMEGA*t/omega).^2)));
% fplot(subs(M, [OMEGA,f,omega], [3,1,2]), [0, 5])
% hold on
% M=f/sqrt(((1-(OMEGA*t/omega)^2).^2+(2*zeta(3)*(OMEGA*t/omega).^2)));
% fplot(subs(M, [OMEGA,f,omega], [3,1,2]), [0, 5])

syms t
i=1;
for zeta=0:0.125:1.125
    i=i+1;
M(i)=f/sqrt(((1-(OMEGA*t/omega)^2).^2+(2*zeta(1,:)*(OMEGA*t/omega).^2)));
end
fplot(subs(M, [OMEGA,f,omega], [3,2,3]), [0, 5],'LineWidth', 1.0)
hold on



% fplot(subs(solution_free_rewritten, [A,OMEGA,c,f,k,m,zeta], [0,5,1,4,2,5,1.9]), [0, 10])
% M=sqrt(omega^2-OMEGA^2)^2+(c*OMEGA)^2;
% r=OMEGA/omega;
% axis([0 10 -10 10]) 
% set(gca,'Units','normalized','YTick',-10:1:10,'XTick',0:10/10:10,'Position',[.15 .2 .75 .7],'FontUnits','points','FontWeight','normal','FontSize',9,'FontName','Times')
% figure('Units','inches','Position',[0 0 6 4],'PaperPositionMode','auto');
% plot(0:.05:10,A1,'b','LineWidth', 1.5)
% hold on
% plot(0:.05:10,A2,'c','LineWidth', 1.5)
% hold on
% plot(0:.05:10,A3,'g','LineWidth', 1.5)
% hold on
% plot(0:.05:10,A4,'k','LineWidth', 1.5)
% hold on
% plot(0:.05:10,A5,'r','LineWidth', 1.5)
% hold on
% plot(0:.05:10,A6,'m','LineWidth', 1.5)
% hold on
% plot(0:.05:10,A7,'y','LineWidth', 1.5)
% hold on
% plot(0:.05:10,A8,'c--','LineWidth', 1.5)
% hold on
% plot(0:.05:10,A9,'g--','LineWidth', 1.5)
% hold on
% plot(0:.05:10,A10,'b--','LineWidth', 1.5)
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
