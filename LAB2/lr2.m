close all;
X = csvread('../data/X.csv');

n = length(X);
gamma = 0.9;
alpha = (1 - gamma) / 2;

mu = mean(X);
s2 = var(X);

fprintf('mu ^(MX) = %.2f\n', mu);
fprintf('s2 ^(DX) = %.2f\n', s2);

mu_up = mu - sqrt(s2 ./ n) .* tinv(1 - alpha, n - 1);
mu_down = mu + sqrt(s2 ./ n) .* tinv(1 - alpha, n - 1);

fprintf('mu up = %.2f\n', mu_up);
fprintf('mu down = %.2f\n', mu_down);

sigma2_up = s2 .* (n - 1) ./ chi2inv(alpha, n - 1);
sigma2_down = s2 .* (n - 1) ./ chi2inv(1 - alpha, n - 1);

fprintf('sigma2 up = %.2f\n', sigma2_up);
fprintf('sigma2 down = %.2f\n', sigma2_down);

N = 1 : n;

M = [];
S = [];
for i=N
    M = [M, mean(X(1:i))];
    S = [S, var(X(1:i))];
end;

M_up = M - sqrt(S ./ N) .* tinv(1 - alpha, N - 1);
M_down = M + sqrt(S ./ N) .* tinv(1 - alpha, N - 1);

S_up = S .* (N - 1) ./ chi2inv(alpha, N - 1);
S_down = S .* (N - 1) ./ chi2inv(1 - alpha, N - 1);

figure
hold on;
plot([N(1), N(end)], [mu, mu], 'm');
plot(N, M, 'g');
plot(N, M_up, 'b');
plot(N, M_down, 'r');
grid on;
hold off;

figure
hold on;
plot([N(1), N(end)], [s2, s2], 'm');
plot(N, S, 'g');
plot(N, S_down, 'b');
plot(N, S_up, 'r');
grid on;
hold off;
