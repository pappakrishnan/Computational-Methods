%Problem 5
clear all;
input = load('USA_mortality.txt');
for i=1:1:max(input);
    t(i)=input(i,1);
    N(i)=input(i,2);   
end
n=max(t);
def= zeros(n,3);
diffN=diff(N,1);
diffT=diff(t,1);
for i=1:1:n;
    diff(i,1)=N(i);
    if (i>1)
        diff(i,2)=diffN(1,i-1);
        diff(i,3)=diffT(1,i-1);
    end
end
for j=2:1:n;
    y(j-1)=log(-(diff(j,2)/diff(j,3))/diff(j,1));
    %prod = y(j-1)*t(i);
end
%Initialization
T2=0;
T=0;
Y=0;
TY = 0;
for i=2:1:n;
    T2 = T2 +(t(i))^2;
    T = T +(t(i));
    Y = Y + y(i-1);
    TY = TY +t(i)*y(i-1);
end
    T2 = T2/(n-1);
    T = T /(n-1);
    Y = Y /(n-1);
    TY = TY /(n-1);
    a = ((T2*Y)-(T*TY))/(T2-(T^2));
    b = ((TY)-(T*Y))/(T2-(T^2));
    fprintf('\n co-efficients problem 5 a');
    fprintf('\n a = %1.5X\n',a);
    fprintf('\n b = %1.5X\n',b);
%     plot(t,N,'b',t,d,'r');
    t = 2:1:n;
    z=a+b*t;
    plot(t,z,'r',t,y,'b')% The y and z are in logarithm scale which implies that it is a plot between Log of given data(Mortality) and year
    xlabel('t - Age');
    ylabel('z,y - Least Square fitting and given(Actual) exp in log scale');

%Absolute and relative errors:
for k=1:1:5;    %order of error:
    G(k) = 0;
    H(k) = 0;
for i=1:1:n-1;
    G(k) = G(k) + (z(i)-y(i))^k;
    H(k) = H(k) + (z(i)/(y(i)-1)^k);
end
G(k) = G(k)/(n-1);%Absoluite error
H(k) = H(k)/(n-1);%relative error
end
fprintf('\nAbsolute error upto order 5 (b)\n');
fprintf('\n%1.7X\n',G);
fprintf('\nRelative error upto order 5 (b)\n');
fprintf('\n%1.7X\n',H)