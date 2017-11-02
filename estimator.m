
function Rsa = estimator(i_k, v_k,exp)
% Simple Approach Estimator for Student 1

% Set array size 
Rsa = size(1000);
for N=1:1000;
    sumSa = 0;
    for k=1:N
        sumSa = sumSa + v_k(k,exp)/i_k(k,exp);
    end
    element = sumSa * 1/N;
    Rsa(N) = element;
end
end

