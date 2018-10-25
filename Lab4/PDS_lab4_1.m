close all;
clear all;

n = 10;
w = 0.8;
Rp = 1;
Rs = 40;

[b, a] = butter(n, w, 'high');
[d, c] = cheby1(n, Rp, w);
[f, e] = cheby2(n, Rs, w);
[h, g] = ellip(n, Rp, Rs, w);

figure;
freqz(b, a);
title('Butterworth');
figure;
freqz(d, c);
title('Chebysev 1');
figure;
freqz(f, e);
title('Chebysev 2');
figure;
freqz(h, g);
title('Elliptic');




