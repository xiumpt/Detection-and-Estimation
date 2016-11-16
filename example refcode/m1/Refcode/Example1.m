clear;
t=0:0.01:1;
c1 = cos(2*pi*t);
c2 = cos(4*pi*t);
c3 = cos(6*pi*t);
plot(t,c1,'black');hold on
plot(t,c2,'blue');
plot(t,c3,'red');
axis([0,1,-1.5,1.5])
xlabel('t'); ylabel('ci(t)');
title('OFDM orthognoal property')'