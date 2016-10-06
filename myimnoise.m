function out = myimnoise(in, type, a,b) 

out = im2double(in);
switch (type)

  case "salt & pepper"
    bruit = rand(size(in));
    out(bruit <= a/2) = 0;
    out(bruit >= 1 - a/2) = 1;
  
  
  case "gaussian"
    bruit =  (a + randn(size(out)) * b);
    out = out .+ bruit;
    out(out > 1) = 1;
    out(out < 0) = 0;
    
endswitch 

endfunction   