function [out] = convertRGB2Gray(in) 

[row,column,comp] = size(in)
out = zeros(row,column);
in(1,1,:)
for i = 1:row
    for j = 1:column  
        out(i,j) = (0.2126 * in(i,j,1)) + (0.7152 * in(i,j,2)) + (0.0722 * in(i,j,3));
    end
end
 
end