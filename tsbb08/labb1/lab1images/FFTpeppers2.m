load peppersmall
im = peppersmall;
IM = fftshift(fft2(ifftshift(im)));
maxIM = max(max(abs(IM)));
aver = [1 2 1; 2 4 2; 1 2 1]/16;
aver3 = conv2(conv2(aver,aver,'full'),aver,'full');
% AVER = fftshift(fft2(ifftshift(aver)));
% AVER3 = AVER*AVER*AVER;
%aver3 = fftshift(ifft2(ifftshift(AVER3)));
aver3im = 0*im;
center = size(im,1)/2+1;
aver3im(center-3:center+3, center-3:center+3) = aver3;
AVER3IM = fftshift(fft2(ifftshift(aver3im)));
IMCONV = IM.*AVER3IM;
im = fftshift(ifft2(ifftshift(IMCONV)));
figure(3); colormap gray;
subplot(1,2,1); imagesc(im);
axis image; title('im'); colorbar('SouthOutside')
subplot(1,2,2); imagesc(abs(IMCONV), [0 0.01*maxIM]);
axis image; title('abs(F[imconv])'); colorbar('SouthOutside')