function out = myknn(in, filterSize, k) 

[row,column] = size(in);
borne = floor(filterSize/2);
for i = 1 + borne : row - borne
  for j = 1 + borne : column - borne
    vector = reshape(in(i-borne:i+borne,j-borne:j+borne),1,filterSize^2);
    vector( floor(filterSize^2/2)+1) = [];
    comp = abs(vector - in(i,j));
    moyenne = 0;
    for ite = 1 : k
      [temp,indice] = min(comp);
      moyenne = moyenne + vector(indice);
      vector(indice) = [];
      comp(indice) = [];
    end
    moyenne = moyenne / k;
    out(i-borne,j-borne) = moyenne;
  end
end
end  
      
    
    