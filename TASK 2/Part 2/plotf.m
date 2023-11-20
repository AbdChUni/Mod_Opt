function plotf(target)
    i_start = -100;
    j_start = -100;
    i_end = 100;
    j_end = 100;

    M = zeros(i_end - i_start + 1, j_end - j_start + 1);
    
    for i = i_start:i_end
        for j = j_start:j_end 
            i2 = i - i_start + 1;
            j2 = j - j_start + 1;
            y = target([i,j]);
            M(i2,j2) = y;
        end
    end    
    surf(M)
end