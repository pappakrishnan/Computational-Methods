clear all;
close all
clc
nb = 20;
n = 1000;
x = rand(n,1);
bin=zeros(nb,1);
for num=1:3
    for i=1:n
        H(i) = x(i)^(1/(num+1));
        j=int32(nb*H(i)+.5);
        bin(j)=bin(j)+1;
    end
    j=1:nb;
    i=1:n;
    figure(num);
    plot(j,bin(j),'o')
    hold on;
    for k=1:nb
        bin(k)=bin(k)/(0.05*n);
    end
plot(j,bin(j),'r');
hold off;
end


