%% Example 1
Im = double(imread('logo.tif'));  % load image
T = [1 -1/3; 0 1];
theta = pi/4;
figure(1); colormap gray;
tic
shearIm = shearimage(Im,T);
toc
subplot(121); imagesc(Im); axis image; colorbar;
subplot(122); imagesc(shearIm); axis image; colorbar;
tic
shearIm = shearimageFast(Im,T);
toc
%% Example 2 (3.1)
Im = double(imread('logo.tif'));  % load image
IM = fftshift(fft2(ifftshift(Im)));

figure(2); colormap gray;
rotIm = rotateimage(Im, pi/6, 'nearest');
subplot(121); imagesc(rotIm); axis image;
nIm = rotateimage(rotIm,-pi/6,'nearest');
subplot(122); imagesc(nIm); axis image;

[Ny, Nx] = size(Im);
N = min(min(Nx,Ny));
[x,y] = meshgrid(-ceil((Nx-1)/2):floor((Nx-1)/2), ...
-ceil((Ny-1)/2):floor((Ny-1)/2));
mask = (x.^2 + y.^2)<((N-1)/2)^2;
Im = Im.*mask;

figure(3); colormap gray;
rotIm = rotateimage(Im, pi/6, 'nearest');
subplot(121); imagesc(rotIm); axis image;
nIm = rotateimage(rotIm,-pi/6,'nearest');
subplot(122); imagesc(nIm); axis image;
figure(4); colormap gray;
imagesc(nIm-Im); axis image; axis off; colorbar;
title('nearest')

sum(sum((nIm-Im).*(nIm-Im)))
%%
frotIm = fftshift(fft2(ifftshift(rotIm)));
fIm = fftshift(fft2(ifftshift(Im)));
fnIm = fftshift(fft2(ifftshift(nIm)));
fdiff = fftshift(fft2(ifftshift(nIm-Im)));

figure(5); colormap gray;
subplot(121);imagesc(log(1+abs(fnIm))); axis off;
subplot(122);imagesc(log(1+abs(fIm))); axis off;

figure(6); colormap gray;
subplot(131); imagesc(log(1+abs(IM))); axis image;
title('original')
subplot(132); imagesc(log(1+abs(frotIm))); axis image;
title('rotated')
subplot(133); imagesc(log(1+abs(fnIm))); axis image;
title('rotated back')

figure(7); colormap gray;
subplot(121);imagesc(log(1+abs(fnIm-fIm))); axis image; axis off;

N = size(fIm)
sum(sum((fIm-fnIm).*conj(fIm-fnIm)))/(N(1)*N(2))

subplot(122);imagesc(abs(fnIm-fIm)./abs(fnIm),[0 2]); axis image; axis off;

%% 3.2
Im = double(imread('logo.tif'));  % load image
IM = fftshift(fft2(ifftshift(Im)));

figure(8); colormap gray;
rotIm = rotateimage(Im, pi/6, 'bilinear');
subplot(121);imagesc(rotIm); axis image; colorbar;
nIm = rotateimage(rotIm,-pi/6,'bilinear');
subplot(122); imagesc(nIm); axis image; colorbar;

[Ny, Nx] = size(Im);
N = min(min(Nx,Ny));
[x,y] = meshgrid(-ceil((Nx-1)/2):floor((Nx-1)/2), ...
-ceil((Ny-1)/2):floor((Ny-1)/2));
mask = (x.^2 + y.^2)<((N-1)/2)^2;
Im = Im.*mask;

figure(9); colormap gray;
rotIm = rotateimage(Im, pi/6, 'bilinear');
subplot(121); imagesc(rotIm); axis image;
nIm = rotateimage(rotIm,-pi/6,'bilinear');
subplot(122); imagesc(nIm); axis image;
figure(10); colormap gray;
imagesc(nIm-Im); axis image; axis off;
title('bilinear')

sum(sum((nIm-Im).*(nIm-Im)))
%%
frotIm = fftshift(fft2(ifftshift(rotIm)));
fIm = fftshift(fft2(ifftshift(Im)));
fnIm = fftshift(fft2(ifftshift(nIm)));
fdiff = fftshift(fft2(ifftshift(nIm-Im)));

