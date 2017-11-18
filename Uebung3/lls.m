function [fit, phi, theta] = lls(N,q,m,k_B,T, U_k, I_d)
phi = [];

for idx = 1:N
    phi = [phi, (exp(q * U_k(idx) / (m*k_B*T)) -1)];
end

phi = [phi',ones(N,1)];

% compute inverse
theta = (phi'* phi) \ phi' * I_d(1:N);

fit = theta(1) * (exp(q * U_k(1:N) / (m*k_B*T)) -1) + theta(2);
end

