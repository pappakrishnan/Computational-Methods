clear all
close all
clc
n=1000;
actual = pi;
x=rand(n,1);y=rand(n,1);z=rand(n,1);
for j= 1:n
    count(j)=0;
    for i=1:j       
        if x(i)^2+y(i)^2+z(i)^2<=1
            count(j)=count(j)+1;
        end
    end
Pi(j)=count(j)*6.0/j;
H(j) = sum(Pi)/j;
E(j)=abs((H(j)- actual)/actual)*100;
end
j=1:n;
figure(1);
plot(j,H(j));
figure(2);
semilogy(j,E(j));
H(n)
