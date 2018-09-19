im = double(imread('baboon.tif'));
figure(1)
colormap(gray(256))
subplot(1,2,1), imagesc(im,[0 255])
axis image; title('original image')
colorbar('SouthOutside')

aver = [1 2 1; 2 4 2; 1 2 1] /16 %Sum of matrixvalue = 16
imaver  = conv2(im,aver,'same');
%Same gives the central part of the convolution
%with the same size of im
%Full gives the full convoluted matrix
%Valid gives a smaller image

subplot(1,2,2), imagesc(imaver,[0 255])
axis image; title('Blurred image')
colorbar('SouthOutside') %Image gets blurred
%%
imaver  = conv2(imaver,aver,'same');
imaver  = conv2(imaver,aver,'same');
subplot(1,2,2), imagesc(imaver,[0 255])
axis image; title('3 times convolved')
colorbar('SouthOutside')
%Image gets blurrier
%%
tmp = [1 2 0; 1 3 0; 1 4 1]
tmp1 = [1 2 0; 0 2 0; 0 1 3]
conv2(tmp,tmp1)
