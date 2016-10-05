function gray = myrgb2gray(rgb) 

gray = im2double(rgb);
gray =  0.29894 .* gray(:,:,1) + 0.58704 .* gray(:,:,2) +  0.11402 .* gray(:,:,3);

endfunction