clear all
close all

N = 1024;

f_es = 8000;

t = 0 : 1 / f_es : (N-1) / f_es;

x = 5 * sin(2 * pi * 50 * t) + 10 * sin(2 * pi * 230 * t);

X = fft(x);
w = -pi : 2 * pi / N : pi - 2 * pi / N;

figure;
subplot(2, 1, 1), plot(t, x);
subplot(2, 1, 2), plot(w, fftshift(abs(X)));

wn = 230 / (f_es / 2);
n = 120;

h = fir1(n, wn, 'high');

figure;
freqz(h, 1);

x = filter(h, 1, x);

X = fft(x);

figure;
subplot(2, 1, 1), plot(t, x);
subplot(2, 1, 2), plot(w, fftshift(abs(X)));