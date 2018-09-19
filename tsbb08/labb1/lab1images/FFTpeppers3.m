load peppersmall
im = peppersmall;
IM = fftshift(fft2(ifftshift(im)));

half = (size(im,1)-1)/2;
[u,v] = meshgrid(-ceil(half):floor(half),-ceil(half):floor(half));
IDEALFILT = sqrt(u.^2+v.^2) < 16;

aver = [1 2 1; 2 4 2; 1 2 1]/16;
aver3 = conv2(conv2(aver,aver,'full'),aver,'full');
aver3im = 0*im;
center = size(im,1)/2+1;
aver3im(center-3:center+3, center-3:center+3) = aver3;
AVER3IM = fftshift(fft2(ifftshift(aver3im)));
IMCONV = IM.*IDEALFILT;
im = fftshift(ifft2(ifftshift(IMCONV)));
figure(4); colormap gray;
subplot(1,2,1); imagesc(im);
axis image; title('im'); colorbar('SouthOutside')
subplot(1,2,2); imagesc(abs(IMCONV), [0 0.01*maxIM]);
axis image; title('abs(F[imconv])'); colorbar('SouthOutside')