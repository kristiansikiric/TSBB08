f = double(imread('foppa.tif'));

f = f - mean(mean(f));

F = fftshift(fft2(ifftshift(f)));
conjF = conj(F);
SF = abs(F).^2;
rf = fftshift(ifft2(ifftshift(SF)));
figure(1); mesh(rf);
[~,X] = max(max(rf))

rhox = rf(X,X+1)/rf(X,X);
rhoy = rf(X+1,X)/rf(X,X);
rho = (rhox + rhoy)/2
