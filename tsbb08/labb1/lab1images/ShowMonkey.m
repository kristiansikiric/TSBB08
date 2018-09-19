im = double(imread('baboon.tif'));
figure(1)
colormap(gray(256))
subplot(1,2,1),imagesc(im,[0 255])
axis image; title('original image')
colorbar('SouthOutside')

subplot(1,2,2),imagesc(im,[50 200])
axis image; title('Manipulated image')
colorbar('SouthOutside')
%%
min(min(im)) % Min: 2
max(max(im)) % Max: 207
%%
mycolormap0 = gray(256);
mycolormapR = mycolormap0;
mycolormapR(201:256,:,:) = ones(56,1)*[1 0 0];
mycolormap0
%Range from 0 to 1 with floating points 
%instead of 0 to 255 with integers
mycolormapR
colormap(mycolormapR)
% It makes all pixel with values grater than 200 red.
%%
figure(2)
mycolormapC = mycolormap0;
mycolormapC(1:51,:,:) = ones(51,1)*[0 0 1];
mycolormapC(201:256,:,:) = ones(56,1)*[0 1 0];
colormap(mycolormapC)
imagesc(im,[0 255])
axis image; title('image with custom colormap')
colorbar('SouthOutside')
%%
colormap('jet') %Cyan/Blue