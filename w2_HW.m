%==========================================
% The clot detection problem is recognized as a hypothesis test between the two hypotheses 
% H0: x[n] = A cos[2pifdn + phi] + w[n] (no clot) 
% and H1: x[n] = A cos[phi] + w[n] (clot present) for n = 0, 1, ..., N-1.
% Example of data sets: A =sqrt(15), sig2= 15, fd = 0.2, phi = 0, and N = 20. 
% Please plot the figure of the x[n] with no clot and x[n] with clot present, as the reference figures shown below.
%===========================================
close all; clear all;

A=sqrt(15); phi=0; sig2=15; N=20; fd=0.2;
n=[0:N-1]';

h0=A*cos(2*pi*fd*n+phi)+normrnd(0,sqrt(15),N,1);
h1=A*cos(phi)+normrnd(0,sqrt(15),N,1);

subplot(1,2,1),stem(n,h0);
xlabel('n'), ylabel('x[n]');
title('h0'), grid;
axis([0,20,-15,15]);

subplot(1,2,2),stem(n,h1);
xlabel('n'), ylabel('x[n]');
title('h1'), grid;
axis([0,20,-15,15]);