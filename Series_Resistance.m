clear all
close all
clc
n=10;
V1 = 0;
Vn = 1;
for i=1:2
for l = 1:20
    p1 = 0.05*l;
    p2 = 1-p1;
R = randsrc(1,n,[1 10;p1 p2]);   
B=zeros(3,n-1);
    for j = 1:n-1        
        if (j~=n-1)
            B(1,j)=(-1/R(j+1));
        else
            B(1,j)=0;
        end
        B(2,j)=((1/R(j))+(1/R(j+1)));
       if (j~=1) 
            B(3,j)=(-1/R(j));
       else
            B(3,j)=0;
       end        
    end
b = zeros(n-1,1);
b(1,1) = V1/R(1,1);
b(n-1,1) = Vn/R(1,n);

for k = 2:n-1
   B(2,k)=B(2,k)-B(1,k-1)*(B(3,k)/B(2,k-1));
   b(k,1)=b(k,1) - b(k-1,1)*(B(3,k)/B(2,k-1));
end
   %Back Substitution:
V(n-1,1) = b(n-1,1)/B(2,n-1);
for k = n-2:-1:1
     V(k,1)= (b(k,1)-B(1,k)* V(k+1,1))/B(2,k);
end
V(n) = 1;
H = double(V);
J(l) = H(1)/R(1);
figure(i);
plot(J,'.r');
hold on;
Re = sum(R);
current = 1/Re;
J1(l)=current;
Q = double(J1);
plot(Q,'ob');
hold off;
end
n=10000;
end