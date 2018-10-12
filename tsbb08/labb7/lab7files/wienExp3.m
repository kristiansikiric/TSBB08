f = double(imread('skylt.tif')); % load image
h0 = ones(5,5)/25;               % a suitable filter
h1 = 1;
h2 = ones (7,7)/49;          % a big filter
h3 = ones (11,11)/121;       % a very big filter
h4 = [0 0 0 0 0; 1 1 1 1 1; 0 0 0 0 0]/5
g = circconv(f,h4);              % convolve
snr = 40;
h = addnoise(g,snr);             % add noise with SNR=20dB
rho = 0.80;
r = 1.0;
fhat=wiener(h,h4,snr,rho,r);     % Wiener filter
figure(1), colormap(gray)
subplot(2,2,1), imagesc(f,[0 255]), axis image
title('original image'); colorbar
subplot(2,2,2), imagesc(h,[0 255]), axis image
title('degraded image'); colorbar
subplot(2,2,3), imagesc(fhat,[0 255]), axis image
title('restored image'); colorbar