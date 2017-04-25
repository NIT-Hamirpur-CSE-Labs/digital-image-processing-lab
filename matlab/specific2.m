A=imread('cameraman.tif');
B=imread('kids.tif');
C=imhistmatch(A,B);
imshow(C);