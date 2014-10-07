%Problem 3
% 1. To Generate 10 data points:
clear all;
i = 1:1:10;
x = i.*0.1;
y = 2+(x+(2*x.^2)).*sin(10*(x.^2));

% 2. Difference method with equal interval:
h = x(2)-x(1); %Value of the interval
DP = max(i); %No.Of.Data Points
n = DP-1; %Order of the polynomial
m=1; %Inialization of the counter
z =1;
newton=zeros(DP,DP);%To create a newton matrix with all elements as '0'
for i=1:1:DP;
  newton(i,1)=y(i);%First column of newton table
end
for j = 2:1:DP;%Second to last column of newton table
    z =1;
    diff = diff(y,m);%diff-->matrix of one row with DP-m columns;m-->(Column number-1) in newton matrix or order of difference.
   for i = 1:1:DP-m;       
       newton(i,j)=diff(1,z);%replacing the corresponding column of Newton table with diff matrix
       z = z+1;
   end
    m=m+1;
    clear diff;%clearing the diff matrix value
end

%Computing the Co-efficients:
for j=1:1:DP;
    a(j) = newton(1,j)/(factorial(j-1)*(h^(j-1)));%computing the co-efficients
end
fprintf('\n%1.5X\n',a);

Y=0;
syms g;
for k=1:DP;
    for i=1:k;
        X(1)=1;
        X(k) = X(k)*(g-x(i));
    end
    X(k) = X(k)*a(k+1);
    Y = Y +X(k);
end
Z = a(1) + y
        





























