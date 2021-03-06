Im = zeros(64,64);
Im(20,20) = 1; Im(50,30) = 1; Im(25,50) = 1;
SE4 = [0 1 0; 1 1 1; 0 1 0];
SE8 = ones(3,3);
Im_d4 = imdilate(Im, SE4);
Im_d8 = imdilate(Im, SE8);

Im_10d4 = imdilate(Im_d4, SE4);
Im_10d8 = imdilate(Im_d8, SE8);
Im_5oct = imdilate(Im_d4, SE4);

for x = 1:9
    Im_10d4 = imdilate(Im_10d4, SE4);
    Im_10d8 = imdilate(Im_10d8, SE8);
    if x <= 4
        Im_5oct = imdilate(Im_5oct, SE4);
    else
        Im_5oct = imdilate(Im_5oct, SE8);
    end
    
end


figure(1)
colormap(gray(256))
subplot(2,3,1), imagesc(Im);
axis image; title('Three points');
subplot(2,3,2), imagesc(Im_d4);
axis image; title('1 iter d4');
subplot(2,3,3), imagesc(Im_d8);
axis image; title('1 iter d8');
subplot(2,3,4), imagesc(Im_10d4);
axis image; title('10 iter d4');
subplot(2,3,5), imagesc(Im_10d8);
axis image; title('10 iter d8');
subplot(2,3,6), imagesc(Im_5oct);
axis image; title('5 iter doct');

%%
load nuf4b.mat
binvect = [0:1:255];
histo = hist(nuf4b(:), binvect);
figure(2); colormap(gray(256))
subplot(2,1,1), imagesc(nuf4b, [0 255]);
axis image; title('light image'); colorbar
subplot(2,1,2), plot(binvect, histo, '.-b');
axis tight; title('histogram')

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

figure(3); colormap(gray(256))
imagesc(new);

%%
load nuf5.mat
binvect = [0:1:255];
histo = hist(nuf5(:), binvect);
figure(4); colormap(gray(256))
subplot(2,1,1), imagesc(nuf5, [0 255]);
axis image; title('light image'); colorbar
subplot(2,1,2), plot(binvect, histo, '.-b');
axis tight; title('histogram')

[rows,cols] = size(nuf5);
new = nuf5;
for x = 1:rows
    for y = 1:cols
        if nuf5(x,y) < 170
            new(x,y) = 1;
        else
            new(x,y) = 0;
        end
    end
end

figure(5); colormap(gray(256))
imagesc(new);

Im = new;
SE4 = [0 1 0; 1 1 1; 0 1 0];
SE8 = ones(3,3);
Im_d4 = imdilate(Im, SE4);
Im_d4 = imerode(Im_d4, SE4); %Closing
Im_d4 = imerode(Im_d4, SE4);
Im_d4 = imdilate(Im_d4, SE4); %Opening

figure(6); colormap(gray(256))
subplot(121);imagesc(Im_d4); axis image; title('closing followed by opening')

Im_d4 = imerode(Im, SE4);
Im_d4 = imdilate(Im_d4, SE4); %Opening
Im_d4 = imdilate(Im_d4, SE4);
Im_d4 = imerode(Im_d4, SE4); %Closing

subplot(122);imagesc(Im_d4); axis image; title('opening followed by closing')

%%
load nuf0a.mat
binvect = [0:1:255];
histo = hist(nuf0a(:), binvect);
figure(7); colormap(gray(256))
subplot(2,1,1), imagesc(nuf0a, [0 255]);
axis image; title('light image'); colorbar
subplot(2,1,2), plot(binvect, histo, '.-b');
axis tight; title('histogram')

[rows,cols] = size(nuf0a);
new = nuf0a;
for x = 1:rows
    for y = 1:cols
        if nuf0a(x,y) < 140
            new(x,y) = 1;
        else
            new(x,y) = 0;
        end
    end
end

figure(8); colormap(gray(256))
imagesc(new);

Im = new;
SE4 = [0 1 0; 1 1 1; 0 1 0];
SE8 = ones(3,3);
Im_d4 = imdilate(Im, SE4);
Im_d4 = imerode(Im_d4, SE8); %Closing
Im_d4 = imerode(Im_d4, SE8);
Im_d4 = imdilate(Im_d4, SE8); %Opening

figure(9); colormap(gray(256))
subplot(121);imagesc(Im_d4); axis image; title('closing followed by opening')

Im_d4 = imerode(Im, SE4);
Im_d4 = imdilate(Im_d4, SE8); %Opening
Im_d4 = imdilate(Im_d4, SE8);
Im_d4 = imerode(Im_d4, SE8); %Closing

subplot(122);imagesc(Im_d4); axis image; title('opening followed by closing')

