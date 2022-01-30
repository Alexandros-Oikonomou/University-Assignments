function [a,b,k] = bisection_derivatives(f, a, b, n)
    % f: sunartisi
    % a,b: to diastima tis f

    syms x
    k = 1;
    
    x(k) = (a(k) + b(k)) / 2;
    g = diff(f);
    for k = 1 : n - 1
    
        x(k) = (a(k) + b(k)) / 2;
        
        if (g(x(k)) > 0)
            
            a(k + 1) = a(k);
            b(k + 1) = x(k);
            
        else
            
            a(k + 1) = x(k);
            b(k + 1) = b(k);
        end
        k = k + 1;
        x(k) = (a(k) + b(k)) / 2;
        
    end
end

