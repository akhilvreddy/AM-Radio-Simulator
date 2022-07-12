
wValues = linspace(-pi,pi,100);
H = @(z)(z-1)./(z.*(z+0.8));

eValues = exp(1i*wValues);
magnitudeH = abs(H(eValues));

figure();
plot(wValues,magnitudeH);
xlabel('w ∈ -π to π'); 
ylabel('|H(exp(jw)|'); 
title('Frequency Diagram (c1 = -1 & c2 = -0.8)');

