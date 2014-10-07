clear all
close all
clc
n=10000;
x=rand(n,1);y=rand(n,1);z=rand(n,1);u=rand(n,1);
for j= 1:n
    count(j)=0;
    for i=1:j       
        if x(i)^2+y(i)^2+z(i)^2+u(i)^2<=1
            count(j)=count(j)+1;
        end
    end
Pi(j)=count(j)*16/j;
end
j=1:n;
plot(j,Pi(j))
Pi(n)