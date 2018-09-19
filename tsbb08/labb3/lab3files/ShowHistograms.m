binvect = [0:1:255];
load clic.mat
histo = hist(clic(:), binvect);
figure(1)
colormap(gray(256))
subplot(2,1,1), imagesc(clic, [0 255]);
axis image; title('light image'); colorbar
subplot(2,1,2), plot(binvect, histo, '.-b');
axis tight; title('histogram')

load blod256.mat
histo = hist(blod256(:), binvect);
figure(2)
colormap(gray(256))
subplot(2,1,1), imagesc(blod256, [0 255]);
axis image; title('light image'); colorbar
subplot(2,1,2), plot(binvect, histo, '.-b');
axis tight; title('histogram')

Im = double(imread('baboon.tif'));
histo = hist(Im(:), binvect);
figure(3)
colormap(gray(256))
subplot(2,1,1), imagesc(Im, [0 255]);
axis image; title('light image'); colorbar
subplot(2,1,2), plot(binvect, histo, '.-b');
axis tight; title('histogram')

Im = double(imread('baboon.tif'));
A = 17/10;
B = 85;
ImT = A*Im-B;
histo = hist(ImT(:), binvect);
figure(4)
colormap(gray(256))
subplot(2,1,1), imagesc(ImT, [0 255]);
axis image; title('light image'); colorbar
subplot(2,1,2), plot(binvect, histo, '.-b');
axis tight; title('histogram')