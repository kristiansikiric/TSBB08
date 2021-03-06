nuf = double(imread('nuf0c.tif'));
binvect = [0:1:255];
histo = hist(nuf(:), binvect);
figure(1)
colormap(gray(256))
subplot(2,2,1), imagesc(nuf, [0 255]);
axis image; title('image nuf0c'); colorbar
subplot(2,2,2), plot(binvect, histo, '.-b');
axis tight; title('histogram')

nuf_thresh1 = nuf > 145;
subplot(2,2,3), imagesc(nuf_thresh1);
axis image; title('after threshold 1'); colorbar

nuf_thresh2 = nuf > 105;
subplot(2,2,4), imagesc(nuf_thresh2);
axis image; title('after threshold 2'); colorbar
   
figure(2);
colormap(gray(256));
while 1
    e = nuf_thresh1;
    SE8 = ones(3,3);
    d = imdilate(nuf_thresh1, SE8);
    nuf_thresh1 = d .* nuf_thresh2;

    imagesc(nuf_thresh1);
    pause;
    if nuf_thresh1 == e
        break;
    end
end
