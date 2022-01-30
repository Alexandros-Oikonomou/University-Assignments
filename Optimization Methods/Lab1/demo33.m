clc
clear
syms x

%% 3. Fibonacci
f1(x) = (x - 3)^2 + (sin(x + 3))^2;
f2(x) = (x - 1) * cos(x/2) + x^2;
f3(x) = (x + 2)^2 + exp(x - 2) * sin(x + 3);
l=0.01;

for i = 1:9
   n = 0;
    while (fibonacci(n) < 8/l)
        n = n + 1;
    end
% [a,b,k] = fibonaccii(f, a, b, prec, n)
% 2.1 
[ak1, bk1, k1(i)] = fibonaccii(f1, -4, 4, 0.001, n);

% 2.2 
[ak2, bk2, k2(i)] = fibonaccii(f2, -4, 4, 0.001, n);

% 2.3 
[ak3, bk3, k3(i)] = fibonaccii(f3, -4, 4, 0.001, n);
l = l + 0.01;
p1(i) = 2*(k1(i)-1);
p2(i) = 2*(k2(i)-1);
p3(i) = 2*(k3(i)-1);
end

x = [0.01 : 0.01: 0.09];
figure

plot(x, p1,x, p2,x, p3), xlabel('Μεταβλητη λ'),ylabel('Υπολογισμοί της f')
legend('f1', 'f2', 'f3','Location', 'NorthEast')
title('Αριθμός υπολογισμών της f')
saveas(gcf,'Fibonacci_f.png')


x = [1 : 1: 11];
figure
plot(x, ak1, 'r', x, bk1, 'g'), xlabel('Επαναλήψεις'), ylabel('Τα άκρα της f')
title('Σύγκλιση της f1 στην ελάχιστη τιμή')
saveas(gcf,'Fibonacci_f1_ab.png')

figure
plot(x, ak2, 'r', x, bk2, 'g'), xlabel('Επαναλήψεις'), ylabel('Τα άκρα της f')
title('Σύγκλιση της f2 στην ελάχιστη τιμή')
saveas(gcf,'Fibonacci_f2_ab.png')

figure
plot(x, ak3, 'r', x, bk3, 'g'), xlabel('Επαναλήψεις'), ylabel('Τα άκρα της f')
title('Σύγκλιση της f3 στην ελάχιστη τιμή')
saveas(gcf,'Fibonacci_f3_ab.png')
