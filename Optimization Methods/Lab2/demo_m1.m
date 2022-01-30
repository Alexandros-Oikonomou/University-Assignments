% function(decision, f, x0, y0)
% decision == 1 const gk
% decision == 2 minimization of gk
% decision == 3 armijo for gk

%% Steepest Descent
x_m1 = steepest_descent(1, f, -1, -1);

x2_m1 = steepest_descent(2, f, -1, -1);

x3_m1 = steepest_descent(3, f, -1, -1);


%% Newton
xn_m1 = newton(1, f, -1, -1);

xn2_m1 = newton(2, f, -1, -1);

%xn3_m1 = newton(3, f, -1, -1);

%% Levenberg-Marquardt
xlm_m1 = levenberg_marquardt(1, f, -1, -1);

% xlm2_m1 = levenberg_marquardt(2, f, -1, -1);

xlm3_m1 = levenberg_marquardt(3, f, -1, -1);
