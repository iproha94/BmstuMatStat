close all;

T = csvread('../data/T.csv');
Y = csvread('../data/Y.csv');

[a] = polyfit(T, Y, 2)

Yt = a(3) + a(2) * T + a(1) * T.^2;

figure
hold on;
plot(T, Y, '.b');
plot(T, Yt, 'g');
hold off;
axis tight; 
grid on;

delta = sqrt(sum((Y - Yt).^2));
fprintf('theta(1) = %.2f\n', a(1));
fprintf('theta(2) = %.2f\n', a(2));
fprintf('theta(3) = %.2f\n', a(3));
fprintf('delta = %.2f\n', delta);