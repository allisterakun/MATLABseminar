% Allister Liu
% Matlab section C
% February 5th 2020

clear all; close all; clc;

%% Question 1 

% a)
x = linspace(0, 1, 100);
y = exp(x);
% plot(x, y);

% b)
trap = trapz(x, y);
rect = sum(y) * (x(2)-x(1));

% c)
cumtrap = cumtrapz(x, y);
cumrect = cumsum(y) * (x(2)-x(1));

% d)
dydx = diff(y)./diff(x);
%d2ydx2 = diff(dydx)./diff(x);

%e)
Q = [0 1 2 3 4 5];
W = circshift(A, 3);

%% Question 2

% a)
M = 1:100;
A = reshape(M, 10, 10);

% b)
B = magic(10);
C = diag(diag(B));

% c)
B(:,2) = flipud(B(:,2));

% d)
A = fliplr(A);

% e)
cSum = sum(A*B, 1);

% f)
cMean = sum(A.*B, 2) ./ 10;

% g)
A(:, 10) = [];

%% Question 3

% a)
tic
ni = 300;
nj = 500;
for i = 1:ni
    for j = 1:nj
        D(i,j) = (i^2 + j^2)/(i + j +3);
    end
end
nopreloc = [toc];

% b)
tic
ni = 300;
nj = 500;
E = zeros(300, 500);
for i = 1:ni
    for j = 1:nj
        E(i,j) = (i^2 + j^2)/(i + j +3);
    end
end
preloc = [toc];

% c)
tic
p = 1:500;
q = 1:300;
[P, Q] = meshgrid(p, q);
F = X+Y;
meshG = [toc];

table(nopreloc,preloc,meshG)
