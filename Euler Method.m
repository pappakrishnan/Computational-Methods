%Adi
clear all
clc
h=0.001; n=25/h;

% initial values
%dx(1)=1.742;
vx(1)=1.742;
x(1)=0;
%dy(1)=-0.356;
vy(1)=-0.356;
y(1)=-0.3176;
dvx(1)=-1.075086373;
dvy(1)=5.973716254;
u=0.01215;

% two equations to solve. 
% 1. x'=vx       y'=vy
% 2. vx'=f       vy'=g
% %modified eulers method
% x1 = x0 + u0 ?t
% 
% y1 = y0 + v0 ?t
% 
% z1 = z0 + w0 ?t.
% 
% Furthermore, we can compute the change in the velocities during the interval ?t based on the acceleration due to the force acting on the star at P
% 
% u1 = u0 + Fx?t
% 
% v1 = v0 + Fy?t
% 
% w1 = w0 + Fz?t.
for i= 1:n
    t(i)=h*(i);
    
% evaluation of first derivative, evaluating x and y
    xeu(i)=x(i)+h*vx(i);
    x(i+1)=x(i)+(h/2)*(vx(i)+xeu(i));
    %x(i)=x(i+1);
    yeu(i)=y(i)+h*vy(i);
    y(i+1)=y(i)+(h/2)*(vy(i)+yeu(i));
    %y(i)=y(i+1);
% calculation of second derivative, evaluating vx and vy
    
vxeu(i)=vx(i)+h*(2*vy(i)+x(i)-((1-u)*(x(i)+u)/((x(i)+u)^2+y(i)^2)^1.5)- (u*(x(i)-1+u)/((x(i)-1+u)^2+y(i)^2)^1.5)); 
vx(i+1)=vx(i)+(h/2)*((2*vy(i)+x(i)-((1-u)*(x(i)+u)/((x(i)+u)^2+y(i)^2)^1.5)- (u*(x(i)-1+u)/((x(i)-1+u)^2+y(i)^2)^1.5))+vxeu(i)); 
  %vx(i+1)=dvx(i+1); 
vyeu(i)=vy(i)+h*(y(i)-2*vx(i)-((1-u)*y(i)/((x(i)+u)^2+y(i)^2)^1.5)- (u*y(i)/((x(i)-1+u)^2+y(i)^2)^1.5));  
vy(i+1)=vy(i)+(h/2)*((y(i)-2*vx(i)-((1-u)*y(i)/((x(i)+u)^2+y(i)^2)^1.5)- (u*y(i)/((x(i)-1+u)^2+y(i)^2)^1.5))+vyeu(i));
  vy(i)=vy(i+1);
  vx(i)=vx(i+1);        
  %increment in coordinates
          x(i)=x(i+1);
          y(i)=y(i+1);
end
figure(1);
plot(x,y);


