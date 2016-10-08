function out = myminmax(in,filterSize) 



[row,column] = size(in);
borne = floor(filterSize/2);

for i = 1 + borne : row - borne
  for j = 1 + borne : column - borne
    fenetre = in(i-borne:i+borne,j-borne:j+borne);
    fenetre = reshape(fenetre,1,filterSize^2);
    fenetre( floor(filterSize^2/2)+1) = [];
    borneMin  = min(min(fenetre));
    borneMax = max(max(fenetre));
    if ( in(i,j) < borneMin)
      out(i-borne,j-borne) = borneMin;
    elseif (in(i,j)  > borneMax)
      out(i-borne,j-borne) = borneMax;
    else
      out(i-borne,j-borne) = in(i,j);
    end
  end
end  


endfunction