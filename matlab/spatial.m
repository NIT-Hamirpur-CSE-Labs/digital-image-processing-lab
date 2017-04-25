I=imread('cameraman.png');
j=imresize(I,0.2);
subplot(1,2,1),imshow(I);
subplot(1,2,2),imshow(j);