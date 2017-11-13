function coeffs = lls(X,Y,d,task)
phi = [];

for idx = 0:d
    phi = [phi, X.^idx];
end

% compute inverse
if(task == 'd')
        theta = (phi'* phi) \ phi' * Y;
else
        theta = pinv(phi'* phi) * phi' * Y;
end

coeffs = phi*theta;
end

