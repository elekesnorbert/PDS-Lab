close all
clear all

x1 = 1:200;
y1 = 0.3 * x1;

x2 = 1:100;
y2 = -0.7 * x2;

x3 = 1:1000;
y3 = zeros(1, 1000);
y3(100:299) = y1;
y3(300:399) = y2 + 60;
y3(385:400) = 0;

d = 500;
y3(100 + d:299 + d) = y1;
y3(300 + d:399 + d) = y2 + 60;
y3(385 + d:400 + d) = 0;

y4 = y3 + 20 * rand(1, 1000);

xh = 1:1000;
h = fliplr(y3);
h(420:1000) = 0;

xh2 = 1:320;
h2 = zeros(1, 320);
h2(1:320) = h(90:409);

xc = 1:1319;
c = conv(y4, h2);

cor = xcorr(y4, h2);

figure;
subplot(3, 1, 1), plot(x3, y4);
subplot(3, 1, 2), plot(xh2, h2);
subplot(3, 1, 3), plot(xc, c);

figure;
subplot(3, 1, 1), plot(x3, y4);
subplot(3, 1, 2), plot(xh2, h2);
subplot(3, 1, 3), plot(1:length(cor), cor);