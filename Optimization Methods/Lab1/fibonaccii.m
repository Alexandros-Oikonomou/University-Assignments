function [a,b,k] = fibonaccii(f, a, b, prec, n)
    % f: sunartisi
    % a,b: to diastima tis f
    % prec: akribeia tou diastimatos
    % dist: apostasi apo ti dixotomo

    syms x
    k = 1;
    
    x1(k) = a(k) + fibonacci(n - k - 1) / fibonacci(n - k + 1) * (b(k) - a(k));
    x2(k) = a(k) + fibonacci(n - k) / fibonacci(n - k + 1) * (b(k) - a(k));
        
    for k = 1 : n - 2
        
        if (f(x1(k)) == f(x2(k)))
               x1(k) = x1(k - 1);
               x2(k) = x1(k - 1) + prec / 10;
        end
        
        if (f(x1(k)) > f(x2(k)))
            a(k + 1) = x1(k);
            b(k + 1) = b(k);
            x2(k + 1) = a(k + 1) + fibonacci(n - k - 1) / fibonacci(n - k) * (b(k + 1) - a(k + 1));
            x1(k + 1) = x2(k);
            if (k == n - 2)
                x1(n) = x1(n - 1);
                x2(n) = x1(n - 1) + prec / 10;
                if (f(x1(n)) > f(x2(n)))
                    a(n) = x1(n);
                    b(n) = b(n - 1);
                else
                    a(n) = a(n - 1);
                    b(n) = x2(n);
                end
            end
            
        elseif (f(x1(k)) < f(x2(k)))
            a(k + 1) = a(k);
            b(k + 1) = x2(k);
            x2(k + 1) = x1(k);
            x1(k + 1) = a(k + 1) + fibonacci(n - k - 2) / fibonacci(n - k) * (b(k + 1) - a(k + 1));
            if (k == n - 2)
                x1(n) = x1(n - 1);
                x2(n) = x1(n - 1) + prec / 10;
                if (f(x1(n)) > f(x2(n)))
                    a(n) = x1(n);
                    b(n) = b(n - 1);
                else
                    a(n) = a(n - 1);
                    b(n) = x2(n);
                end
            end
        end
        
    end
    
    
    
end



