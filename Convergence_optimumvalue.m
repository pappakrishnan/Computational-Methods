clear all;
format long;
for i=1:1:19
    w(i) = 0.1*i;
end
n = 100;
q = 0.5;
m= 100;
A = zeros(n,n);
X = zeros(n,m+1);
% To generate A Matrix:
   
for i=1:1:n
    A(i,i) = (2*q)/(1-q);
      for j=1:1:n
        if (i~=j)
            A(i,j) = q^abs(i-j);
        end
      end 
end

%To generate B matrix:
for i = 1:1:n
b(i) = sin(i*pi/n);
end
 
%Initial Value of X
% for i=1:1:n
%     X(i,1) = b(i)/A(i,i);
% end
for i=1:1:n
    X(i,1) =1;
end

for l=1:1:19
for t = 1:1:m
    for i = 1:1:n        
     sum = 0;         
     sum1 =0;
     if (i >1)
        for s = 1:1:i-1
         sum = sum + (A(i,s).*X(s,t+1));
        end
     end
        for s1 = i:1:n
         sum1 = sum1 + (A(i,s1).*X(s1,t));         
        end  
    R(i) = (b(i) - sum1 - sum);
    X(i,t+1) =X(i,t)+ ((R(i).*w(l))/A(i,i)); 
    end
end
%Convergence Tolerance
optimum =0;
t = zeros(1,m);
for t = 1:1:m
    tol(t) = 0;    
    for i=1:1:n
    tol(t) = tol(t) + abs(X(i,t+1)-X(i,t));
    end
    if (tol(t)<=1e-8 && optimum==0)
        optimum=t;
    end
end
opt(l)= optimum;
t = 1:1:m;
%plot(t,tol);
%figure(l)
figure(1);
plot(t,tol);
hold on;
end
hold off;
l=1:1:19;
figure (2);
plot(l,opt,'o')
% t = 1:1:m;
% [X,Y]=meshgrid(t,tol);
% contour(X,Y,w);