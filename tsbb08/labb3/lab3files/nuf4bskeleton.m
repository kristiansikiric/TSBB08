load nuf4b.mat
binvect = [0:1:255];
histo = hist(nuf4b(:), binvect);
% figure(2); colormap(gray(256))
% subplot(2,1,1), imagesc(nuf4b, [0 255]);
% axis image; title('light image'); colorbar
% subplot(2,1,2), plot(binvect, histo, '.-b');
% axis tight; title('histogram')

[rows,cols] = size(nuf4b);
new = nuf4b;
for x = 1:rows
    for y = 1:cols
        if nuf4b(x,y) < 130
            new(x,y) = 1;
        else
            new(x,y) = 0;
        end
    end
end
new = bwmorph(new,'skel',Inf);
new = bwmorph(new,'shrink',5);

figure(3); colormap(gray(256))
imagesc(new); axis image;

m = [0 0 0; 0 1 0; 1 0 0];
n = [0 0 0; 0 0 0; 0 0 0];

new = imerode(new, m).*imerode(new', n);

figure(4); colormap(gray(256))
imagesc(new); axis image;