a=imread('cameraman.png');
[b,map1]=gray2ind(a,2^4);
nimage=ind2gray(b,map1);
subplot(1,2,1),imshow(a);
subplot(1,2,2),imshow(nimage);