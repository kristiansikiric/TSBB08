N=64;
averim = zeros(N,N);
center = size(averim,1)/2+1;
aver = [1 2 1; 2 4 2; 1 2 1] /16
averim(center-1:center+1, center-1:center+1) = aver;
AVERIM = fftshift(fft2(ifftshift(averim)));
figure(1);
subplot(1,2,1), mesh(-N/2:N/2-1, -N/2:N/2-1, real(AVERIM));
subplot(1,2,2), mesh(-N/2:N/2-1, -N/2:N/2-1, imag(AVERIM));

aver = [0 1 0; 1 -4 1; 0 1 0];
averim(center-1:center+1, center-1:center+1) = aver;
AVERIM = fftshift(fft2(ifftshift(averim)));
figure(2);
subplot(1,2,1), mesh(-N/2:N/2-1, -N/2:N/2-1, real(AVERIM));
subplot(1,2,2), mesh(-N/2:N/2-1, -N/2:N/2-1, imag(AVERIM));

aver = [1 0 -1; 2 0 -2; 1 0 -1]
averim(center-1:center+1, center-1:center+1) = aver;
AVERIM = fftshift(fft2(ifftshift(averim)));
figure(3);
subplot(1,2,1), mesh(-N/2:N/2-1, -N/2:N/2-1, real(AVERIM));
subplot(1,2,2), mesh(-N/2:N/2-1, -N/2:N/2-1, imag(AVERIM));

