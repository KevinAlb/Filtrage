function out = mymean(in,filterSize) 

kernel = (1 / (filterSize * filterSize)) * ones(filterSize,filterSize);
out = conv2(in,kernel,'valid');
 
endfunction