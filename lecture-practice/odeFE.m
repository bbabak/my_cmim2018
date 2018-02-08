function [t,y] = odeFE(fun,tspan,y0)
t=0:tspan(1):tspan(2);

n=length(t);

y=zeros(length(y0),length(t));

y(:,0)=y0(:);

for i=2:n
    y(:,i)=y(:,i-1)+dt+fun(t(i-1),y(:,i-1))
end
