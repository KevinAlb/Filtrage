function out = mysnn(in,filterSize) 


[row,column] = size(in);
borne = floor(filterSize/2);

for i = 1 + borne : row - borne
  for j = 1 + borne : column - borne
    moyenne = 0;
    k = i - borne;
    l = j-borne;
    m = i + borne;
    n = j + borne;
    while ( k != m || l != n) 
      if (abs(in(k,l)-in(i,j)) <= abs(in(m,n) - in(i,j)))
        moyenne = moyenne + in(k,l);
      else 
        moyenne = moyenne + in(m,n);
      end
      l++;
      n--;
      if ( l > i+borne)
        k++;
        l = i-borne;
      end
      if ( n < i - borne)
        m--;
        n = i + borne;
      end
    end
    moyenne = moyenne /  floor(filterSize^2/2);
    out(i-borne,j-borne) = moyenne;
  end
end

endfunction
    