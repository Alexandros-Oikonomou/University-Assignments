function [a,b,k] = bisection(f, a, b, prec, dist)
    % f: sunartisi
    % a,b: to diastima tis f
    % prec: akribeia tou diastimatos
    % dist: apostasi apo ti dixotomo

    syms x
    k = 1;
    
    while (b(k) - a(k) > prec)
    
        x1(k) = (a(k) + b(k)) / 2 - dist;
        x2(k) = (a(k) + b(k)) / 2 + dist;
    
        if (f(x1(k)) > f(x2(k)))
            a(k + 1) = x1(k);
            b(k + 1) = b(k);
            
        elseif (f(x1(k)) < f(x2(k)))
            a(k + 1) = a(k);
            b(k + 1) = x2(k); 
        end
        k = k + 1;
    end
end

