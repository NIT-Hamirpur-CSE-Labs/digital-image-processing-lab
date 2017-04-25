img=imread('cameraman.png');
a=max(img(:));
b=min(img(:));
img1=(img-b).*((255)/(a-b));
subplot(1,2,1),imshow(img);
subplot(1,2,2),imshow(img1);