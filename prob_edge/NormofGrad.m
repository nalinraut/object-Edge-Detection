function [Norm,angle]= NormofGrad(im, Sigma, thetaX,thetaY, Nx,Ny)


Nx2 =Nx;
Nx1=Nx2;
Ny2=Ny;
Ny1=Ny2; 
Sigmay1=Sigma;
Sigmax2= Sigma;
Sigmax1=Sigmax2; 
Sigmay2= Sigmay1;
thetaX=thetaY;
Theta2=thetaX;
Theta1=Theta2; 

im_Red=im(:,:,1);
im_Green=im(:,:,2);
im_Blue=im(:,:,3);

%Calculate the gradient on x
filterx=d2dgauss(Nx1,Sigmax1,Nx2,Sigmax2,Theta1)

Ix_Red = conv2(im_Red,double(filterx),'same');
Ix_Green = conv2(im_Green,double(filterx),'same');
Ix_Blue = conv2(im_Blue,double(filterx),'same');figure(2);imshow(Ix_Blue);

% Caculate the gradient on y
filtery = d2dgauss(Ny1,Sigmay1,Ny2,Sigmay2,Theta2)
 
Iy_Red = conv2(im_Red,double(filtery),'same'); 
Iy_Green = conv2(im_Green,double(filtery),'same');
Iy_Blue = conv2(im_Blue,double(filtery),'same');

%Norm of Channeled Images
I_Red = sqrt(double(Ix_Red.^2+Iy_Red.^2));
I_Green = sqrt(double(Ix_Green.^2+Iy_Green.^2));
I_Blue = sqrt(double(Ix_Blue.^2+Iy_Blue.^2));
im_size=size(im)
%greatest = max(sum(I_Red), sum(I_Green), sum( I_Blue)) ;
theta_Red = atan2(Iy_Red,Ix_Red);
theta_Green = atan2(Iy_Green,Ix_Green);
theta_Blue = atan2(Iy_Blue,Ix_Blue);

for i=1:im_size(1)
        for j=1:im_size(2)
            if (I_Red(i,j)> I_Green(i,j)) && (I_Red(i,j)>I_Blue(i,j))
                angle(i,j)=theta_Red(i,j);
            else if (I_Green(i,j)> I_Red(i,j)) && (I_Green(i,j)>I_Blue(i,j))
                angle(i,j)=theta_Green(i,j);
                
                else
                    angle(i,j)=theta_Blue(i,j);
                end
            end
        end
       
    end    


% Get Final norm of gradient
Norm= sqrt(double(I_Red.^2 + I_Green.^2 + I_Blue.^2));

end

