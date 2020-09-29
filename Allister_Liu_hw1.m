clear all; close all; clc;
%% Problem 1 
a = log(exp(9));
b = (asin(exp(-9)))*(10^4);
c = log10(2*pi/9);
d = 9+1j;
columnVector = [a; b; c; d];

%% Problem 2
real_d = real(d);
imag_d = imag(d);
mag_d = abs(d);
phase_d = angle(d);
rowVector = [real_d imag_d mag_d phase_d];

%% Problem 3
cxr = columnVector * rowVector;
rxc = rowVector * columnVector;

%% Problem 4
r2c = transpose(rowVector);
elementwiseProduct = r2c .* columnVector;
rep = repmat(elementwiseProduct, 1, 4);

%% Problem 5
A = cxr * rep;
B = cxr .* rep;
C1 = cxr.';
C2 = rep.';
D1 = inv(cxr + eye(4));
D2 = inv(rep + eye(4));
E1 = cxr^2;
E2 = rep^2;

%% Problem 6
n = real(fix(rxc));
Vec1 = linspace(1, n, 1000);
Vec2 = 1:0.1:n;
