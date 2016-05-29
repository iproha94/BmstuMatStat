close all;
x = csvread('../data/X.csv');

n = length(x);
gamma = 0.9;
alpha = (1 - gamma) / 2;

mu = mean(x);
S2 = var(x);

fprintf('mu ^(MX) = %.2f\n', mu);
fprintf('S2 ^(DX) = %.2f\n', S2);

mu_up = mu - sqrt(S2 ./ n) .* tinv(1 - alpha, n - 1);
mu_down = mu + sqrt(S2 ./ n) .* tinv(1 - alpha, n - 1);

fprintf('mu up = %.2f\n', mu_up);
fprintf('mu down = %.2f\n', mu_down);

sigma2_up = S2 .* (n - 1) ./ chi2inv(alpha, n - 1);
sigma2_down = S2 .* (n - 1) ./ chi2inv(1 - alpha, n - 1);

fprintf('sigma2 up = %.2f\n', sigma2_up);
fprintf('sigma2 down = %.2f\n', sigma2_down);