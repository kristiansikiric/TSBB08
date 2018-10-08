 im = double(rgb2gray(imread('chess.png')));
 
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

T11 = fx.^2;
T12 = fx.*fy;
T21 = T12;
T22 = fy.^2;

T = [T11 T12; T21 T22];

T11_LP = conv2(T11,lpH,'same');
T11_LP = conv2(T11_LP,lpV,'same');

T22_LP = conv2(T22,lpH,'same');
T22_LP = conv2(T22_LP,lpV,'same');

T12_LP = conv2(T12,lpH, 'same');
T12_LP = conv2(T12_LP, lpV, 'same');
T21_LP = T12_LP;

T_LP = [T11_LP T12_LP; T21_LP T22_LP];

k=0.05;
tr_T_LP = T11_LP+T22_LP;
det_T = T11_LP.*T22_LP -T12_LP.^2;
cH = det_T - k.*(tr_T_LP).^2;
cHt = cH > 60000;

%figure(2); imagesc(cHt); axis off; colormap(gray(256));

cHmax = imregionalmax(cH);
cHp = cHmax.*cHt;
%figure(3); imagesc(cHp); axis off; colormap(gray(256));
[x,y] = find(cHp);
r = ones(1,sum(sum((cHp)))).*4;
viscircles([y x], r,'EdgeColor','r');



