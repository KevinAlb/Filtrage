function out = myknn(in, filterSize) 

[row,column] = size(in);
borne = floor(filterSize/2);
out = zeros(row-borne*2,column-borne*2);