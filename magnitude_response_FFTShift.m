close all; clc;
%this code is to plot magnitude response using FFTShift
f_c = 10;
f_s = 332*f_c;
N= 256;
X1 = [(X(N/2+1:N)) X(1:N/2)];
X2 = fftshift(X);
df = f_s/N;
sampleindex = -N/2:N/2-1;
f = sampleindex*df;

%%FFT and IFFT
X = fft(x,N);
x = ifft(X,N);

%%observation on FFTshift and IFFTshift
s = 0:1:7
fftshift(s)
ifftshift(fftshift(s))

figure(1);subplot(2,1,1);stem(sampleindex,abs(X1))
hold on;grid on;
stem(sampleindex,abs(X2),'r')
title('Frequency Domain');xlabel('k');ylabel('|X(k)|');

subplot(2,1,2);stem(f,abs(X1));stem(f,abs(X2),'r')
xlabel('frequencies (f)');ylabel('|X(f)|');grid on;

figure(2);subplot(2,1,1);stem(f,abs(X))
hold on;grid on;
title('FFT');xlabel('k');ylabel('|X[k]|');
subplot(2,1,2);stem(f,abs(x),'r')
title('IFFT');xlabel('k');ylabel('|x[n]|');
grid on;