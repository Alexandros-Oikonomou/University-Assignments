function xk = levenberg_marquardt(decision, f, x0, y0)
syms x y r

k = 1;
xk = [x0; y0];


g = gradient(f);
h = jacobian(g);
mk = max(abs(eig(h))) + 1;
if (decision == 1)
    gk = 0.5;
    while abs((h(xk(1,k), xk(2,k)))) > 0.0001
        dk = -inv(h(xk(1,k), xk(2,k)) + mk * eye(2))* g(xk(1,k), xk(2,k));
        xk(:,k+1) = xk(:,k) + gk * dk;
        k = k + 1;
    end
elseif (decision == 2)
    while abs((h(xk(1,k), xk(2,k)))) > 0.0001
        dk = -inv(h(xk(1,k), xk(2,k)) + mk * eye(2))* g(xk(1,k), xk(2,k));
        ax = xk(:,k) + r*dk;
        q(r) = subs(f, [x,y], {ax(1), ax(2)});
        [a, b, ~] = bisection(q, 0, 5, 0.01, 0.001);
        gk = (a+b)/2;
        xk(:,k+1) = xk(:,k) + gk * dk;
        k = k + 1;
    end
elseif (decision == 3)
    while abs((g(xk(1,k), xk(2,k)))) > 0.0001
        dk = -inv(h(xk(1,k), xk(2,k)) + mk * eye(2))* g(xk(1,k), xk(2,k));
        gk = armijo(f, g, xk);
        xk(:,k+1) = xk(:,k) + gk * dk;
        k = k + 1;
    end
end
end

