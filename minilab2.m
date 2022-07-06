filename = 'oddity.wav';
[y,Fs] = audioread(filename);

soundsc(y,Fs);

m = [y(:,1)]'; %this signal is m(t)

figure(); 
plot(m);
xlabel('Time (s)');
ylabel('m(t) signal');
title('m(t) vs time');


mEnergy = sum((m.^2)*(1/Fs));

%------------------End of Part a---------------------%

Ac = 10; 
Fc = 1310*10^3; 

m = resample(m,10^7,44100); 
c = @(t)cos(2*pi*Fc*t);

s = @(t) Ac*c(t).*m;
x = [1:length(m)]; 
newWave = s(x);
 
figure(); 
plot(newWave);
xlabel('Time (s)');
ylabel('s(t) signal');
title('s(t) vs time');

sEnergy = sum(newWave.^2 * (1/10^7));


%------------------End of Part b---------------------%


w = randn(1, length(m));

alpha1 = 0.1; 
alpha2 = 0.5; 

w1 = w * alpha1; 
w2 = w * alpha2;

y1 = w1 + newWave; 
y2 = w2 + newWave; 

figure();
plot(y1); 
xlabel('Time (s)');
ylabel('y1(t) signal with alpha = 0.1'); 
title('y(t) vs time & alpha = 0.1');

figure();
plot(y2); 
xlabel('Time (s)');
ylabel('y(t) signal with alpha = 0.5'); 
title('y(t) vs time & alpha = 0.5');

%------------------End of Part c---------------------%

cwave = c(x);

v1 = y1.*cwave; 
v2 = y2.*cwave; 

figure();
plot(v1); 
xlabel('Time (s)');
ylabel('v(t) signal with alpha = 0.1'); 
title('v(t) vs time & alpha = 0.1');

figure();
plot(v2); 
xlabel('Time (s)');
ylabel('v(t) signal with alpha = 0.5'); 
title('v(t) vs time & alpha = 0.5');

%------------------End of Part e---------------------%


v1lowpass = lowpass(v1,Fs/2,(10^7)); 
v2lowpass = lowpass(v2,Fs/2,(10^7));

figure();
plot(v1lowpass); 
xlabel('Time (s)');
ylabel('lowpass v(t) signal'); 
title('lowpass filter on v(t) & alpha = 0.1');

figure();
plot(v2lowpass); 
xlabel('Time (s)');
ylabel('lowpass v(t) signal'); 
title('lowpass filter on v(t) & alpha = 0.5');

%------------------End of Part f---------------------%

m1hat = resample(v1,44100,10^7);
m2hat = resample(v2,44100,10^7);

figure();
plot(m1hat); 
xlabel('Time (s)');
ylabel('m1hat(t)'); 
title('mhat(t) for alpha=0.1 setting');

figure();
plot(m2hat); 
xlabel('Time (s)');
ylabel('m2hat(t)'); 
title('mhat(t) for alpha=0.5 setting');

%soundsc(m1hat, Fs); 
soundsc(m2hat, Fs);

%------------------End of Part g---------------------%
