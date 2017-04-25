image=imread('cameraman.png');
rmin=180,rmax=1000;
[h,b,y]=size(image);
y=1;
s=zeros(h,b);

for i=1:h
    for j=1:b
        if(rmin<image(i,j)&&image(i,j)<rmax)
            s(i,j)=image(i,j);
        else
            s(i,j)=0;
        end;
    end;
end;
subplot(1,2,1),imshow(uint8(itemp));
subplot(1,2,2),imshow(uint8(s));
            

