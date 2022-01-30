function gk = armijo(f, g, xk)
    
syms x y mk

a = 0.1;
b = 1/2;
k = 1;
dk = -(g(xk(1,k), xk(2,k)));
s = 0.5;

a2 = xk(:,k) + s*b^mk;
f2 = subs(f, [x,y], {a2(1), a2(2)});

f3 = f2 - f(xk(1,k),xk(2,k)) - a * s*b^mk * dk' * (g(xk(1,k), xk(2,k)));

mk = vpasolve(f3, mk);
gk = s * b ^ mk;

end

