im = double(imread('blod256.tif'));
pattern = im(25:25+19, 18:18+19);
fact = 0.5;
rescorr = corr(im, pattern);
figure(1)
colormap(gray(256))
subplot(2,2,1), imagesc(im, [0 255]);
axis image; title('original image'); colorbar;
subplot(2,2,2), imagesc(pattern, [0 255]);
axis image; title('pattern'); colorbar;
subplot(2,2,3), imagesc(rescorr);
axis image; title('result corr'); colorbar;
subplot(2,2,4), imagesc(rescorr>(max(rescorr(:))*fact));
axis image; title('thresh corr'); colorbar;

%im = double(imread('clic.tif'));
%pattern = im(33:33+19, 18:18+19);
%fact = 0.99;
rescorr = corrn(im, pattern);
figure(2)
colormap(gray(256))
subplot(2,2,1), imagesc(im, [0 255]);
axis image; title('original image'); colorbar;
subplot(2,2,2), imagesc(pattern, [0 255]);
axis image; title('pattern'); colorbar;
subplot(2,2,3), imagesc(rescorr);
axis image; title('result corr'); colorbar;
subplot(2,2,4), imagesc(rescorr>(max(rescorr(:))*fact));
axis image; title('thresh corr'); colorbar;

%im = double(imread('clic.tif'));
%pattern = im(33:33+19, 18:18+19);
%fact = 0.99;
rescorr = corrdc(im, pattern);
figure(3)
colormap(gray(256))
subplot(2,2,1), imagesc(im, [0 255]);
axis image; title('original image'); colorbar;
subplot(2,2,2), imagesc(pattern, [0 255]);
axis image; title('pattern'); colorbar;
subplot(2,2,3), imagesc(rescorr);
axis image; title('result corr'); colorbar;
subplot(2,2,4), imagesc(rescorr>(max(rescorr(:))*fact));
axis image; title('thresh corr'); colorbar;

%im = double(imread('clic.tif'));
%pattern = im(33:33+19, 18:18+19);
%fact = 0.99;
rescorr = corrc(im, pattern);
figure(4)
colormap(gray(256))
subplot(2,2,1), imagesc(im, [0 255]);
axis image; title('original image'); colorbar;
subplot(2,2,2), imagesc(pattern, [0 255]);
axis image; title('pattern'); colorbar;
subplot(2,2,3), imagesc(rescorr);
axis image; title('result corr'); colorbar;
subplot(2,2,4), imagesc(rescorr>(max(rescorr(:))*fact));
axis image; title('thresh corr'); colorbar;