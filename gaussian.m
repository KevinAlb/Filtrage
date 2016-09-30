function [out] = gaussian(in,mean,variance)

[row,column] = size(in);
out = zeros(row,column);
for i = 1:row
  for j = 1:column
    bruit = round(mean - 1 + (256 * variance * randn(1)));
    out(i,j) = in(i,j) + bruit;
    if out(i,j) < 0
      out(i,j) = 0;
    end
    if out(i,j) > 255
      out(i,j) = 255;  
    end
  end
end  

end