function [] = runThis()
im = imread('cheetah.jpg');
im = rgb2gray(im);
[G,L] = pyramidsGL(im,5);
displayPyramids(G, L)


figure(1);
ha = tight_subplot(2,5,[.01 .01],[.01 .01],[.05 .05]);
for i = 1:5
    axes(ha(i));
    imshow(G{i})
end
for i = 6:10
    axes(ha(i));
    imshow(L{i-5});    
end  
end


function [G, L] = pyramidsGL(im, N)
    G=cell(N,1);
    L=cell(N,1);
    cutoff_frequency=1;
    filterG = fspecial('Gaussian', cutoff_frequency*4+1, cutoff_frequency);
    G{1} = imfilter(im,filterG);
    L{1} = im-G{1};
    
for i= 2 : N
    x = imresize(G{i-1},0.5);
    G{i} = imfilter(x,filterG);
    L{i} = x-G{i};
end
end



function [] = displayPyramids(G, L)
figure(2);
ha = tight_subplot(2,5,[.01 .01],[.05 .05],[.05 .05]);
for i = 1:5
    axes(ha(i));
    imagesc(log(abs(fftshift(fft2(G{i})))))
end
for i = 6:10
    axes(ha(i));
    imagesc(log(abs(fftshift(fft2(L{i-5})))))   
end 
end