figure(11); colormap gray;
subplot(121);imagesc(log(1+abs(fnIm))); axis off;
subplot(122);imagesc(log(1+abs(fIm))); axis off;

figure(12); colormap gray;
subplot(131); imagesc(log(1+abs(IM))); axis image;
title('original')
subplot(132); imagesc(log(1+abs(frotIm))); axis image;
title('rotated')
subplot(133); imagesc(log(1+abs(fnIm))); axis image;
title('rotated back')

 figure(13); colormap gray;
 subplot(121);imagesc(log(1+abs(fdiff))); axis image; axis off; colorbar;
 
 N = size(fIm)
 sum(sum((fIm-fnIm).*conj(fIm-fnIm)))/(N(1)*N(2))
 
 subplot(122);imagesc(abs(fnIm-fIm)./abs(fnIm),[0 2]); axis image;
 
 %% 3.3
Im = double(imread('logo.tif'));  % load image
IM = fftshift(fft2(ifftshift(Im)));

figure(14); colormap gray;
rotIm = rotateimage(Im, pi/6, 'bicubic');
subplot(121);imagesc(rotIm); axis image;
nIm = rotateimage(rotIm,-pi/6,'bicubic');
subplot(122); imagesc(nIm); axis image;

[Ny, Nx] = size(Im);
N = min(min(Nx,Ny));
[x,y] = meshgrid(-ceil((Nx-1)/2):floor((Nx-1)/2), ...
-ceil((Ny-1)/2):floor((Ny-1)/2));
mask = (x.^2 + y.^2)<((N-1)/2)^2;
Im = Im.*mask;

figure(15); colormap gray;
rotIm = rotateimage(Im, pi/6, 'bicubic');
subplot(121); imagesc(rotIm); axis image;
nIm = rotateimage(rotIm,-pi/6,'bicubic');
subplot(122); imagesc(nIm); axis image;
figure(16); colormap gray;
imagesc(nIm-Im); axis image; axis off;
title('bicubic4')

sum(sum((nIm-Im).*(nIm-Im)))
%%
frotIm = fftshift(fft2(ifftshift(rotIm)));
fIm = fftshift(fft2(ifftshift(Im)));
fnIm = fftshift(fft2(ifftshift(nIm)));
fdiff = fftshift(fft2(ifftshift(nIm-Im)));

figure(17); colormap gray;
subplot(121);imagesc(log(1+abs(fnIm))); axis off;
subplot(122);imagesc(log(1+abs(fIm))); axis off;

figure(18); colormap gray;
subplot(131); imagesc(log(1+abs(IM))); axis image;
title('original')
subplot(132); imagesc(log(1+abs(frotIm))); axis image;
title('rotated')
subplot(133); imagesc(log(1+abs(fnIm))); axis image;
title('rotated back')

 figure(19); colormap gray;
 subplot(121);imagesc(log(1+abs(fdiff))); axis image; axis off; colorbar;
 
 N = size(fIm)
 sum(sum((fIm-fnIm).*conj(fIm-fnIm)))/(N(1)*N(2))
 
 subplot(122);imagesc(abs(fnIm-fIm)./abs(fnIm),[0 2]); axis image;
 
 %% 3.4
 
Im = double(imread('logo.tif'));  % load image
IM = fftshift(fft2(ifftshift(Im)));

figure(20); colormap gray;
rotIm = rotateimage(Im, pi/6, 'bicubic16');
subplot(121);imagesc(rotIm, [0 1]); axis image;
nIm = rotateimage(rotIm,-pi/6,'bicubic16');
subplot(122); imagesc(nIm); axis image;

[Ny, Nx] = size(Im);
N = min(min(Nx,Ny));
[x,y] = meshgrid(-ceil((Nx-1)/2):floor((Nx-1)/2), ...
-ceil((Ny-1)/2):floor((Ny-1)/2));
mask = (x.^2 + y.^2)<((N-1)/2)^2;
Im = Im.*mask;

