C1 = 1;
C2 = 0.5;

p1 = [1 C1];
rootsNumerator = roots(p1);

p2 = [1 -C2 0];
rootsDenominator = roots(p2);


hold on; 
ucirc = exp(1i * linspace(0, 2*pi, 200)); 
figure();
plot(real(ucirc),imag(ucirc), 'k:');
hold on;
plot(rootsNumerator,0,'x');
plot(rootsDenominator(1,1),0,'o');
plot(rootsDenominator(2,1),0,'o');
axis equal;
hold off; 

w = linspace(-pi,pi,100);
H = @(z)(z+C1)./(z.*(z-C2));

figure();
DTFT = abs(H(exp(1i*w))); 
plot(DTFT);

