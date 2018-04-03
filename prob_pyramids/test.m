im = im2single(imread('bicycle.bmp'));
cutoff_frequency=5;
filterG = fspecial('Gaussian', cutoff_frequency*4+1, cutoff_frequency);
A1 = imfilter(im,filterG);
A11 = imresize(A1, 0.5, 'nearest');
A2 = imfilter(A11,filterG)
figure(1); imshow(A1);
figure(2); imshow(A2);