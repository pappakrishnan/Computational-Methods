clear all;
for m = 1:1:5
A=zeros(m,m);
for i=1:m
    for j=1:m
        if (i==j)
            A(i,j) = 3;
        else if (j == i+1 || j == i-1)
                A(i,j) = -1;
            end
        end        
    end
end

syms x;
B = eye(m,m).*x;
C = A - B;
F (m) = det(C);
ezplot(F(m));
grid on;
hold on;
end
hold off

root1= solve(F(1));
root2= solve(F(2));
root3= solve(F(3));
root4= solve(F(4));
root5= solve(F(5));

count = 0;    
for i=1:1;
   h =double(root1(i));
    if(h <= 3.2)
        count = count +1;
    end
end
fprintf('\n The number of eigen values less than 3.2 when k = 1 is %X',count);
count = 0;    
for i=1:2;
    h =double(root2(i));
    if(h<= 3.2)
        count = count +1;
    end
end
fprintf('\n The number of eigen values less than 3.2 when k = 2 is %X',count);
count = 0;    
for i=1:3;
    h =double(root3(i));
    if (h<=3.2)
        count = count +1;
    end
end
fprintf('\n The number of eigen values less than 3.2 when k = 3 is %X',count);
count = 0;    
for i=1:4;
    h =double(root4(i));
    if (h< 3.2)
        count = count +1;
    end
end
fprintf('\n The number of eigen values less than 3.2 when k = 4 is %X',count);
count = 0;    
for i=1:5;
    h =double(root5(i));
    if (h < 3.2)
        count = count +1;
    end
end
fprintf('\n The number of eigen values less than 3.2 when k = 5 is %X',count);

