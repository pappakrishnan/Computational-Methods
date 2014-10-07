%Problem 3
% 1. To Generate 10 data points:
clear all;
i = 1:1:10;
x = i.*0.1;
y = 2+(x+(2*x.^2)).*sin(10*(x.^2));
save problem3.txt x y -ascii;
fprintf('\n Dataset of x problem3\n');
fprintf('\n %1.2X \n',x);
fprintf('\n Dataset of y problem3\n');
fprintf('\n %1.5X \n',y);

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
fprintf('Co-efficients = ');
fprintf('\n%1.5X\n',a);

%To generate Polynomial:
Y=0;
syms g;   % Using g in the place of 'x' to generate polynomial since x is used already.
for k=1:1:n;
    X=1;
    for i=1:1:k;
        X = X*(g-x(i));
    end
    X = X*a(k+1);
    Y = Y + X;
    clear X;
end
Z = a(1) + Y; % Required polynomial
%ezplot(Z,[.1,1]) % This can also be used to plot a polynomial between 2
%values[min,max] of independant variable.
r = linspace(.1,1,100);% creates 100 points for g which is stored in 'r'.
ZZ = subs (Z,{g},{r});%Substitutes the 100 values of g which is in 'r' in z to generate 100 values of ZZ to plot graph
plot(r,ZZ,'b',x,y,'ro-'); %Plot between generated polynomial with 100 values of x and provided data
xlabel('r,x - Gen 100 pts of x and provided 10pts of x respectively');
ylabel('ZZ,y - poly for 100 pts of x and 10 pts of x');

ans = subs(Z,{g},{0.34});
fprintf ('\nValue of y at (x=.34) = %1.5X\n',ans)

answer = subs(Z,{g},{0.55});
fprintf ('\nValue of y at (x=.55)for problem 3 = %1.5X\n',answer);

save problem3first.txt r ZZ -ascii % Saving the values of r and ZZ which are used to generate plot of polynomial in a text file.
save problem3last.txt x y -ascii % Saving the values of x and y, the provided data points























