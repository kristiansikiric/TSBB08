clear all;
nuf = double(imread('blod256.tif'));
binvect = [0:1:255];
histo = hist(nuf(:), binvect);
figure(1)
colormap(gray(256))
subplot(2,2,1), imagesc(nuf, [0 255]);
axis image; title('image nuf0c'); colorbar
subplot(2,2,2), plot(binvect, histo, '.-b');
axis tight; title('histogram')

nuf_thresh1 = nuf > 80;
subplot(2,2,3), imagesc(nuf_thresh1);
axis image; title('after threshold 1'); colorbar

nuf_thresh2 = nuf > 60;
subplot(2,2,4), imagesc(nuf_thresh2);
axis image; title('after threshold 2'); colorbar
   
figure(2);
colormap(gray(256));
while 1
    e = nuf_thresh1;
    SE8 = ones(3,3);
    d = imdilate(nuf_thresh1, SE8);
    nuf_thresh1 = d .* nuf_thresh2;

    subplot(121);imagesc(nuf_thresh1);
    axis image;
    %pause;
    if nuf_thresh1 == e
        break;
    end
end
nuf_thresh1 = bwareaopen(nuf_thresh1,17);
nuf_thresh1 = imdilate(nuf_thresh1,SE8);
nufFil = imfill(nuf_thresh1,8,'holes');
subplot(122); imagesc(nufFil); axis image;

CC = bwconncomp(nufFil);
ImLabel = labelmatrix(CC);
figure(3);
colormap(colorcube(300));
imagesc(ImLabel); axis image; colorbar;

ImS = bwmorph(ImLabel,'shrink',Inf);
figure(4);
colormap(colorcube(300));
imagesc(ImS); axis image; colorbar;
sum(sum(ImS))

figure(5); colormap(gray(256)); imagesc(nuf); axis image; colorbar;

%%

im = double(imread('blod256.tif'));
pattern = im(25:25+19, 18:18+19);
fact = 0.55;
rescorr = corrc(im, pattern);
threshcorr = rescorr>(max(rescorr(:))*fact);
figure(1)
colormap(gray(256))
subplot(2,2,1), imagesc(im, [0 255]);
axis image; title('original image'); colorbar;
subplot(2,2,2), imagesc(pattern, [0 255]);
axis image; title('pattern'); colorbar;
subplot(2,2,3), imagesc(rescorr);
axis image; title('result corr'); colorbar;
subplot(2,2,4), imagesc(threshcorr);
axis image; title('thresh corr'); colorbar;


S = bwmorph(threshcorr,'shrink',Inf);
figure(2); imagesc(S);
disp(['Corrc ', num2str(sum(sum(S)))])

