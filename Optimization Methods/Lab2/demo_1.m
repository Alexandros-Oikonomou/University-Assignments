% function(decision, f, x0, y0)
% decision == 1 const gk
% decision == 2 minimization of gk
% decision == 3 armijo for gk

%% Steepest Descent
x_1 = steepest_descent(1, f, 1, 1);

x2_1 = steepest_descent(2, f, 1, 1);

x3_1 = steepest_descent(3, f, 1, 1);

%% Newton
xn_1 = newton(1, f, 1, 1);
 
xn2_1 = newton(2, f, 1, 1);

% xn3_1 = newton(3, f, 1, 1);

%% Levenberg-Marquardt
xlm_1 = levenberg_marquardt(1, f, 1, 1);

%xlm2_1 = levenberg_marquardt(2, f, 1, 1);

xlm3_1 = levenberg_marquardt(3, f, 1, 1);
