% Allister Liu
clear; close all; clc;

%% Question 1 
t1 = 0:1e-3:2;
f1 = 1e3:50e3;

[T1,F1] = meshgrid(t1,f1);
x1 = sin(2*pi.*T1.*F1);
x1 = sum(x1);


%% Question 2
Fs = 100e3;         % Sampling Frequency
Fpass = 10e3;       % Passband Frequency
Fstop = 20e3;       % Stopband Frequency
Apass = 5;          % Passband Ripple (dB)
Astop = 50;         % Stopband Attenuation (dB)

Wpass = Fpass/(Fs/2);
Wstop = Fstop/(Fs/2); 

n = buttord(Wpass,Wstop,Apass,Astop);

[b, a] = butter(n, Wpass, 'low');
y = filter(b,a,x1);

N = 2^15;
Y = fftshift(abs(fft(y,N)))/N;
f = Fs.*(-N/2:N/2-1)/N;

figure;
plot(f,Y);
title('Butterworth Lowpass Filter');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');


%% Question 3
Fs = 100e3;         % Sampling Frequency
Fstop = 15e3;       % Stopband Frequency
Fpass = 35e3;       % Passband Frequency
Astop = 40;         % Stopband Attenuation (dB)
Apass = 2;          % Passband Ripple (dB)

Wpass = Fpass/(Fs/2);
Wstop = Fstop/(Fs/2); 

n = cheb1ord(Wpass, Wstop, Apass, Astop);

[b, a] = cheby1(n, Apass, Wpass, 'high');
y = filter(b,a,x1);

N = 2^15;
Y = fftshift(abs(fft(y,N)))/N;
f = Fs.*(-N/2:N/2-1)/N;

figure;
plot(f,Y);
title('Chebychev I Highpass Filter');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');


%% Question 4
Fs = 100e3;          % Sampling Frequency
Fpass1 = 5e3;        % First Passband Frequency
Fstop1 = 15e3;       % First Stopband Frequency
Fstop2 = 30e3;       % Second Stopband Frequency
Fpass2 = 45e3;       % Second Passband Frequency
Apass  = 1;          % Passband Ripple (dB)
Astop  = 50;         % Stop Band Attenuation (dB)
Fpass = [Fpass1, Fpass2];
Fstop = [Fstop1, Fstop2];


Wpass = Fpass/(Fs/2);
Wstop = Fstop/(Fs/2); 

n = cheb2ord(Wpass, Wstop, Apass, Astop);

[b, a] = cheby2(n, Apass, Wstop, 'stop');
y = filter(b,a,x1);

N = 2^15;
Y = fftshift(abs(fft(y,N)))/N;
f = Fs.*(-N/2:N/2-1)/N;

figure
plot(f,Y);
title('Chebychev II Bandstop Filter');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');

%% Question 5 
Fs = 100e3;         % Sampling Frequency
Fstop1 = 15e3;      % First Stopband Frequency
Fpass1 = 20e3;      % First Passband Frequency
Fpass2 = 30e3;      % Second Passband Frequency
Fstop2 = 35e3;      % Second Stopband Frequency
Astop  = 50;        % Stopband Attenuation (dB)
Apass  = 5;         % Passband Ripple (dB)
Fpass = [Fpass1, Fpass2];
Fstop = [Fstop1, Fstop2];

Wpass = Fpass/(Fs/2);
Wstop = Fstop/(Fs/2); 

n = ellipord(Wpass, Wstop, Apass, Astop);

[b, a] = ellip(n, Apass, Astop, Wpass, 'bandpass');

y = filter(b,a,x1);

N = 2^15;
Y = fftshift(abs(fft(y,N)))/N;
f = Fs.*(-N/2:N/2-1)/N;

figure
plot(f,Y);
title('Elliptical Bandpass Filter');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');


