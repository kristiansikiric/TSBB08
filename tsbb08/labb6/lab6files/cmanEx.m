% Read original image;
im = double(imread('cmanmod.png'));

figure(1)
colormap(gray(256))
subplot(1,1,1); imagesc(im, [0 256]); colorbar;
axis image; axis off;

% Compute derivative images
dfx = [1 0 -1; 2 0 -2; 1 0 -1]/8; % sobelx
fx=conv2(im,dfx, 'valid'); % With valid you get rid of the dark frame
maxv = max(max(abs(fx)))/2;

dfy =dfx';
fy=conv2(im,dfy,'valid');
maxw = max(max(abs(fy)))/2;

figure(2)
colormap(gray(256))
subplot(1,2,1); imagesc(fx, [-maxv maxv]); colorbar('horizontal'); 
axis image; axis off;
title('f_x')
subplot(122); imagesc(fy,[-maxw,maxw]);colorbar('horizontal'); 
axis image; axis off;
title('f_y')

T11 = fx.^2;
T12 = fx.*fy;
T21 = T12;
T22 = fy.^2;

T = [T11 T12; T21 T22];

figure(3)
colormap(gray(256))
subplot(1,2,1); imagesc(T11,[0,6500]); colorbar('horizontal'); 
axis image; axis off;
title('T_1_1')
subplot(122); imagesc(T22,[0,6500]);colorbar('horizontal'); 
axis image; axis off;
title('T_2_2')

sigma=2;
lpH=exp(-0.5*([-9:9]/sigma).^2);
lpH=lpH/sum(lpH); % Horizontal filter
lpV=lpH';         % Vertical filter

T11_LP = conv2(T11,lpH,'valid');
figure(4);colormap(gray(256));
subplot(121); imagesc(T11_LP,[0,2500]);colorbar('horizontal'); 
axis image; axis off;
title('T_1_1 LP')

T22_LP = conv2(T22,lpV,'valid');
figure(4);colormap(gray(256));
subplot(122); imagesc(T22_LP,[0,2500]);colorbar('horizontal'); 
axis image; axis off;
title('T_2_2 LP')

z = T11 - T22 + 1i*2*T12;
zg = fx + 1i*fy;
absz = abs(z);
argz = atan2(T11-T22,2*T12);

[X,Y] = size(argz);
for y = 1: Y
    for x =1 :X
        if argz(y,x) < 0
            argz(y,x) = argz(y,x) + 2*pi;
        end
    end
end

figure(5);
ax1=subplot(121); imagesc(absz);colorbar('horizontal'); 
colormap(ax1,gray(256));
axis image; axis off;
title('abs(z)')

ax2=subplot(122); imagesc(argz);colorbar('horizontal'); 
axis image; axis off;
title('arg(z)')
colormap(ax2,goptab());

