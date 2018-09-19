im = double(imread('circle.tif'));
figure(1)
colormap(gray(256))
subplot(2,2,1), imagesc(im, [0 255])
axis image; axis off; title('original image'); colorbar
cd = [1 0 -1]/2;
imdx = conv2(im,cd,'same');
subplot(2,2,3), imagesc(imdx, [-128 127])
axis image; axis off; title('imdx image'); colorbar
imdy=conv2(im,cd','same');
subplot(2,2,4), imagesc(imdy,[-128 127])
axis image; axis off; title('imdy image'); colorbar

gradient = sqrt(imdx.^2 + imdy.^2);
subplot(2, 2, 2), imagesc(gradient,[0 127])
axis image; axis off; title('Magnitude of the gradient'); colorbar