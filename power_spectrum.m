close all; clc;
%this code plots the frequency and its PSD
A = 1;
fc = 100;
fs = 3000;
ncyl = 3;
t = 0:1/fs:ncyl/fc-1/fs;
x = -A*sin(2*pi*fc*t);

L = length(x);
P = (norm(x)^2)/L;
disp(['Power of the signal from time domain',num2str(P)]);
NFFT = L;
X = fftshift(fft(x,NFFT));
Px = X.*conj(X)/(L^2);
fVals = fs*(-NFFT/2:NFFT/2-1)/NFFT;

subplot(1,2,1);plot(t,x)
title('Sinusoid of frequency f_c = 100 Hz')
xlabel('Time (s)');ylabel('Amplitude')
grid on;

subplot(1,2,2);stem(fVals,Px,'b')
title('PSD')
xlabel('Frequency (Hz)');ylabel('Power')
grid on;