im = imread('nuf0b.tif');
histo = hist(im(:),[0:255]);
T = mean(mean(im))
%Tmid = 50;
Tmid = mid_way(histo, T)
imTmid = im<=Tmid;
figure(1)
colormap(gray(256))
subplot(2,2,1), imagesc(im, [0 255]);
axis image; colorbar
title('original image');
subplot(2,2,2), plot(0:255, histo, '.-r');
axis tight; grid
title('histogram');
subplot(2,2,3), imagesc(imTmid, [0 1]);
axis image; colorbar
title('mid-way thresholded image');

%%

im = imread('nuf0b.tif');
histo = hist(im(:),[0:255]);
T = Tmid
Tmid = leastError(histo, T)
imTmid = im<=Tmid;
figure(2)
colormap(gray(256))
subplot(2,2,1), imagesc(im, [0 255]);
axis image; colorbar
title('original image');
subplot(2,2,2), plot(0:255, histo, '.-r');
axis tight; grid
title('histogram');
subplot(2,2,3), imagesc(imTmid, [0 1]);
axis image; colorbar
title('least error thresholded image');