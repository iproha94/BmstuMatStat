close all;
x = csvread('X.csv');

M_min = min(x);
M_max = max(x);
R = range(x);
mu = mean(x);
S2 = var(x);
S = sqrt(S2);
n = length(x);
m = floor(log2(n)) + 2;

fprintf('M_min = %.2f\n', M_min);
fprintf('M_max = %.2f\n', M_max);
fprintf('Range = %.2f\n', R);
fprintf('mu ^(MX) = %.2f\n', mu);
fprintf('S2 ^(DX) = %.2f\n', S2);

[y1, x1] = hist(x, m);

% Нормирование
y1 = y1 / (sum(y1) * (x1(2) - x1(1))); 

step = S/100;
xnorm = (mu - R) : step : (mu + R);

% Функция плотности вероятности нормального распределения
ynormp = normpdf(xnorm, mu, S); 

figure
hold on;
bar(x1, y1, 1, 'b');
plot(xnorm, ynormp, 'r');
hold off;

% Функция распределения вероятностей нормального закона
ynormc = normcdf(xnorm, mu, S); 


xs = mu - .7 * R : R / 100 : mu + .7 * R;

figure
hold on;

% Эмпирическая функция распределения
plot(xs, arrayfun(@(X) sum(x < X)/n, xs), 'b');

% Функция распределения нормальной случайной величины с математическим ожиданием и дисперсией
plot(xnorm, ynormc, 'r'); 
hold off;

