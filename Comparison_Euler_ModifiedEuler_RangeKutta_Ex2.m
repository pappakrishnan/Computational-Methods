% Euler's Method:Problem 2 A
clear all
close all
clc

h = 0.02;
x = 0:h:1;
y(1)=0;
z(1)=0;
rk(1)=0;
for i=1:(1/h)
    k(i)=x(i)+0.5*h;
    l(i)=x(i)+h;
    f(i) = (pi*cos(4*pi*x(i))- sin(4*pi*x(i)))* exp(-4*x(i));%EU
    s(i) = (pi*cos(4*pi*x(i+1))- sin(4*pi*x(i+1)))* exp(-4*x(i+1));%MEU
    
    c(i) = (pi*cos(4*pi*k(i))- sin(4*pi*k(i)))* exp(-4*k(i));%RK4
    d(i) = (pi*cos(4*pi*l(i))- sin(4*pi*l(i)))* exp(-4*l(i));%RK4
    
    y(i+1)=y(i)+h*f(i);%EU
    z(i+1)=z(i)+0.5*h*(f(i)+s(i));%MEU
    
    r1(i)=h*f(i);
    r23(i)=h*c(i);
    r4(i)=h*d(i);  
    rk(i+1)=rk(i)+(1/6)*r1(i)+(2/3)*r23(i)+(1/6)*r4(i);
    func(i) = 0.25*sin((4*pi)*x(i))*exp((-4)*x(i));%Actual
end
figure(1);
plot(y);
hold on;
plot(func,'.r');
plot(z,'g');
plot(rk,'or')
hold off