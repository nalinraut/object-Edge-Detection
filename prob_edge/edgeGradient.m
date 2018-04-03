function bmap = edgeGradient(im)   
   
   [mag,theta]= gradientMagnitude(im, 1);
   bmap= nonmax(mag,theta);
  
    
    
    
end