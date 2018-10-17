clear all
close all

N = 100;

A = 0.5;
f = 50;
omega = 2 * pi * f;
phi = 0;

t = 1:1:N;

x = A * sinc(omega * t + phi);

x(20:100) = 0;

X = fft(x);

figure;
subplot(1, 2, 1), plot(t, x);
subplot(1, 2, 2), plot(t, X);

ftj = fir1(40, 0.1);
fts = fir1(40, 0.1, 'high');
ftb = fir1(40, [0.1, 0.49]);
fob = fir1(40, [0.1, 0.49], 'stop');

figure;
freqz(ftj);
figure;
freqz(fts);
figure;
freqz(ftb);
figure;
freqz(fob);
