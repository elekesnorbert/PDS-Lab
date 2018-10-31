close all 
clear all

N = 1024;

PI = 3.14;

f_es = 8000;

t = 0 : 1 / f_es : (N - 1) / f_es;
x = 2 * sin(2 * pi * 50 * t);
y = 2 * sin(2 * pi * 50 * t) + 10 * sin(2 * pi * 100 * t) + 20 * sin(2 * pi * 200 * t);

th = 0 : 1 / f_es : 0.02;
h = zeros(1, length(th));
h = fliplr(x(1:length(th)));

tc = 1:(length(t)+length(th) - 1);
c = conv(y, h);

figure;
subplot(4, 1, 1), plot(t, x);
subplot(4, 1, 2), plot(t, y);
subplot(4, 1, 3), plot(th, h);
subplot(4, 1, 4), plot(tc, c);