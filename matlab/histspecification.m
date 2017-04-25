a=imread('cameraman.tif');
b=imread('kids.tif');

[m,n]=size(a);
[p,q]=size(b);
freqA=zeros(256,1);
freqB=zeros(256,1);
nA=0;
nB=0;

for i=1:m
    for j=1:n
        value=a(i,j);
        nA=nA+1;
        freqA(value+1)=freqA(value+1)+1;
    end
end

for i=1:p
    for j=1:q
        value=b(i,j);
        nB=nB+1;
        freqB(value+1)=freqB(value+1)+1;
    end
end

probA=zeros(256,1);
cumA=zeros(256,1);
cumB=zeros(256,1);
probB=zeros(256,1);

cumA(1)=freqA(1)/nA;
cumB(1)=freqB(1)/nB;

for i=1:255
     probA(i+1)=freqA(i+1)/nA;   
     cumA(i+1)=cumA(i)+probA(i+1);
end    


for i=1:255
     probB(i+1)=freqB(i+1)/nB;   
     cumB(i+1)=cumB(i)+probB(i+1);
end  

output=zeros(256,1);

for i=1:256
    for j=1:256
        if(cumB(j)-cumA(i)>=0)
            output(i)=output(i)+j;
            break;
        end
    end
end

B=zeros(m,n);
for i=1:m
    for j=1:n
        B(i,j)=output(a(i,j)+1);
        
    end
end
%B=imadd(a,-50);
subplot(1,3,1),imshow(a);
subplot(1,3,2),imshow(b);
subplot(1,3,3),imshow(B);


        
    