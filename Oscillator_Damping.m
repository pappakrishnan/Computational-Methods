%Problem 4
close all
clear all
clc
i=0;
a = 1;
syms t c2 c1;
for b = 1:2
    for c=1:4
        i=i+1;
      k1(i)=(-b-sqrt(b^2-4*c^2*a))/(2*a);
      k2(i)=(-b+sqrt(b^2-4*c^2*a))/(2*a);  
      p(i)=real(k1(i));
      q(i)=imag(k1(i));
      x(i)=exp(p(i)*t)*(c1*cos(q(i)*t)+c2*sin(q(i)*t));
      x1(i)=diff(x(i),'t');
      x2(i)=subs(x(i)-1,t,0);
      x3(i)=subs(x1(i),t,0);
    end 
end
      C1=solve(x2(1),x3(1));
      C2=solve(x2(2),x3(2));
      C4=solve(x2(4),x3(4));
      C6=solve(x2(6),x3(6));
     x(1)=exp(p(1)*t)*(C1.c1*cos(q(1)*t)+C1.c2*sin(q(1)*t));
     x(2)=exp(p(2)*t)*(C2.c1*cos(q(2)*t)+C2.c2*sin(q(2)*t));
     x(4)=exp(p(4)*t)*(C4.c1*cos(q(4)*t)+C4.c2*sin(q(4)*t));     
     x(6)=exp(p(6)*t)*(C6.c1*cos(q(6)*t)+C6.c2*sin(q(6)*t));
     i=0;
 for T=0:.1:10
     i=i+1;
     X1(i)=subs(x(1),t,T);
     X2(i)=subs(x(2),t,T);
     X4(i)=subs(x(4),t,T);
     X6(i)=subs(x(6),t,T);
 end
     plot(X1,'b');
     hold on;
     plot(X2,'r');
     plot(X4,'g');
     plot(X6,'k')
     hold off