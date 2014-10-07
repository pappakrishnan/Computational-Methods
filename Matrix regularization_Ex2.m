
clear all;
format long;
n = 100;
q = 0.5;
a = zeros(n,n);
% To generate A Matrix:
for i=1:1:n
    a(i,i) = (2*q)/(1-q);
      for j=1:1:n
        if (i~=j)
            a(i,j) = q^abs(i-j);
        end
      end 
end

for i = 1:1:n
b(i) = sin (i*pi/n);
end

for k = 1:n-1
% elimination of column k
if (abs(a(k,k))>10^-6)
for i= k+1:n
coef=a(i,k)/a(k,k);a(i,k)=0;
for j = k+1:n
a(i,j)=a(i,j)-a(k,j)*coef;
end
b(i)=b(i)-b(k)*coef;
end
else
disp('The pivot is zero');
end
end
% Back substitution
b(n)=b(n)/a(n,n);
coef=b(n);
for i= n-1:-1:1
coef=b(i);
for j=i+1:n
coef=coef-a(i,j)*b(j);
end
b(i)=coef/a(i,i);
end