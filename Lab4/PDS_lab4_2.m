close all;
clear all;

N = 1024;

PI = 3.14;

f_es = 8000;

t = 0 : 1 / f_es : (N - 1) / f_es;
x = 2 * sin(2 * pi * 50 * t) + 5 * sin(2 * pi *  230 * t);

w = -pi:2*pi/N:pi-2*pi/N;
X = fft(x);

figure;
subplot(2, 1, 1), plot(t, x);
subplot(2, 1, 2), plot(w, fftshift(abs(X)));

n = 10;
Rp = 1;
Rs = 40;

wn = 70 / (f_es / 2);

[b, a] = butter(n, wn);

figure;
freqz(b, a);

x = filter(b, a, x);

X = fft(x);

figure;
subplot(2, 1, 1), 
plot(t, x);
subplot(2, 1, 2), plot(w, fftshift(abs(X)));
