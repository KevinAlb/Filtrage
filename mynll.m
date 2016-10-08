function out = mynll(in,filterSize) 

h = sqrt(2)  * std(in(:));
[row,column] = size(in);
borne = (filterSize-1)/2;
num = 1;
for i = 1 + borne : row - borne
  for j = 1 + borne : column - borne
    pond(num,:) = reshape ( in(i-borne: i+borne, j-borne: j+borne), [ 1, filterSize^2]);
    num = num + 1;
  end;
end;

for i = 1+borne: row-borne
  for j = 1+borne: column- borne
    current = reshape(in(i-borne:i+borne,j-borne:j+borne),[1,filterSize^2]);
    z = 0;
    out(i,j) = 0;
    for k = 1:num-1
      w = exp(- (norm(current - pond(k,:))^2) / (h^2) );
      out(i,j) = out(i,j) + pond(k,(filterSize^2+1)/2) * w;
      z = z+w;
    end;
    out(i,j) = out(i,j) / z;
  end;
end;

end;  