function [a,b,k] = golden_section(f, a, b, prec)
    % f: sunartisi
    % a,b: to diastima tis f
    % prec: akribeia tou diastimatos

    syms x
    k = 1;
    g = 0.618;
    
    x1(k) = a(k) + (1 - g) * (b(k) - a(k));
    x2(k) = a(k) + g * (b(k) - a(k));
        
    while (b(k) - a(k) > prec)
    
        if (f(x1(k)) > f(x2(k)))
            a(k + 1) = x1(k);
            b(k + 1) = b(k);
            x2(k + 1) = a(k + 1) + g * (b(k + 1) - a(k + 1));
            x1(k + 1) = x2(k);
            
        elseif (f(x1(k)) < f(x2(k)))
            a(k + 1) = a(k);
            b(k + 1) = x2(k); 
            x2(k + 1) = x1(k);
            x1(k + 1) = a(k + 1) + (1 - g) * (b(k + 1) - a(k + 1));
        end
        k = k + 1;
    end
end


