function bmap = edgeOrientedFilters(im)
[mag, theta] = orientedFilterMagnitude(im);
bmap=nonmax(mag,theta);
end
