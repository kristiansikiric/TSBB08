im = double(imread('circle.tif'));
figure(1)
colormap(gray(256))
cd = [1 0 -1]/2;
imdx = conv2(im,cd,'same');
imdy=conv2(im,cd','same');


gradient = sqrt(imdx.^2 + imdy.^2);
subplot(1, 2, 1), imagesc(gradient,[0 160])
axis image; axis off; title('simplemagngrad'); colorbar


im = double(imread('circle.tif'));
figure(1)
colormap(gray(256))
sobelx = [1 0 -1;2 0 -2;1 0 -1]/8;
imsx = conv2(im,sobelx,'same');
imsy=conv2(im,sobelx','same');

gradient = sqrt(imsx.^2 + imsy.^2);
subplot(1, 2, 2), imagesc(gradient,[0 160])
axis image; axis off; title('sobelmagngrad'); colorbar
%%
im = double(imread('circle.tif'));
figure(2)
colormap(gray(256))
cd = [1 0 -1]/2;
imdx = conv2(im,cd,'same');
imdy=conv2(im,cd','same');


gradient = sqrt(imdx.^2 + imdy.^2);
subplot(1, 2, 1), imagesc(gradient,[100 160])
axis image; axis off; title('simplemagngrad'); colorbar


im = double(imread('circle.tif'));
colormap(gray(256))
sobelx = [1 0 -1;2 0 -2;1 0 -1]/8;
imsx = conv2(im,sobelx,'same');
imsy=conv2(im,sobelx','same');

gradient = sqrt(imsx.^2 + imsy.^2);
subplot(1, 2, 2), imagesc(gradient,[100 160])
axis image; axis off; title('sobelmagngrad'); colorbar