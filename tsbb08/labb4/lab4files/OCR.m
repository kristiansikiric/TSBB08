% Read the image and cast it to double
% ====================================
nuf = double(imread('nuf2a.tif'));
% Extend the image
% ================
tmp = [nuf(:,64:-1:1) nuf nuf(:,128:-1:65)];
nufextend = [tmp(64:-1:1,:); tmp; tmp(128:-1:65,:)];
% Make a Gaussian filter
% ======================
sigma=25;
lpH=exp(-0.5*([-64:64]/sigma).^2);
lpH=lpH/sum(lpH); % Horizontal filter
lpV=lpH';         % Vertical filter
% Convolve in the horizontal and vertical direction
% =================================================
nufblur = conv2(nufextend, lpH, 'valid');
nufblur = conv2(nufblur, lpV, 'valid');
% Make a new image
% ================
nuf = nuf - nufblur + 128;
figure(1)
colormap(gray(256))
subplot(2,2,1),
imagesc(nufextend, [0 255])
axis image; colorbar
title('extended image')
subplot(2,2,2),
plot(-64:64, lpH, '.-r')
axis tight; title('Gaussian kernel')
subplot(2,2,3), imagesc(nufblur, [0 255])
axis image; colorbar
title('blurred image image')
subplot(2,2,4), imagesc(nuf, [0 255])
axis image; colorbar
title('new image')

SE8 = ones(3,3);
nuf = imdilate(nuf, SE8);
nuf = imerode(nuf, SE8);
nuf = imerode(nuf, SE8);
nuf = imdilate(nuf, SE8);

histo = hist(nuf(:),[0:255]);
T =mean(mean(nuf));
Tmid = mid_way(histo, T)
T = Tmid 
Tmid = leastError(histo, T)
nufTmid = nuf<=Tmid;
figure(2)
colormap(gray(256))
subplot(2,2,1), imagesc(nuf, [0 255]);
axis image; colorbar
title('original image');
subplot(2,2,2), plot(0:255, histo, '.-r');
axis tight; grid
title('histogram');
subplot(2,2,3), imagesc(nufTmid, [0 1]);
axis image; colorbar
title('least error thresholded image');

skel = bwmorph(nufTmid,'skel',Inf);
skel = bwmorph(skel,'shrink',8);

CC = bwconncomp(skel);
ImBig = 0*skel;
numPixels = cellfun(@numel,CC.PixelIdxList);
[biggest,idx] = max(numPixels);
ImBig(CC.PixelIdxList{idx}) = 1;

figure(3); colormap(gray(256))
imagesc(ImBig); axis image;

ocrdecide(ImBig,8)