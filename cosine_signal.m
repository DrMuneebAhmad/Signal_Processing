close all;clc;
%this code represents the cosine signal
A = 0.5;
fc = 10;
phase = 30;
fs = 32*fc;
t = 0:1/fs:2-1/fs;
phi = phase*pi/180;
x = A*cos(2*pi*fc*t+phi);

N = 256;
X = 1/N*fftshift(fft(x,N));
df = fs/N;
sampleindex = -N/2:N/2-1;
f = sampleindex*df;

%extracting phase information from FFT result using atan2 function
phase1 = atan2(imag(X),real(X))*180/pi;

%extracting phase information using tolerance threshold
X2 = X;
threshold = max(abs(X))/10000;
X2(abs(X)<threshold)=0;
phase = atan2(imag(X2),real(X2))*180/pi;

%reconstructing signal
x_recon = N*ifft(ifftshift(X),N);
t1 = [0:1:length(x_recon)-1]/fs;

figure;subplot(5,1,1);plot(t,x);title('x(t)=0.5cos(2pi10t+pi/6)');
xlabel('time (t seconds)');ylabel('x(t)');grid on;

subplot(5,1,2);stem(f,abs(X));title('Amplitude Spectrum');
xlabel('f (Hz)');ylabel('|X(k)|');
grid on;

subplot(5,1,3);plot(f,phase1);title('Phase Spectrum')
xlabel('f (Hz)');ylabel('|X(k)|');
grid on;

subplot(5,1,4);stem(f,phase);title('Phase Spectrum')
xlabel('f (Hz)');ylabel('|X(k)|');
grid on;

subplot(5,1,5);plot(t1,x_recon);title('reconstructed signal')
xlabel('time (t seconds)');ylabel('x(t)');grid on;