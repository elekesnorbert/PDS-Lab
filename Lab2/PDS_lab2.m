close all
clear all

N = 2048; %numarul esantioanelor

A = 3;
omega = 0.2;
phi = 0;

t = 0:N-1;

x = A * sin(omega * t + phi);

tic
X = PDS_tr_fourier(x, N);
toc

tic
Y = fft(x);
toc

w = -pi : 2 * pi / N : pi - 2 * pi / N;

figure
subplot(3, 1, 1), plot(t, x);
subplot(3, 1, 2), plot(w, fftshift(X));
subplot(3, 1, 3), plot(w, fftshift(Y));