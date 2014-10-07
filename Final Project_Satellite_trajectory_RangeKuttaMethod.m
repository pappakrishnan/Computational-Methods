%Ranga kutta
clear all
close all
clc

mu =0.01215;
x(1)=0;
y(1)=-0.3176;
X(1)=1.742;
Y(1)=-0.356;
h = 0.0004;
to=4.347;

for i=1:25/h
    t(i)= to*i*h*1440;
    f(i)=2*Y(i)+x(i)-(((1-mu)*(x(i)+mu))/(((x(i)+mu)^2)+y(i)^2)^(3/2))-((mu*(x(i)-1+mu))/(((x(i)-1+mu)^2)+y(i)^2)^(3/2));
    g(i)=y(i)-2*X(i)-(((1-mu)*y(i))/(((x(i)+mu)^2)+y(i)^2)^(3/2))-((mu*y(i))/(((x(i)-1+mu)^2)+y(i)^2)^(3/2));
    
    X1(i)=h*f(i);
    
    x1(i)=h*X(i);
    x2(i)=h*(X(i)+X1(i)/2);
    x4(i)=h*(X(i)+X1(i));
    
    Y1(i)=h*g(i);
    
    y1(i)=h*Y(i);
    y2(i)=h*(Y(i)+Y1(i)/2);
    y4(i)=h*(Y(i)+Y1(i));
    
    x(i+1)=x(i)+(1/6)*(x1(i)+4*x2(i)+x4(i));
    X(i+1)=X(i)+X1(i);
    
    y(i+1)=y(i)+(1/6)*(y1(i)+4*y2(i)+y4(i));    
    Y(i+1)=Y(i)+Y1(i);
    D(i)=(sqrt((x(i)-0.98785)^2+(y(i)-0)^2))*384400;
    if (i~=1 && D(i)<D(i-1))
        Dmin1 = D(i)-1737.4;
        tmin1 = t(i);
    end    
end
Dmin=min(D)-(1737.4);
e=-0.01215;
E=0;
m=1-0.01215;
M=0;
figure(1);
plot(x,y);
hold on;
plot(e,E,'rO');
plot(m,M,'b*');
hold off
figure(2);
semilogy(t,D)