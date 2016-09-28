function [out] = sap(in,prob) 

    [row,column] = size(in);
    out = in;
    vectorSize = row*column;
    tirageSize = vectorSize * prob;
    for i = 1 : tirageSize
        randomPixel(1) = round(1 + (row-1) * rand(1));
        randomPixel(2) = round(1 + (column-1) * rand(1));
        if rand(1) <= 0.5
            out(randomPixel(1),randomPixel(2)) = 0;
        else
            out(randomPixel(1),randomPixel(2)) = 255;
        end
            
    end
    
    
        
    

end