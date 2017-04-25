I = imread('cameraman.tif');
I =im2bw(I);
[y,x]=find(I);
[sy,sx]=size(I);
imshow(I);
totalpix = length(x);
maxrho = round(sqrt(sx^2 + sy^2));
HM = zeros(2*maxrho,180);
for cnt = 1:totalpix
cnt2 = 1;
for theta = -pi/2:pi/180:pi/2-pi/180
rho = round(x(cnt).*cos(theta) + y(cnt).*sin(theta));
HM(rho+maxrho,cnt2) = HM(rho+maxrho,cnt2) + 1;
cnt2 = cnt2 + 1;
end
end

theta = rad2deg(-pi/2:pi/180:pi/2-pi/180);
rho = -maxrho:maxrho-1;
imshow(uint8(HM),[],'xdata',theta,'ydata',rho);
xlabel('\theta'),ylabel('\rho')
axis on, axis normal;
title('Hough Matrix');