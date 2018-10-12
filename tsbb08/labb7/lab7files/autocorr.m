f = double(imread('skylt.tif'));
F = fftshift(fft2(ifftshift(f)));
conjF = conj(F);
SF = abs(F)^2;
rf = fftshift(ifft2(ifftshift(f)));
figure(1); plot(rf);