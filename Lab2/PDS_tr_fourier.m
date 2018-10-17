%calcul transformata fourier
 function f = PDS_tr_fourier(x, N)
   f = x * exp(-2j*pi/N*(0:N-1)'*(0:N-1))';
 endfunction
