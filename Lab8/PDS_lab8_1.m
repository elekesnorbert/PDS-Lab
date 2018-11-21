clear all
close all

N = 2000;
fes = 8000;

t = 0 : 1 / fes : (N - 1) / fes;
dtmf = 0.2 * sin(2 * pi * 770 * t) + 0.2 * sin(2 * pi * 1336 * t);

drept = 0.2 * square(2 * pi * 1000/3 * t, 100/3) + 0.2;

generat = dtmf + drept;

figure('name','Semnale');
subplot(3, 1, 1), plot(t, dtmf), title('Semnalul DTMF'), xlabel('Esantioane'), ylabel('Amplitudine');
subplot(3, 1, 2), plot(t, drept), title('Semnalul Dreptunghiular'), xlabel('Esantioane'), ylabel('Amplitudine');
subplot(3, 1, 3), plot(t, generat), title('Semnalul Generat'), xlabel('Esantioane'), ylabel('Amplitudine');

spect_generat = abs(fft(generat))(1:N/2);
f = 0 : fes / N : (N/2 - 1) * fes / N;

figure('name','Spectrul semnalului generat');
stem(f, spect_generat), xlabel('Frecventa [Hz]'), ylabel('Amplitudine');

n = 300;
Wnl1 = 700 / (fes / 2);
Wnh1 = 830 / (fes / 2);
Wnl2 = 1270 / (fes / 2);
Wnh2 = 1400 / (fes / 2);

h = fir1(n, [Wnl1, Wnh1, Wnl2, Wnh2]);

figure('name','Spectrul filtrului');
freqz(h, 1);

filtrat = filter(h, 1, generat);

spect_filtrat = abs(fft(filtrat))(1:N/2);

figure('name', 'Semnalul filtrat');
subplot(2, 1, 1), plot(t, filtrat), title('Semnalul filtrat'), xlabel('Esantioane'), ylabel('Amplitudine');
subplot(2, 1, 2), stem(f, spect_filtrat), title('Spectrul semnalului filtrat'), xlabel('Frecventa [Hz]'), ylabel('Amplitudine'); 