figure(21); colormap gray;
rotIm = rotateimage(Im, pi/6, 'bicubic16');
subplot(121); imagesc(rotIm); axis image;
nIm = rotateimage(rotIm,-pi/6,'bicubic16');
subplot(122); imagesc(nIm); axis image;
figure(22); colormap gray;
imagesc(nIm-Im); axis image; axis off;
title('bicubic16')

sum(sum((nIm-Im).*(nIm-Im)))

%%
frotIm = fftshift(fft2(ifftshift(rotIm)));
fIm = fftshift(fft2(ifftshift(Im)));
fnIm = fftshift(fft2(ifftshift(nIm)));
fdiff = fftshift(fft2(ifftshift(nIm-Im)));

figure(23); colormap gray;
subplot(121);imagesc(log(1+abs(fnIm))); axis image;
subplot(122);imagesc(log(1+abs(fIm))); axis image;

figure(24); colormap gray;
subplot(131); imagesc(log(1+abs(IM))); axis image;
title('original')
subplot(132); imagesc(log(1+abs(frotIm))); axis image;
title('rotated')
subplot(133); imagesc(log(1+abs(fnIm))); axis image;
title('rotated back')

 figure(25); colormap gray;
 subplot(121);imagesc(log(1+abs(fdiff))); axis image; axis off;
 
 N = size(fIm)
 sum(sum((fIm-fnIm).*conj(fIm-fnIm)))/(N(1)*N(2))
 
 subplot(122);imagesc(abs(fnIm-fIm)./abs(fnIm),[0 2]); axis image;

 
 %% 3.5
 Im = double(imread('baboon.tif'));
 
figure(26); colormap gray;
rotIm16 = rotateimage(Im, pi/6.1, 'bicubic16');
rotIml = rotateimage(Im, pi/6.1, 'bilinear');
rotImn = rotateimage(Im, pi/6.1, 'nearest');
for x = 1:10 
    rotIm16 = rotateimage(rotIm16, pi/6.1, 'bicubic16');
    rotIml = rotateimage(rotIml, pi/6.1, 'bilinear');
    rotImn = rotateimage(rotImn, pi/6.1, 'nearest');
end

subplot(131);imagesc(rotIm16); axis image; axis off;
title('bicubic16')
subplot(132);imagesc(rotIml); axis image; axis off;
title('bilinear')
subplot(133);imagesc(rotImn); axis image; axis off;
title('nearest')

%%

Im = double(imread('logo.tif'));
[Ny, Nx] = size(Im);
N = min(min(Nx,Ny));
[x,y] = meshgrid(-ceil((Nx-1)/2):floor((Nx-1)/2), ...
-ceil((Ny-1)/2):floor((Ny-1)/2));
mask = (x.^2 + y.^2)<((N-1)/2)^2;
Im = Im.*mask;
[rows, cols] = size(Im);
cx = cols/2;
cy = rows/2;
[X1, Y1] = meshgrid(1:cols, 1:rows); % inimage grid
[X2, Y2] = meshgrid(1:cols, 1:rows); % outimage grid
phi = pi/6;
X1interp = cos(phi)*(X2-cx) - sin(phi)*(Y2-cy) + cx;
Y1interp = sin(phi)*(X2-cx) + cos(phi)*(Y2-cy) + cy;

X1interpback = cos(-phi)*(X2-cx) - sin(-phi)*(Y2-cy) + cx;
Y1interpback = sin(-phi)*(X2-cx) + cos(-phi)*(Y2-cy) + cy;
rotIm = interp2(X1, Y1, Im, X1interp, Y1interp, 'bicubic16');
backrotIm = interp2(X1, Y1, rotIm, X1interpback, Y1interpback, 'bicubic16');
figure(27); colormap gray;
subplot(221); imagesc(Im,[0 1]);
axis image; colorbar; title('orig Im')
subplot(222); imagesc(rotIm,[0 1]);
axis image; colorbar; title('rotated Im')
subplot(223); imagesc(backrotIm,[0 1]);
axis image; colorbar; title('backrotated Im')
nansum(nansum((backrotIm-Im).*(backrotIm-Im)))




