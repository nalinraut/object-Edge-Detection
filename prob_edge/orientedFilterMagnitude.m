
function [mag, theta] = orientedFilterMagnitude(im)
    Sigma=1; % Standard deviaton for Gaussian Filter.
    [NormOfOrientation1,angle1]= NormofGrad(im, Sigma, pi/4,0,10,10); %Taking different orientations of filters
    [NormOfOrientation2,angle2]= NormofGrad(im, Sigma, 0,pi/2, 10,10) 
    [NormOfOrientation3,angle3]= NormofGrad(im, Sigma, 0,pi/4, 10,10) 
    [NormOfOrientation4,angle4]= NormofGrad(im, Sigma, pi/4,pi/4, 10,10) 
    mag_size= size(NormOfOrientation1);
    mag=NormOfOrientation1;
    theta=angle1;
    for i=1:mag_size(1)
        for j=1:mag_size(2)
            mag(i,j) = max(NormOfOrientation1(i,j),max(NormOfOrientation2(i,j),max(NormOfOrientation3(i,j),NormOfOrientation4(i,j))));
            theta(i,j)=max(angle1(i,j),max(angle2(i,j),max(angle3(i,j),angle4(i,j))));
        end
   end
end