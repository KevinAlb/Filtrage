function error = rmse(i1, i2)

[row,column] = size(i1);
error = 0;
for i = 1:row
  for j = 1:column
    error = error + (i2(i,j)-i1(i,j))* (i2(i,j)-i1(i,j));
  end
end
error = error / ( row * column);
error = sqrt(error); 
end 
