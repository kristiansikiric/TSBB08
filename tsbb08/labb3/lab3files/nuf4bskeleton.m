load nuf4b.mat
binvect = [0:1:255];
histo = hist(nuf4b(:), binvect);
% figure(2); colormap(gray(256))
% subplot(2,1,1), imagesc(nuf4b, [0 255]);
% axis image; title('light image'); colorbar
% subplot(2,1,2), plot(binvect, histo, '.-b');
% axis tight; title('histogram')

[rows,cols] = size(nuf4b);
Im = nuf4b;
for y = 1:rows
    for x = 1:cols
        if nuf4b(y,x) < 130
            Im(y,x) = 1;
        else
            Im(y,x) = 0;
        end
    end
end
skel = bwmorph(Im,'skel',Inf);
skel = bwmorph(skel,'shrink',5);

figure(3); colormap(gray(256))
imagesc(skel); axis image;

m = [0 0 0; 0 1 0; 1 0 0];

endPoint = imerode(skel, m) & imerode(~skel, ~m);

figure(4); colormap(gray(256))
imagesc(endPoint); axis image;

[y, x] = find(endPoint);
[yout, xout] = track10(skel, y,x)
atan2(yout-y,xout-x)
