%{
C1 = 1;
C2 = 0.9;

p1 = [1 C1];
zeros = roots(p1);

p2 = [1 -C2 0];
poles = roots(p2);

hold on; 
ucirc = exp(1i * linspace(0, 2*pi, 200)); 
figure();
plot(real(ucirc),imag(ucirc), 'k:');
hold on;
plot(zeros,0,'o');
plot(poles(1,1),0,'x');
plot(poles(2,1),0,'x');
xlabel('Re(z)'); 
ylabel('Im(z)'); 
title('Pole-Zero Diagram');
axis equal;
hold off; 

%}
%-------------End of Part D----------------%


wvalues = linspace(-pi,pi,100);
H = @(z)(z+1)./(z.*(z-0.9));

espace = exp(1i*wvalues);
magH = abs(H(espace));

figure();
plot(wvalues,magH);
xlabel('w ∈ -π to π'); 
ylabel('|H(exp(jw)|');
title('Frequency Diagram');


%-------------End of Part E----------------%

%{
wvalues = linspace(-pi,pi,100);
H = @(z)(z+1)./(z.*(z-0.9));

espace = exp(1i*wvalues);
magH = abs(H(espace));

figure();
plot(wvalues,magH);
xlabel('w ∈ -π to π'); 
ylabel('|H(exp(jw)|'); 
title('Frequency Diagram (lowpass filter)');

%These values give us a low pass filter (C1 = 1 and C2 = 0.9)
%}


%-------------End of Part F----------------%

wvalues = linspace(-pi,pi,100);
H = @(z)(z-1)./(z.*(z+0.8));

espace = exp(1i*wvalues);
magH = abs(H(espace));

figure();
plot(wvalues,magH);
xlabel('w ∈ -π to π'); 
ylabel('|H(exp(jw)|'); 
title('Frequency Diagram (c1 = -1 & c2 = -0.8)');

%This clearly looks like a highpass filter

%-------------End of Part H----------------%
