% Run demo to execute all functions
clc
clear
syms x

%% 1.Bisection
f1(x) = (x - 3)^2 + (sin(x + 3))^2;
f2(x) = (x - 1) * cos(x/2) + x^2;
f3(x) = (x + 2)^2 + exp(x - 2) * sin(x + 3);
e=0.0005;

for i = 1:9
% [a,b,k] = bisection(f, a, b, prec, dist)    
% 1.1  
[ak1, bk1, k1(i)] = bisection(f1, -4, 4, 0.01, e);

% 1.2 
[ak2, bk2, k2(i)] = bisection(f2, -4, 4, 0.01, e);

% 1.3 
[ak3, bk3, k3(i)] = bisection(f3, -4, 4, 0.01, e);

e = e + 0.0005;
p1(i) = 2*(k1(i));
p2(i) = 2*(k2(i));
p3(i) = 2*(k3(i));
end


x = [0.0005 : 0.0005 : 0.0045];

figure
plot(x, p1,x, p2,x, p3), xlabel('Μεταβλητη ε'),ylabel('Υπολογισμοί της f')
legend('f1', 'f2', 'f3','Location', 'SouthEast')
title('Αριθμός υπολογισμών της f με σταθερό λ')
saveas(gcf,'Bisection_e.png')
%%

l=0.01;
for i = 1:9
% 1.1 
[ak1, bk1, k1(i)] = bisection(f1, -4, 4, l, 0.001);

% 1.2 
[ak2, bk2, k2(i)] = bisection(f2, -4, 4, l, 0.001);

% 1.3 
[ak3, bk3, k3(i)] = bisection(f3, -4, 4, l, 0.001);

l = l + 0.01;
p1(i) = 2*(k1(i));
p2(i) = 2*(k2(i));
p3(i) = 2*(k3(i));

end


x = [0.01 : 0.01: 0.09];
figure
plot(x, p1,x, p2,x, p3), xlabel('Μεταβλητη λ'),ylabel('Υπολογισμοί της f')
legend('f1', 'f2', 'f3','Location', 'NorthEast')
title('Αριθμός υπολογισμών της f με σταθερό ε')
saveas(gcf,'Bisection_f.png')

x = [1 : 1 : 8];
figure
plot(x, ak1, x, bk1), xlabel('Επαναλήψεις'), ylabel('Τα άκρα της f1')
title('Σύγκλιση της f1 στην ελάχιστη τιμή')
saveas(gcf,'Bisection_f1_ab.png')

figure
plot(x, ak2, x, bk2), xlabel('Επαναλήψεις'), ylabel('Τα άκρα της f2')
title('Σύγκλιση της f2 στην ελάχιστη τιμή')
saveas(gcf,'Bisection_f2_ab.png')

figure
plot(x, ak3, x, bk3), xlabel('Επαναλήψεις'), ylabel('Τα άκρα της f3')
title('Σύγκλιση της f3 στην ελάχιστη τιμή')
saveas(gcf,'Bisection_f3_ab.png')

% x = [1 : 1: 11]
% y = ak1;
% g = bk1;
% plot(x, y, 'r', x, g, 'g')


%gia stathero prec = 0.01 allazo dist < 2 prec
%gia stathero dist = 0.001 allazo prec > 2 dist?
% 
% %[k,ak]  [k,bk]
% 
