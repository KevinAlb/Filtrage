function out = mysigma(in,filterSize, sigma)

[row,column] = size(in);
borne = floor(filterSize/2);
for i = 1 + borne : row - borne
  for j = 1 + borne : column - borne
    borneMin = in(i,j) - sigma;
    borneMax = in(i,j) + sigma;
    vector = in(i-borne:i+borne,j-borne:j+borne);
    vector = reshape(vector,1,filterSize^2);
    vector( floor(filterSize^2/2)+1) = [];
    vector = vector(vector >=borneMin & vector <= borneMax);
    out(i-borne,j-borne) = mean(vector);
  end
end

end  
    