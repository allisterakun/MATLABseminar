% Allister Liu
clear; close all; clc;
%%
num = [0 3/7 2/3 1/2];
denom = [1/2 0 1/3 2];

[z,p,~] = tf2zp(num, denom);

figure;
zplane(z,p);
grid;
title("H(z) Pole/Zero Plot");

%%
[h,t] = impz(num, denom, 50);

figure;
stem(t,h);
grid;
title("Impulse Response");
xlabel("n");
ylabel("h[n]");


%%
n1 = 0:99;
x1 = (-3/4).^(n1);

y1 = filter(num, denom, x1);

figure;
stem(n1,y1);
grid;
title("x1 filtered by H via filter");
xlabel("n1");
ylabel("y1[n1]");

%%
[h2,t2] = impz(num, denom, 100);
y2 = conv(h2,x1);
y2 = y2(1:100);
figure;
stem(t2,y2);
grid;
title("x1 filtered by H via convolution");
xlabel("t2");
ylabel("y2[t2]");

%%

fib = zeros(1,100);
fib(1:2) = 1;
for k=3:100
    fib(k) = fib(k-1) + fib(k-2);
end

figure;
semilogy(n1, fib, '.');
grid;
title("Fib Seq");
xlabel("n");
ylabel("Fib Seq");

num3 = [1 0 0];
denom3 = [1 -1 -1];
[h3, t3] = impz(num3, denom3, 100);
y3 = conv(h3, x1);
y3 = y3(1:100);

figure;
stem(t3, y3);
title("Fib Seq conv with x1");
xlabel('n');
ylabel('y3[n]');

