function out = mygaussian(in,sigma, filterSize)

[row,column] = size(in);
borne = floor(filterSize/2);
out = zeros(row-borne*2,column-borne*2);
kernel = fspecial('gaussian',filterSize,sigma);
out = conv2(in,kernel,'valid');


endfunction