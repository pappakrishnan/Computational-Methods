clear all;
format long;
A = [2 -1 1; -1 11 2;2 3 1];
%To Find Upper Triangular Matrix:
b = [2 1 2];


for j = 1:1:3
    B = A(j,:);
    for i = 1:1:3
        if (i>j)
        temp = A(i,j);
        temp1 = -temp/A(j,j);
        C = B.*temp1;
        D = b(j)*temp1;
        A(i,:)=A(i,:)+C;
        b(i) = b(i)+D;
        end
    end
end
%To generate b Matrix:
A
b
%Back Subtitution:
 for i=3:-1:1
    z = 0;
    if (i < 3)
        for j = i+1:1:3
            z = z + x(j)*A(i,j)
        end
    end
    x(i) = (b(i) - z)./A(i,i);
end