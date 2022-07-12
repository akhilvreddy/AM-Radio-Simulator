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

soundsc(m1hat, Fs);
%added a pause for 2 seconds so that there is a break before listenting to
%the other case
pause(2);
soundsc(m2hat, Fs);

