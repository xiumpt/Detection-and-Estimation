close all; clear all;

A=sqrt(15); phi=0; sig2=15; N=20; fd=0.2;
n=[0:N-1]';

h0=A*cos(2*pi*fd*n+phi);
h1=A*cos(phi);

subplot(1,2,1),stem(n,h0)
xlabel('n'), ylabel('x[n]')
title('h0'), grid
axis([0,20,-15,15]);

subplot(1,2,2),stem(n,h1)
xlabel('n'), ylabel('x[n]')
title('h1'), grid