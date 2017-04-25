A=imread('peppers.png');
B=rgb2gray(A);
C=double(B);

for i=1:size(C,1)-2
    for j=1:size(C,2)-2
        G=8*C(i+1,j+1)-C(i,j)-C(i+1,j)-C(i,j+1)-C(i+2,j+1)-C(i+2,j+2)-C(i,j+2)-C(i+2,j)-C(i+1,j+2);
        B(i,j)=B(i,j)+G;
    end
end

imshow(B);