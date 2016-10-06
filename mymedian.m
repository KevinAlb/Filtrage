function out = mymedian(in,filterSize) 

[row,column] = size(in);
borne = floor(filterSize/2);
out = zeros(row - borne * 2, column - borne * 2);
for i = 1+borne : row - borne
  for j = 1+borne : column - borne
    vector = in(i-borne:i+borne, j-borne:j+borne);
    vector = reshape(vector,1,filterSize*filterSize);
    out(i - borne, j-borne) = median(vector);
  endfor
endfor  
    

endfunction