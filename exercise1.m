% Aufgabe 3
% scatter(i_k([1:end],1), v_k([1:end],1)); 

% (a)
% Fitting first experiment
Rsa1 = estimator(i_k,v_k,1);
Rls1 = estimator2(i_k,v_k,1);
Rev1 = estimator3(i_k,v_k,1);

plot(Rev1, 'color', 'b'); hold on;
plot(Rls1, 'color', 'g'); hold on;
plot(Rsa1, 'color', 'r'); 

%(b)
for exp=1:200
Rsa = estimator(i_k,v_k,exp);
Rls = estimator2(i_k,v_k,exp);
Rev = estimator3(i_k,v_k,exp);

plot(Rev, 'color', 'b'); hold on; 
plot(Rls, 'color', 'g'); hold on;
plot(Rsa, 'color', 'r'); hold on;
%drawnow
disp(['Exp Nummer:',num2str(exp),'.'])
end

%(d)
% Histogram Nmax for Simple Approach
RsaAll = zeros(200,1000);
for exp=1:200
  Rsa = estimator(i_k,v_k,exp);
  RsaAll(exp,:) = Rsa;
end
histogram(RsaAll(:,1000));


% Histogram Nmax for Least Squares
RlsAll = zeros(200,1000);
for exp=1:200
  Rls = estimator2(i_k,v_k,exp);
  RlsAll(exp,:) = Rls;
end
histogram(RlsAll(:,1000));


% Histogram Nmax for Error in Variables
RevAll = zeros(200,1000);
for exp=1:200
  Rev = estimator3(i_k,v_k,exp);
  RevAll(exp,:) = Rev;
end
histogram(RevAll(:,1000));

%(c)
meanRsa = size(1000);
for col=1:1000
    meanRsa(col) = mean(RsaAll(:,col));
end
plot(meanRsa);

meanRls = size(1000);
for col=1:1000
    meanRls(col) = mean(RlsAll(:,col));
end
plot(meanRls);

meanRev = size(1000);
for col=1:1000
    meanRev(col) = mean(RevAll(:,col));
end
plot(meanRev);