close all; clc;
%this code is to take N-point DFT and plotting magnitude response of FFT
f_c = 10;
f_s = 332*f_c;
t = 0:1/f_s:2-1/f_s;
x = cos(2*pi*f_c*t);
%%N-point FFT
N = 256;
X = fft(x,N);
x(1) %DC component of the FFT decompoition is present at iindex 1
abs(X(8:10)) %10Hz cosine signal will register a spike at 8t sample (10/1.25-8) located at index 9
%%Computing frequency axis for plotting
df = f_s/N;
sampleindex = 0:N-1;
f = sampleindex*df;

nyquistindex = N/2+1;
pnf = X(nyquistindex-2 : nyquistindex+2).'

subplot(3,1,1)
plot(t,x);hold on;grid on;
title('x[n]=cos(2/pi10t)')
xlabel('t=nT_s')
ylabel('x[n]')

subplot(3,1,2)
stem(sampleindex,abs(X))
title('X[k]')
xlabel('k')
ylabel('|X(k)|')
grid on;

subplot(3,1,3)
stem(f,abs(X))
title('X[f]')
xlabel('frequencies (f)')
ylabel('|X(f)|')
grid on;