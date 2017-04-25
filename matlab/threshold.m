a=imread('cameraman.png');
disp(size(a));
[h,bt,s]=size(a);
s=1;
b=zeros(h,bt);
for i=1:h
    for j=1:bt
        int=a(i,j);
        if int>=120
            b(i,j)=255;
        else
            b(i,j)=0;
        end;
    end;
end;

imshow(b);
        