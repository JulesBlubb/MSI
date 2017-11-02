function Rls = estimator2(i_k, v_k,exp)
% Least Squares Estimator
Rls = size(1000);
for N=1:1000
    sum1 = 0;
    sum2 = 0;
    for k=1:N
        sum1 = sum1 + (v_k(k,exp) * i_k(k,exp));
        sum2 = sum2 + (i_k(k,exp)* i_k(k,exp));
    end
    element1 = sum1 * 1/N;
    element2 = sum2 * 1/N;
    Rls(N) = element1/element2;
end
end
