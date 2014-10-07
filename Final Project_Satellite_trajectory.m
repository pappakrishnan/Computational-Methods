%Final Project
clear all
close all
clc

mu =0.01215;
x(1)=0;
y(1)=-0.3176;
X(1)=1.742;
Y(1)=-0.356;
h =0.001;
to=4.347;

for i=1:(25/h)
    t(i)= to*i*h*1440;
    f(i)=(2*Y(i))+x(i)-(((1-mu)*(x(i)+mu))/(((x(i)+mu)^2)+y(i)^2)^(3/2))-((mu*(x(i)-1+mu))/(((x(i)-1+mu)^2)+y(i)^2)^(3/2));
    g(i)=y(i)-(2*X(i))-(((1-mu)*y(i))/(((x(i)+mu)^2)+y(i)^2)^(3/2))-((mu*y(i))/(((x(i)-1+mu)^2)+y(i)^2)^(3/2));
    
    X(i+1)=X(i)+(h*f(i));
    Y(i+1)=Y(i)+(h*g(i));
    x(i+1)=x(i)+(h*X(i));
    y(i+1)=y(i)+(h*Y(i));
    
    f1(i)=(2*Y(i+1))+x(i+1)-(((1-mu)*(x(i+1)+mu))/(((x(i+1)+mu)^2)+y(i+1)^2)^(3/2))-((mu*(x(i+1)-1+mu))/(((x(i+1)-1+mu)^2)+y(i+1)^2)^(3/2));
    g1(i)=y(i+1)-(2*X(i+1))-(((1-mu)*y(i+1))/(((x(i+1)+mu)^2)+y(i+1)^2)^(3/2))-((mu*y(i+1))/(((x(i+1)-1+mu)^2)+y(i+1)^2)^(3/2));
    
    X(i+1)=X(i)+(h*0.5*(f(i)+f1(i)));
    Y(i+1)=Y(i)+(h*0.5*(g(i)+g1(i)));    
    x(i+1)=x(i)+(h*0.5*(X(i)+X(i+1)));
    y(i+1)=y(i)+(h*0.5*(Y(i)+Y(i+1)));
    
    D(i)=(sqrt((x(i)-0.98785)^2+(y(i)-0)^2))*384400; 
    d(i)=D(i)-1737.4;
    if (i>1)
        Q=D(i-1);
        W=D(i);
    if (Q>W)
        Dmin2 = W-1737.4;
        tmin2 = t(i);
    end
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
semilogy(t,D);
figure(3);
plot(t,d)