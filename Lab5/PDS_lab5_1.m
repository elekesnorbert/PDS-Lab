close all
clear all

tx = 1:1000;

x = zeros(1, 1000);
x(100:200) = 1;
x(600:700) = 1;

x = x + rand(1, 1000);

th = 1:300;

h = zeros(1, 300);
h(100:200) = 1;

ty = 1:1299;

y = conv(x, h);

figure;
subplot(3, 1, 1), plot(tx, x);
subplot(3, 1, 2), plot(th, h);
subplot(3, 1, 3), plot(ty, y);