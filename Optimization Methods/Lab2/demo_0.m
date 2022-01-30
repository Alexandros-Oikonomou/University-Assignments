% function(decision, f, x0, y0)
% decision == 1 const gk
% decision == 2 minimization of gk
% decision == 3 armijo for gk

%% Steepest Descent
x_0 = steepest_descent(1, f, 0, 0);

x2_0 = steepest_descent(2, f, 0, 0);

x3_0 = steepest_descent(3, f, 0, 0);

%% Newton
xn_0 = newton(1, f, 0, 0);

xn2_0 = newton(2, f, 0, 0);

xn3_0 = newton(3, f, 0, 0);

%% Levenberg-Marquardt
xlm_0 = levenberg_marquardt(1, f, 0, 0);

%xlm2_0 = levenberg_marquardt(2, f, 0, 0);

xlm3_0 = levenberg_marquardt(3, f, 0, 0);
