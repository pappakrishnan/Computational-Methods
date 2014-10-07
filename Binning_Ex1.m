% Initializing the walkers
clear all
close all
clc
nk=1000;n=10000;dw=0.3;
nb=20;
for i=1:n
x(i)=pi*rand;
end
for k=1:nk
for i=1:n
xp=x(i)+dw*pi*(2*rand-1);
if ((xp>0) && (xp<pi))
%calculate pdf at old position
g1=exp(-2*x(i))*(sin(x(i))^2);
%calculate pdf at new position
g2=exp(-2*xp)*(sin(xp)^2);
if rand<g2/g1;
x(i)=xp;
end ;
end;
end
end
 bin=zeros(nb,1);
    for i=1:n
        j=1+int32(nb*x(i)/pi);
        bin(j)=bin(j)+1;
    end
    j=1:nb;
plot(j,bin(j)/nk)