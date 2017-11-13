% Aufgabe 3
load('exercise2_data.mat');

I_d = data(:,2);
U = data(:,1);

%(a)
fig = figure();
plot(U, I_d,'g*');
hold on; 
xlabel('U');
ylabel('I(d)');

%(d)
Y = I_d;
X = U; 

% result for normal Inverse with \
result = lls(X,Y,4,  'd');

%(e) time: 0.016002
tic
resultPseudo = lls(X,Y,4, 'e');
toc

fig1 = figure();
plot(U, I_d, 'g*'); hold on;
plot(X, result, 'b*')


%(f)
% Rescale U and I_d
% 0.019218
tic
Yscaled = I_d/1000;
Xscaled = U/1000;

% call linear least squares with Scales values, Polynom degree: 4 and with
% task term f for pseudo inverse 
resultScaled = lls(Xscaled,Yscaled,4,'f');
toc

fig2 = figure();
plot(Xscaled, Yscaled , 'g*'); hold on;
plot(Xscaled, resultScaled, 'b*');
xlabel('U[V]');
ylabel('I(d)[A]');







%%%% Notes %%%%%%%

%(c)
% y=mx+b 
% p1(x1,y1) , p2(x2,y2)
% y1 = m*x1 + b , y2 = m*x2 + b

% [y1,y2] = [x1 1, x2 1][m b]
%   Y     =     H      *   phi
%   phi     =   inv(H)   *   Y

% For more than 2 Datapoints, add transponent
% phi       =   inv(H'*H)*H'*Y
   

% % Polynom 2. Grades mit polyfit
% p=polyfit(U,I_d,2);
% plot(p);
% 
% x2 = 0:3:780;
% y2 = polyval(p,x2);
% figure
% plot(U,I_d,'g*',x2,y2);


% check results with polyfit
% p=polyfit(Xscaled,Yscaled,4);
% 
% x2 = 0:0.1:0.8;
% y2 = polyval(p,x2);
% figure
% plot(Xscaled,Yscaled,'g*',x2,y2, 'b*');
