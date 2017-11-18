load('exercise3_data.mat');

% e-Funktion geht gegen unendlich ohne Skalierung.
U_k = data(:,1)/1000;
I_d = data(:,2)/1000;

% I_s = theta1, I_offset = theta2
m = 1.5;
q = 1.6022 * 10^(-19);
k_B = physconst('Boltzmann');
T = 293;

% (b)
[fit,phi,theta] = lls(8000, q, m, k_B, T, U_k,I_d);

fig2 = figure();
plot(U_k, I_d, 'g*'); hold on;
plot(U_k, fit, 'b*');
xlabel('U[V]');
ylabel('I(d)[A]');

%(d)
% Für N = 8000
eps = I_d - fit; 
sigma = var(eps);

% Für N = 1000
[fit1,phi1,theta1] = lls(1000, q, m, k_B, T, U_k,I_d);
eps1 = I_d(1:1000) - fit1; 
sigma1 = var(eps1);

% Für N=500
[fit5,phi5, theta5] = lls(500, q, m, k_B, T, U_k,I_d);
eps5 = I_d(1:500) - fit5; 
sigma5 = var(eps5);


%(e)
% Covariance Matrix for N = 500
cov_theta5 = phi5' * sigma5 * phi5;

% Covariance Matrix for N = 1000
cov_theta1 = phi1' * sigma1 * phi1;