clc
clear all
format long;
a=input('Enter A String');
b=unique(a);
l1=length(a);
l2=length(b);
for i=1:l2
count(i)=0;
end
%Counts of each symbol in string
for i=1:l2
for j=1:l1
if(strcmp(b(i),a(j)))
count(i)=count(i)+1;
end
end
end
%total no of symbols
total=length(a);
for i=1:l2
p(i)=count(i)/total;
end
sum=0;
for i=1:l2
cp(i)=sum;
sum=cp(i)+p(i);
end
temp=cat(2,cp,1);
for i=1:length(temp)-1
interval(i,:)=temp(i:i+1);
end
%Encoding%
for i=1:l1
for j=1:l2
if a(i)==b(j)
c(i)=j;
end
end
end
lcurr=cp(1);
lnew=0;
tg=0;
wnew=0;
wcurr=interval(c(1),2)-interval(c(1),1);
for i=2:length(c);
lnew=lcurr+(wcurr*cp(c(i)));
wnew=wcurr*p(c(i));
lcurr=lnew;
wcurr=wnew;
end
tg=lnew+(wnew/2);

%decoding
interval
for j=1:length(c)
for i=1:length(b)
if (tg>=interval(i,1) && tg < interval(i,2))
d(j)=b(i);
tg= (tg-cp(i))/p(i);
end
end
end
decoded=d(1:length(c));
disp(tg);