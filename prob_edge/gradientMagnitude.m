
function [mag,theta]= gradientMagnitude(im, sigma)
    cutoff_frequency=sigma;
    filterG = fspecial('Gaussian',3, cutoff_frequency);%
    imG = imfilter(im,filterG);
    
    im_red=imG(:,:,1);
    im_green=imG(:,:,2);
    im_blue=imG(:,:,3);
    
    Gx=[1, 0, -1; 1, 0, -1; 1, 0, -1];
    Gy=[1, 1, 1; 0, 0, 0; -1, -1, -1];
    
    Ix_R= imfilter(im_red,Gx,'same');
    Iy_R= imfilter(im_red,Gy,'same');
    I_Red = sqrt(double((Ix_R.^2) + (Iy_R.^2)));
  
    Ix_G= imfilter(im_green,Gx,'same');
    Iy_G= imfilter(im_green,Gy,'same');
    I_Green = sqrt(double((Ix_G.^2) + (Iy_G.^2)));
   
    
    
    Ix_B= imfilter(im_blue,Gx,'same');
    Iy_B= imfilter(im_blue,Gy,'same');
    I_Blue = sqrt(double((Ix_B.^2) + (Iy_B.^2)));

    
    
    mag=sqrt(double(I_Red.^2 + I_Green.^2 + I_Blue.^2));
    im_size= size(im);
   theta_Red = atan2(Iy_R,Ix_R);
   theta_Green = atan2(Iy_G,Ix_G);
   theta_Blue = atan2(Iy_B,Ix_B);
    for i=1:im_size(1)
        for j=1:im_size(2)
             if (I_Blue(i,j)> I_Green(i,j)) && (I_Blue(i,j)>I_Blue(i,j))
                theta(i,j)=theta_Red(i,j);
            else if (I_Green(i,j)> I_Blue(i,j)) && (I_Green(i,j)>I_Blue(i,j))
                theta(i,j)=theta_Green(i,j);
                
                else
                    theta(i,j)=theta_Blue(i,j);
                end
        end
    end    
        
end    
%%    


