clear all;
close all;
clc;

%Reading image
a=imread('cameraman.tif');
figure,imshow(a)

%converting an image to grayscale
I=rgb2gray(a);

%size of the image
[m,n]=size(I);
Totalcount=m*n;

%variables using to find the probability
cnt=1;
sigma=0;

%computing the cumulative probability.
for i=0:255
k=I==i;
count(cnt)=sum(k(:))

%pro array is having the probabilities
pro(cnt)=count(cnt)/Totalcount;
sigma=sigma+pro(cnt);
cumpro(cnt)=sigma;
cnt=cnt+1;
end;


%Symbols for an image
symbols = [0:255];

%Huffman code Dictionary
dict = huffmandict(symbols,pro);

%function which converts array to vector
vec_size = 1;
for p = 1:m
for q = 1:n
newvec(vec_size) = I(p,q);
vec_size = vec_size+1;
end
end

%Huffman Encodig
hcode = huffmanenco(newvec,dict);

%Huffman Decoding
dhsig1 = huffmandeco(hcode,dict);

%convertign dhsig1 double to dhsig uint8
dhsig = uint8(dhsig1);

%vector to array conversion
dec_row=sqrt(length(dhsig));
dec_col=dec_row;

%variables using to convert vector 2 array
arr_row = 1;
arr_col = 1;
vec_si = 1;

for x = 1:m
for y = 1:n
back(x,y)=dhsig(vec_si);
arr_col = arr_col+1;
vec_si = vec_si + 1;
end
arr_row = arr_row+1;
end


%converting image from grayscale to rgb
[deco, map] = gray2ind(back,256);
RGB = ind2rgb(deco,map);
imwrite(RGB,'decoded.JPG');