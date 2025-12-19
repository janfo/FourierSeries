clc;
clear all;


% Define the period and the range for x
T = 0.020;      % Period of the periodic function
x = 0:0.001:0.080; % Range of x values
f=50;
% Define the given piecewise function
%f = @(x) (2 - (x/2).^2).*(x >= 0 & x < 2) + (1).*(x >= -2 & x < 0);
f = @(x) 325.*sin(2.*pi.*f.*x).*( 2.*pi.*f.*x <= pi* ( mod(floor(x/(T/2)),2)==0) .*ceil(x/(T/2))  );
% Number of terms in the Fourier series
N = 15;
% Calculate the Fourier series coefficients (an and bn)
a0 = (2*1/T) * integral(@(x) f(x), 0, T);
an = zeros(1, N);
bn = zeros(1, N);
for n = 1:N    
    an(n) = (2*1/T) * integral(@(x) f(x).*cos(n*pi*x/0.01), 0, T);
    bn(n) = (2*1/T) * integral(@(x) f(x).*sin(n*pi*x/0.01), 0, T);
end
% Create the Fourier series approximation
F = a0/2;
for n = 1:N
    F = F + an(n) * cos(n*pi*x/0.01) + bn(n) * sin(n*pi*x/0.01);
end
% Plot the original function and its Fourier series approximation
figure;
plot(x, f(x), 'b', 'LineWidth', 2, 'DisplayName', 'Original Function');
hold on;
plot(x, F, 'r--', 'LineWidth', 2, 'DisplayName', 'Fourier Series Approximation');
xlabel('x');
ylabel('f(x)');
title('Comparison of Original Function and Fourier Series Approximation');
legend('show');
grid on;

% y = 325*sin(314*t)
%  syms m
%  syms s
%  syms t
% y = 506.9/2+0*cos(1*pi*m/0.01) +  162.50* sin(1*pi*m/0.01)-68.96*cos(2*pi*m/0.01)-13.79*cos(4*pi*m/0.01);

%yy =  206.9/2+0*cos(1*pi*x/0.01) +  162.50* sin(1*pi*x/0.01)-68.96*cos(2*pi*x/0.01)-13.79*cos(4*pi*x/0.01);
%plot(x,yy)
% O = laplace(y)*1/(1+0.01*s)
 %out = ilaplace(O)
 %syms(out,t, x)
% laplace(325*sin(314*t))
